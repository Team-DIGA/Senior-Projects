import Amplify
import AWSPluginsCore
import Combine

var devItemArray: [Item] = []
var devGetItem: Item?

let itemObj: [[String: String]] = [
    ["name": "ヨクツカマール", "rarity": "1", "effect": "キャラクター捕獲確率アップ"],
    ["name": "キャラクターホイホイ", "rarity": "1", "effect": "キャラクター出現数アップ"],
    ["name": "まーしの微振動", "rarity": "1", "effect": "ゲージスピードdown"],
    ["name": "ポテトへの挑戦", "rarity": "2", "effect": "レベル 1up or 1down"],
    ["name": "スライムフィーバー", "rarity": "3", "effect": "スライム大量発生"],
    ["name": "山田さん増殖中", "rarity": "3", "effect": "獲得EXP、獲得€riko 1.5倍"],
    ["name": "ツバサを授ける", "rarity": "3", "effect": "獲得EXP 2倍、獲得€riko 1/4"],
    ["name": "€rikoの権化", "rarity": "4", "effect": "DIGメンバーがMAPに全員集合"],
    ["name": "レガシーは突然に。", "rarity": "4", "effect": "レア度逆転"],
    ["name": "呪いの面", "rarity": "5", "effect": "獲得EXP、捕獲確率、出現数、獲得€riko　1/2"],
    ["name": "ふっかつのじゅもん", "rarity": "5", "effect": "呪いの面を無効化する"],
    ["name": "Yusuke降臨", "rarity": "5", "effect": "伝説のYusukeがMAPに出現"],
]

struct ItemDataUtils {
    
    //名前で絞って1レコード取得
    func getItem(name: String) -> Any {
        let semaphore = DispatchSemaphore(value: 0)
        let itemKeys = Item.keys
        var resultItem: Item?
        Amplify.API.query(request: .list(Item.self, where: itemKeys.name == name)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let item):
                    print("Successfully getItem : \(String(describing: item.first))")
                    guard let gotItem = item.first else {
                        print("Error: Uncaught item")
                        return
                    }
                    resultItem = gotItem
                    semaphore.signal()
                case .failure(let error):
                    print("Got failed result of getItem with \(error.errorDescription)")
                    semaphore.signal()
                }
            case .failure(let error):
                print("Got failed event of getItem with error \(error)")
                
                semaphore.signal()
            }
        }
        semaphore.wait()
        guard let returnItem = resultItem else {
            print("Error: Uncaught returnItem")
            return print("Error")
        }
        return returnItem
    }
    
    //全データ取得
    func getCurrentItem(itemArray: [String?]) -> Any {
        var resultArray: [Item] = []
        // Amplify SDK経由でqueryオペレーションを実行しItemsの配列を取得
        for itemName in itemArray {
            guard let gotItem = itemName else {
                print("Error: Uncaught itemName")
                return print("Error")
            }
            resultArray.append(getItem(name: gotItem) as! Item)
        }
        
        return resultArray
    }
    
    func getAllItem() -> Any {
        let semaphore = DispatchSemaphore(value: 0)
        var allItem: [Item] = []
        // Amplify SDK経由でqueryオペレーションを実行しItemの配列を取得
        Amplify.API.query(request: .list(Item.self, where: nil)) { event in
            switch event {
            case .success(let result):
                // GraphQLの場合、Query失敗時のerrorもレスポンスに含まれる
                switch result {
                case .success(let item):
                    print("Successfuly getAllItem \(item)")
                    allItem = item
                    semaphore.signal()
                case .failure(let graphQLError):
                    // サーバーから返されるエラーはこっち
                    print("Failed to getAllItem with graphql \(graphQLError)")
                    semaphore.signal()
                }
            case .failure(let apiError):
                // 通信エラー等の場合はこっち
                print("Failed to getAllItem with apiError", apiError)
                semaphore.signal()
            }
        }
        semaphore.wait()
        return allItem
    }
    
    //全データ挿入
    func createAllItem() -> Void {
        for item in itemObj {
            
            guard let rarityStr = item["rarity"] else { return }
            guard let rarity = Int(rarityStr) else { return }
            
            let items = Item(name: item["name"]!, rarity: rarity, effect: item["effect"]!)

            // mutateで新規メッセージを作成
            Amplify.API.mutate(request: .create(items)) { event in
                switch event {
                case .success(let result):
                    switch result {
                    case .success(let message):
                        print("Successfully createAllItem the message: \(message)")
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
