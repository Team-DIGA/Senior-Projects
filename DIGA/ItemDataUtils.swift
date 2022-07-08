import Amplify
import AWSPluginsCore
import Combine

var devItemArray: [Items] = []
var devGetItem: Items?

let itemObj: [[String: String]] = [
    ["name": "ポーション", "rarity": "5", "effect": "SurelyGet"],
    ["name": "どこでもドア", "rarity": "2", "effect": "GotoLondon"],
    ["name": "スカウター", "rarity": "4", "effect": "IncreasedProbability"],
]

struct ItemDataUtils {

    func random() -> Int {
        return Int.random(in: 1 ..< 11)
    }
    
    //名前で絞って1レコード取得
    func getItem(name: String) -> DIGA.Items.CodingKeys.Type {
        let semaphore = DispatchSemaphore(value: 0)
        let itemKeys = Items.keys
        Amplify.API.query(request: .list(Items.self, where: itemKeys.name == name)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let item):
                    print("Successfully retrieved friend: \(String(describing: item.first))")
                    devGetItem = item.first
                    
                    semaphore.signal()
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    
                    semaphore.signal()
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                
                semaphore.signal()
            }
        }
        semaphore.wait()
        return itemKeys
    }
    
    //全データ取得
    func getAllItem() {
        let semaphore = DispatchSemaphore(value: 0)
        // Amplify SDK経由でqueryオペレーションを実行しItemsの配列を取得
        Amplify.API.query(request: .list(Items.self, where: nil)) { event in
            switch event {
            case .success(let result):
                // GraphQLの場合、Query失敗時のerrorもレスポンスに含まれる
                switch result {
                case .success(let item):
                    
                    devItemArray = item
                    semaphore.signal()
                    
                case .failure(let graphQLError):
                    // サーバーから返されるエラーはこっち
                    print("Failed to getAllData graphql \(graphQLError)")
                    semaphore.signal()
                }
            case .failure(let apiError):
                // 通信エラー等の場合はこっち
                print("Failed to getAllData a message", apiError)
                semaphore.signal()
            }
        }
        semaphore.wait()
    }
    
    //全データ挿入
    func createAllItem() -> Void {
        print("===================================================")
        for item in itemObj {
            
            guard let rarityStr = item["rarity"] else { return }
            guard let rarity = Int(rarityStr) else { return }
            
            let items = Items(name: item["name"]!, rarity: rarity, effect: item["effect"]!)
            
            print("=======================", items)
            // mutateで新規メッセージを作成
            Amplify.API.mutate(request: .create(items)) { event in
                switch event {
                case .success(let result):
                    switch result {
                    case .success(let message):
                        print("Successfully createAllData the message: \(message)")
                    case .failure(let graphQLError):
                        // サーバーからのエラーの場合はこっち
                        print("Failed to createAllData graphql \(graphQLError)")
                    }
                case .failure(let apiError):
                    // 通信まわりなどのErrorになった場合はこっち
                    print("Failed to createAllData a message", apiError)
                }
            }
        }
    }
    
}
