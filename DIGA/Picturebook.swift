import UIKit
import MapKit
import CoreLocation
import Amplify
import ChameleonFramework

var friendsArray: [Character] = []

class Picturebook: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var completeLabelView: UILabel!
    var metcount = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
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
                    
                    DispatchQueue.main.async {
                        // tableViewを更新
                        self.tableView.reloadData()
//                        達成率を更新
                        let maxcount = friendsArray.count
                        let meetArray = friendsArray.filter{
                            $0.meet_status == true
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
        var rareText: String = "レアリティ： "
        
        for i in 1...10 {
            if i <= friendsArray[indexPath.row].rarity {
                rareText += "★"
            } else {
                rareText += "☆"
            }
        }
        
        if friendsArray[indexPath.row].meet_status == false {
            cellImage = UIImage(named: "noImage")
        } else {
            cellImage = UIImage(named: friendsArray[indexPath.row].name)
        }
        
        let color = UIColor(averageColorFrom: cellImage!)
        let array: [String] = color.description.components(separatedBy: " ")
        let redNum = NumberFormatter().number(from: array[1])
        let greenNum = NumberFormatter().number(from: array[2])
        let blueNum = NumberFormatter().number(from: array[3])
        let redAlphaNum = NumberFormatter().number(from: array[4])
        
        var redFloat: CGFloat = 0.0
        var greenFloat: CGFloat = 0.0
        var blueFloat: CGFloat = 0.0
        var alphaFloat: CGFloat = 0.0
        
        func guardColor() {
            guard let red = redNum else { return }
            guard let blue = blueNum else { return }
            guard let green = greenNum else { return }
            guard let alpha = redAlphaNum else { return }
            
            redFloat = CGFloat(truncating: red)
            blueFloat = CGFloat(truncating: blue)
            greenFloat = CGFloat(truncating: green)
            alphaFloat = CGFloat(truncating: alpha)
        }
        
        guardColor()
        
        let newColor = UIColor(red: redFloat + 0.564706, green: greenFloat + 0.30, blue: blueFloat + 0.65, alpha: alphaFloat)
        
        cell.backgroundColor = newColor
        
        nameLabel.text = " " + friendsArray[indexPath.row].name
        nameLabel.textColor = newColor
        nameLabel.font = UIFont(name:"Arial-BoldMT", size: 20.0)
        nameLabel.font = nameLabel.font.withSize(19)
        nameLabel.backgroundColor = UIColor.black
        
        rareLabel.font = UIFont(name:"Arial-BoldMT", size: 14.0)
        rareLabel.text = rareText
        
        placeLabel.font = UIFont(name:"Arial-BoldMT", size: 14.0)
        placeLabel.text = "  出会った場所： \(friendsArray[indexPath.row].first_met_place)"
        
        countLabel.font = UIFont(name:"Arial-BoldMT", size: 14.0)
        countLabel.text = "  出会った回数： \(friendsArray[indexPath.row].met_count)"

        imageView.image = cellImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

