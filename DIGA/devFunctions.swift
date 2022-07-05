import Amplify
import AWSPluginsCore
import Combine

let friendArray: [String] = [
    "アナ",
    "アンパンマン",
    "アルミン",
    "アシタカ",
    "バイキンマン",
    "ベジータ",
    "ブルック",
    "坊",
    "カレーパンマン",
    "チーズ",
    "クリリン",
    "チョッパー",
    "ドナルド",
    "ドラえもん",
    "ドラミ",
    "エルザ",
    "エレン",
    "エリーザ",
    "エグゼイド",
    "フランキー",
    "悟空",
    "グーフィー",
    "ハウル",
    "伊之助",
    "ジャイアン",
    "ルフィー",
    "ミッキー",
    "ミカサ",
    "ミニー",
    "ナックル",
    "ナミ",
    "ナウシカ",
    "禰󠄀豆子",
    "のび太",
    "ピッコロ",
    "ぷよ",
    "ロビン",
    "サン",
    "サンジ",
    "シャドウ",
    "静香",
    "ソニック",
    "食パンマン",
    "炭治郎",
    "テイルズ",
    "巨人化したエレン",
    "トロロ",
    "ウソップ",
    "善逸",
    "ゾロ",
    "コイル",
    "Shimabu",
    "Abiru",
    "アンミカ",
    "イサージ",
    "ご機嫌な島袋",
    "Masashi"
]

var gotDataArray: [Character] = []
var updateFriend: Character?

struct DataUtils {

    func random() -> Int {
        return Int.random(in: 1..<11)
    }
    
    //名前で絞って1レコード取得
    func getData(name: String) -> DIGA.Character.CodingKeys.Type {
        let semaphore = DispatchSemaphore(value: 0)
        let char = Character.keys
        Amplify.API.query(request: .list(Character.self, where: char.name == name)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let friend):
                    print("Successfully retrieved friend: \(String(describing: friend.first))")
                    updateFriend = friend.first
                    
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
        return char
    }
    
    //全データ取得
    func getAllData() {
        let semaphore = DispatchSemaphore(value: 0)
        // Amplify SDK経由でqueryオペレーションを実行しCharacterの配列を取得
        Amplify.API.query(request: .list(Character.self, where: nil)) { event in
            switch event {
            case .success(let result):
                // GraphQLの場合、Query失敗時のerrorもレスポンスに含まれる
                switch result {
                case .success(let friend):
                    
                    gotDataArray = friend
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
    
    //データ更新
    func updateData(name: String, place:String, met_count_key:Int) {
        getData(name: name)
        updateFriend?.meet_status = true
        updateFriend?.first_met_place = place
        updateFriend?.met_count += 1
        guard let updateFriend = updateFriend else {
            print("updateFriend is nil...")
            return
        }
        // mutateで新規メッセージを作成
        Amplify.API.mutate(request: .updateMutation(of: updateFriend, version: met_count_key+1)) { event in
//          Amplify.API.mutate(request: .updateMutation(of: updateFriend)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let friend):
                    print("Successfully updateed friend: \(friend)")
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    //全データ挿入
    func createAllData() -> Void {
        for name in friendArray {
            let character = Character(name: name, rarity: random(), first_met_place: "no_data", met_count: 0, meet_status: false)
            // mutateで新規メッセージを作成
            Amplify.API.mutate(request: .create(character)) { event in
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
    
//    func deleteAllData() -> AnyCancellable  {
//
//        getAllData()
//
//        for character in gotDataArray {
//        var char = Character(name: "baikinman", rarity: 2, first_met_place: "", met_count: 0, meet_stauts: false)
//        print(char)
//        char.meet_stauts = true
//        print(char)
//            // mutateで新規メッセージを作成
//            let sink = Amplify.API.mutate(request: .update(char))
//            .resultPublisher
//            .sink {
//                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
//                if case let .failure(error) = $0 {
//                    print("Got failed event with error \(error)")
//                } else {
//                    print("else")
//                }
//            }
//            receiveValue: { result in
//                switch result {
//                case .success(let todo):
//                    print("Successfully created todo: \(todo)")
//                case .failure(let error):
//                    print("Got failed result with \(error.errorDescription)")
//                }
//                print("??????????????????????")
//            }
//        }
//        return sink
//    }

}
