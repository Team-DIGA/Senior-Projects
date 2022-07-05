import Amplify
import AWSPluginsCore
import Combine

let friendArray: [String] = [
    "ana",
    "anpanman",
    "arumin",
    "asitaka",
    "baikinman",
    "bejiita",
    "blook",
    "bou",
    "carrepanman",
    "cheeze",
    "cririn",
    "cyopper",
    "donarud",
    "doraemon",
    "dorami",
    "eluza",
    "eren",
    "eriko",
    "exeid",
    "flankey",
    "gokuu",
    "guufyye",
    "hauru",
    "inoduke",
    "jyian",
    "luffy",
    "mickey",
    "mikasa",
    "minnie",
    "nakkuruz",
    "nami",
    "nausika",
    "nezuko",
    "nobita",
    "pikkoro",
    "puyo",
    "robin",
    "san",
    "sanji",
    "shadow",
    "sizuka",
    "sonic",
    "syokupanman",
    "tanjiro",
    "teirus",
    "titan",
    "totoro",
    "usop",
    "zenitu",
    "zoro",
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
    func updateData(name: String) {
        getData(name: name)
        updateFriend?.meet_status = true
        guard let updateFriend = updateFriend else {
            print("updateFriend is nil...")
            return
        }
        // mutateで新規メッセージを作成
        Amplify.API.mutate(request: .updateMutation(of: updateFriend, version: 1)) { event in
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
