import UIKit
import MapKit
import CoreLocation
import Amplify

var friendsArray: [Character] = []

class Picturebook: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchMessage()
    }
    
    func fetchMessage() {
        // Amplify SDK経由でqueryオペレーションを実行しCharacterの配列を取得
        Amplify.API.query(request: .list(Character.self, where: nil)) { event in
            switch event {
            case .success(let result):
                // GraphQLの場合、Query失敗時のerrorもレスポンスに含まれる
                switch result {
                case .success(let friend):
                    friendsArray = friend
                    print("====================================================")
                    print("friendsArray : \(friendsArray)")
                    
                    DispatchQueue.main.async {
                        // tableViewを更新
                        self.tableView.reloadData()
                    }
                case .failure(let graphQLError):
                    // サーバーから返されるエラーはこっち
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                // 通信エラー等の場合はこっち
                print("Failed to create a message", apiError)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath as IndexPath)
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
//        let label = cell.viewWithTag(2) as! UILabel
        
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage: UIImage?
        if friendsArray[indexPath.row].meet_stauts == false {
            cellImage = UIImage(named: "noImage")
        } else {
            cellImage = UIImage(named: friendsArray[indexPath.row].name)
        }
        // UIImageをUIImageViewのimageとして設定
        imageView.image = cellImage
//        label.text = friendsArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
