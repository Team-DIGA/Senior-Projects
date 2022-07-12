import UIKit
import AWSMobileClient

var itemArray: [Item] = []
let userDataUtils = UserDataUtils()
let itemDataUtils = ItemDataUtils()

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
    
    @IBOutlet weak var tableView: UITableView!

    
}
