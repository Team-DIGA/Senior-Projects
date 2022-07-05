//
//  AddFriendsTestViewController.swift
//  DIGA
//
//  Created by 庄子優太 on 2022/07/01.
//

import UIKit
import Amplify

final class AddFriendsTestViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var rarityTextField: UITextField!
    @IBOutlet weak var firstMetPlaceTextField: UITextField!
    @IBOutlet weak var metCountTextField: UITextField!
    
    let dataUtils = DataUtils()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButton(_ sender: Any) {
        
        guard let name = self.nameTextField.text,
              var rarity = self.rarityTextField.text,
              let first_met_place = self.firstMetPlaceTextField.text,
              var met_count = self.metCountTextField.text else {
            print("Error : There is no input value in the text field...")
            return
        }
        
        print("name: \(name), rarity: \(rarity), first_ met_place: \(first_met_place), met_count: \(met_count)")
        
        // クラッシュ回避のためのif文
        if rarity == "" {
            rarity = "1"
        }
        if met_count == "" {
            met_count = "1"
        }
        
                    
        let character = Character(name: name, rarity: Int(rarity)!, first_met_place: first_met_place, met_count: Int(met_count)!, meet_status: false)
        
        // mutateで新規メッセージを作成
        Amplify.API.mutate(request: .create(character)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let message):
                    print("Successfully created the message: \(message)")
                case .failure(let graphQLError):
                    // サーバーからのエラーの場合はこっち
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                // 通信まわりなどのErrorになった場合はこっち
                print("Failed to create a message", apiError)
            }
        }
        
        self.nameTextField.text = ""
        self.rarityTextField.text = ""
        self.firstMetPlaceTextField.text = ""
        self.metCountTextField.text = ""
        
        self.navigationController?.popViewController(animated: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func createAllData(_ sender: Any) {
        dataUtils.createAllData()
    }
    
    @IBAction func deleteAllFriends(_ sender: Any) {
//        dataUtils.deleteAllData()
    }
    
    @IBAction func getFriend(_ sender: Any) {
        dataUtils.updateData(name: "cririn")
    }
}
