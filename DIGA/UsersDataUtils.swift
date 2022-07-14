//
//  UsersDataUtils.swift
//  DIGA
//
//  Created by Shogo Kanechika on 2022/07/11.
//

import Foundation
import Amplify
import AWSPluginsCore
import Combine

let itemDataUtild = ItemDataUtils()

struct UserDataUtils {

    //名前で絞って1レコード取得
    func getUser(name: String) -> Any {
        let semaphore = DispatchSemaphore(value: 0)
        let userKeys = User.keys
        var resultUser: User?
        Amplify.API.query(request: .list(User.self, where: userKeys.name == name)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let friend):
                    print("Successfully retrieved friend: \(String(describing: friend.first))")
                    guard let gotUser = friend.first else {
                        print("Error: Uncaught user")
                        semaphore.signal()
                        return
                    }
                    resultUser = gotUser
                    semaphore.signal()
                case .failure(let error):
                    print("Got failed result of getUser with \(error.errorDescription)")
                    
                    semaphore.signal()
                }
            case .failure(let error):
                print("Got failed event of getUser with error \(error)")
                
                semaphore.signal()
            }
        }
        semaphore.wait()
        guard let returnUser = resultUser else {
            print("Error: Uncaught returnUser")
            return print("Error")
        }
        return returnUser
    }
    
    func updateUserItem(name: String, itemName: String) {
        //Anyだから暫定でこの書き方。
        var user: User = getUser(name: name) as! User
        let item: Item = itemDataUtild.getItem(name: itemName) as! Item
        
        user.update_count += 1
        user.items! += [item.name]
        print(user)

        // mutateで新規メッセージを作成
        Amplify.API.mutate(request: .updateMutation(of: user, version: user.update_count-1)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let user):
                    print("Successfully updated userItem: \(user)")
                case .failure(let error):
                    print("Got failed result of updateItem with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event of updateItem with error \(error)")
            }
        }
    }
    
    func updateUserLevel(name: String, level: Int) {
        //Anyだから暫定でこの書き方。
        var user: User = getUser(name: name) as! User
        user.update_count += 1
        user.level += level

        Amplify.API.mutate(request: .updateMutation(of: user, version: user.update_count-1)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let user):
                    print("Successfully updated userLevel: \(user)")
                case .failure(let error):
                    print("Got failed result of updateLevel with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event of updateLevel with error \(error)")
            }
        }
    }
    
    
    func updateUserExp(name: String, getExp: Int) {
            //Anyだから暫定でこの書き方。
            var user: User = getUser(name: name) as! User


                print("getExp",getExp)
                print("user.exp before",user.exp)
                user.exp = 10
                print("user.exp after",user.exp)

//            user.items! = []
        print("-----------------user", user)

            // mutateで新規メッセージを作成
            Amplify.API.mutate(request: .updateMutation(of: user, version: nil)) { event in
                switch event {
                case .success(let result):
                    switch result {
                    case .success(let user):
                        print("Successfully updated userExp: (user)")
                    case .failure(let error):
                        print("Got failed result of updateExp with (error.errorDescription)")
                    }
                case .failure(let error):
                    print("Got failed event of updateExp with error (error)")
                }
            }
        }
    
    
    

    // 1件挿入
    func createUser(user: User) -> Void {
        Amplify.API.mutate(request: .create(user)) { event in
        switch event {
            case .success(let result):
                switch result {
                case .success(let message):
                    print("Successfully created user: \(message)")
                case .failure(let graphQLError):
                    // サーバーからのエラーの場合はこっち
                    print("Failed to createUser by graphql \(graphQLError)")
                }
            case .failure(let apiError):
                // 通信まわりなどのErrorになった場合はこっち
                print("Failed to createUser by apiError", apiError)
            }
        }
    }
    
}
