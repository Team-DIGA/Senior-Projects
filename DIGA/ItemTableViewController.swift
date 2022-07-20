import UIKit
import AWSMobileClient

var itemArray: [Item] = []
let userDataUtils = UserDataUtils()
let itemDataUtils = ItemDataUtils()
let itemRepo = InMemoryItemRepository()


class ItemTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var itemCount: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        itemArray = itemDataUtils.getAllItem() as! [Item]
        self.tableView.reloadData()
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
//        guard let username = AWSMobileClient.default().username else {
//            print("Error: Uncaught username")
//            return
//        }
        itemArray = itemDataUtils.getAllItem() as! [Item]
//        print("itemArray is ", itemArray)
//        let itemNameArray: [String?] = itemArray.name!
//        itemArray = itemDataUtils.getCurrentItem(itemArray: itemNameArray) as! [Item]
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("itemArray is ", itemArray)
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath as IndexPath)
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let nameLabel = cell.viewWithTag(2) as! UILabel
        let effectLabel = cell.viewWithTag(3) as! UILabel
        
        if itemArray[indexPath.row].item_count == 0 {
            imageView.image = UIImage(named: "noitem")
            nameLabel.text = "?????"
            effectLabel.text = "?????"
            
        } else {
            imageView.image = UIImage(named: itemArray[indexPath.row].name)
            nameLabel.text = " " + itemArray[indexPath.row].name + "   x" + String(itemArray[indexPath.row].item_count)

        
            effectLabel.text = " " + itemArray[indexPath.row].effect
            effectLabel.textColor = UIColor.white

        }
        effectLabel.textColor = UIColor.white
        effectLabel.font = UIFont(name:"Arial-BoldMT", size: 14.0)
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont(name:"Arial-BoldMT", size: 20.0)
        nameLabel.font = nameLabel.font.withSize(19)
        nameLabel.addBorder(width: 3, color: .gray, position: .bottom)
//        nameLabel.text = " " + itemArray[indexPath.row].name + "   x" + String(itemArray[indexPath.row].item_count)
//        nameLabel.textColor = UIColor.white
//        nameLabel.font = UIFont(name:"Arial-BoldMT", size: 20.0)
//        nameLabel.font = nameLabel.font.withSize(19)
//        nameLabel.addBorder(width: 3, color: .gray, position: .bottom)
//
//        effectLabel.font = UIFont(name:"Arial-BoldMT", size: 14.0)
//        effectLabel.text = " " + itemArray[indexPath.row].effect
//        effectLabel.textColor = UIColor.white

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番目の行が選択されました。")
        print(itemArray[indexPath.row].name)
        let itemName = itemArray[indexPath.row].name
        if itemArray[indexPath.row].item_count != 0 {
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
            itemRepo.switchBooster(boosterNum: 1)
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
            
//            guard let username = AWSMobileClient.default().username else {
//                print("Error: Uncaught username")
//                return
//            }
//            userDataUtils.deleteUserItem(name: username , itemName: "呪いの面")
            itemDataUtils.updateItem(name: "呪いの面", itemCount: -1)
            
        }
//        guard let username = AWSMobileClient.default().username else {
//            print("Error: Uncaught username")
//            return
//        }
        if itemName != "呪いの面" {
        
            let resultAlert = UIAlertController(title:"\(itemName)を使った！", message: "\(itemArray[indexPath.row].effect)", preferredStyle: .alert)
            let height = NSLayoutConstraint(item: resultAlert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 380)
            resultAlert.view.addConstraint(height)
            
            let backAction: UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {_ in
            })
            
            resultAlert.addAction(backAction)
            
            present(resultAlert, animated: true)
            
//        userDataUtils.deleteUserItem(name: username , itemName: itemName)
        itemDataUtils.updateItem(name: itemName, itemCount: -1)
        
        } else {
            
        }
        
        let UINavigationController = tabBarController?.viewControllers?[2];
        tabBarController?.selectedViewController = UINavigationController;

        }
//        let secondStoryboard = UIStoryboard(name: "MapViewController", bundle: nil)
//        let secondVC = secondStoryboard.instantiateInitialViewController() as! MapViewController
//        let nav = self.navigationController!
//        nav.pushViewController(secondVC, animated: true)
        
            
    }
    
    @IBOutlet weak var tableView: UITableView!

    
}
