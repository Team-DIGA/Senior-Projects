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
    
    func deleteUserItem(name: String, itemName: String) {
        //Anyだから暫定でこの書き方。
        var user: User = getUser(name: name) as! User
        let item: Item = itemDataUtild.getItem(name: itemName) as! Item
        
        
        user.update_count += 1
        
        guard let itemIndex = user.items?.firstIndex(of: itemName) else {
            print("Error:the item is not found in userTable")
            return  }
        user.items!.remove(at: itemIndex)
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
    

    func updateUserLvAndExp(name: String, myLv: Int, getExp: Int) {

        //Anyだから暫定でこの書き方。
        var user: User = getUser(name: name) as! User
        user.update_count += 1
        user.level += level
        
        print("getExp",getExp)
        print("user.exp before",user.exp)
        user.exp += getExp
        print("user.exp after",user.exp)
        user.level = myLv
        user.items! = []

        // mutateで新規メッセージを作成
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
    
    func updateUserMoney(name: String, getMoney: Int) {
        //Anyだから暫定でこの書き方。
        var user: User = getUser(name: name) as! User
        user.update_count += 1
        user.level += level
        
        print("getMoney",getMoney)
        print("user.money before",user.money)
        user.money += getMoney
        print("user.money after",user.money)
        user.items! = []
        
        // mutateで新規メッセージを作成
        Amplify.API.mutate(request: .updateMutation(of: user, version: user.update_count-1)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let user):
                    print("Successfully updated userExp: \(user)")
                    versionNum = user.syncMetadata.version
                case .failure(let error):
                    print("Got failed result of updateExp with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event of updateExp with error \(error)")
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
