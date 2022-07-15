import UIKit
import AWSMobileClient

var itemArray: [Item] = []
let userDataUtils = UserDataUtils()
let itemDataUtils = ItemDataUtils()
let itemRepo = InMemoryItemRepository()


class ItemTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let username = AWSMobileClient.default().username else {
            print("Error: Uncaught username")
            return
        }
        let userData = userDataUtils.getUser(name: username) as! User
        let itemNameArray: [String?] = userData.items!
        itemArray = itemDataUtils.getCurrentItem(itemArray: itemNameArray) as! [Item]

        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath as IndexPath)
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let nameLabel = cell.viewWithTag(2) as! UILabel
        let effectLabel = cell.viewWithTag(3) as! UILabel
        
        imageView.image = UIImage(named: itemArray[indexPath.row].name)
        nameLabel.text = " " + itemArray[indexPath.row].name
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont(name:"Arial-BoldMT", size: 20.0)
        nameLabel.font = nameLabel.font.withSize(19)
        nameLabel.addBorder(width: 3, color: .gray, position: .bottom)
        
        effectLabel.font = UIFont(name:"Arial-BoldMT", size: 14.0)
        effectLabel.text = " " + itemArray[indexPath.row].effect
        effectLabel.textColor = UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番目の行が選択されました。")
        print(itemArray[indexPath.row].name)
        let itemName = itemArray[indexPath.row].name
        if itemName == "€rikoの権化" {
            itemRepo.switchChara(itemNum: 1)
        } else if itemName == "スライムフィーバー" {
            itemRepo.switchChara(itemNum: 2)
        } else if itemName == "大賢者の召喚" {
            itemRepo.switchChara(itemNum: 3)
        } else if itemName == "ヨクツカマール" {
            itemRepo.changeEasyCap()
        } else if itemName == "まーしの微振動" {
            itemRepo.changeMaashi()
        } else if itemName == "ポテトへの挑戦" {
            let alert = itemRepo.usePotato(view: self)
            present(alert, animated: true)
        } else if itemName == "山田パーリナイ" {
            itemRepo.switchChara(itemNum: 1)
        } else if itemName == "ツバサを授ける" {
            itemRepo.switchBooster(boosterNum: 2)
        } else if itemName == "キャラクターホイホイ" {
            itemRepo.changeHoihoi()
        } else if itemName == "レガシーは突然に。" {
            itemRepo.changeLegacy()
        } else if itemName == "呪いの面" {
            itemRepo.useCursed(view: self)
        } else if itemName == "魔封波" {
            itemRepo.breakCursed()
            
            guard let username = AWSMobileClient.default().username else {
                print("Error: Uncaught username")
                return
            }
            userDataUtils.deleteUserItem(name: username , itemName: "呪いの面")
            
        }
        guard let username = AWSMobileClient.default().username else {
            print("Error: Uncaught username")
            return
        }
        if itemName != "呪いの面" {
        userDataUtils.deleteUserItem(name: username , itemName: itemName)
        } else {
            
        }
        let UINavigationController = tabBarController?.viewControllers?[2];
        tabBarController?.selectedViewController = UINavigationController;

        
//        let secondStoryboard = UIStoryboard(name: "MapViewController", bundle: nil)
//        let secondVC = secondStoryboard.instantiateInitialViewController() as! MapViewController
//        let nav = self.navigationController!
//        nav.pushViewController(secondVC, animated: true)
        
            
    }
    
    @IBOutlet weak var tableView: UITableView!

    
}
