import UIKit
import MapKit
import CoreLocation
import Amplify

var friendsArray: [Character] = []

class Picturebook: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var completeLabelView: UILabel!
    var metcount = 0.0
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
//                        達成率を更新
                        let maxcount = friendsArray.count
                        let meetArray = friendsArray.filter{
                            $0.meet_stauts == true
                        }
                        self.metcount = Double(meetArray.count)
                        var completeRate = 0.0
                        completeRate = self.metcount / Double(maxcount) * 100
                        debugPrint(maxcount, self.metcount, completeRate)
                        self.completeLabelView.text = "達成率：　\(floor(completeRate))％"
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
        let nameLabel = cell.viewWithTag(2) as! UILabel
        let rareLabel = cell.viewWithTag(3) as! UILabel
        let placeLabel = cell.viewWithTag(4) as! UILabel
        let countLabel = cell.viewWithTag(5) as! UILabel
        
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage: UIImage?
        let rareText: String?
        if friendsArray[indexPath.row].meet_stauts == false {
            cellImage = UIImage(named: "noImage")
            
            nameLabel.text = "不明"
            nameLabel.textColor = UIColor.black
            nameLabel.font = nameLabel.font.withSize(12)
            
            rareText = "レアリティ： 不明"
        } else {
            cellImage = UIImage(named: friendsArray[indexPath.row].name)
            
            nameLabel.text = friendsArray[indexPath.row].name
            
            rareText = "レアリティ： \(friendsArray[indexPath.row].rarity)"
            nameLabel.textColor = UIColor.orange
            nameLabel.font = nameLabel.font.withSize(19)
            
        }
        // UIImageをUIImageViewのimageとして設定
        imageView.image = cellImage
        rareLabel.text = rareText
        placeLabel.text = "出会った場所： \(friendsArray[indexPath.row].first_met_place)"
        countLabel.text = "出会った回数： \(friendsArray[indexPath.row].met_count)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
