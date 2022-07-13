import UIKit
import MapKit
import CoreLocation
import Amplify
import ChameleonFramework

var characterArray: [Character] = []

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
                    characterArray = friend
                    print("aaaaaaaa",friend)
                    
                    DispatchQueue.main.async {
                        // tableViewを更新
                        self.tableView.reloadData()
//                        達成率を更新
                        let maxcount = characterArray.count
                        let meetArray = characterArray.filter{
                            $0.have_met == true
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
        return characterArray.count
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
        var rareText: String = "  レアリティ　： "
        
        for i in 1...10 {
            if i <= characterArray[indexPath.row].rarity {
                rareText += "★"
            } else {
                rareText += "☆"
            }
        }
        
        if characterArray[indexPath.row].have_met == false {
            cellImage = UIImage(named: "noImage")
        } else {
            cellImage = UIImage(named: characterArray[indexPath.row].name)
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
        
//        let newColor = UIColor(red: redFloat + 0.564706, green: greenFloat + 0.30, blue: blueFloat + 0.65, alpha: alphaFloat)
        let newColor = UIColor(red: redFloat, green: greenFloat, blue: blueFloat, alpha: alphaFloat)
        
        cell.backgroundColor = newColor
        
        nameLabel.text = " " + characterArray[indexPath.row].name
//        nameLabel.textColor = newColor
//        nameLabel.textColor = UIColor(complementaryFlatColorOf: newColor)
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont(name:"Arial-BoldMT", size: 20.0)
        nameLabel.font = nameLabel.font.withSize(19)
//        nameLabel.backgroundColor = UIColor.white
        nameLabel.addBorder(width: 3, color: .gray, position: .bottom)
        
        
        rareLabel.font = UIFont(name:"Arial-BoldMT", size: 14.0)
        rareLabel.text = rareText
        rareLabel.textColor = UIColor.white
        
        placeLabel.font = UIFont(name:"Arial-BoldMT", size: 14.0)
        placeLabel.text = "  出会った場所： \(characterArray[indexPath.row].first_met_place)"
        placeLabel.textColor = UIColor.white
        
        countLabel.font = UIFont(name:"Arial-BoldMT", size: 14.0)
        countLabel.text = "  出会った回数： \(characterArray[indexPath.row].met_count)"
        countLabel.textColor = UIColor.white

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

enum BorderPosition {
    case top, left, right, bottom
}

extension UIView {

    /// viewに枠線を表示する
    /// - Parameters:
    ///   - width: 太さ
    ///   - color: 色
    ///   - position: 場所
    func addBorder(width: CGFloat, color: UIColor, position: BorderPosition) {
        let border = CALayer()

        switch position {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: width)
            border.backgroundColor = color.cgColor
            self.layer.addSublayer(border)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
            border.backgroundColor = color.cgColor
            self.layer.addSublayer(border)
        case .right:
            border.frame = CGRect(x: self.frame.width - width, y: 0, width: width, height: self.frame.height)
            border.backgroundColor = color.cgColor
            self.layer.addSublayer(border)
        case .bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width)
            border.backgroundColor = color.cgColor
            self.layer.addSublayer(border)
        }
    }
}
