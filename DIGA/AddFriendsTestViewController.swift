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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButton(_ sender: Any) {
        
        guard let name = self.nameTextField.text,
              let rarity = self.rarityTextField.text,
              let first_met_place = self.firstMetPlaceTextField.text,
              let met_count = self.metCountTextField.text else {
            print("Error : There is no input value in the text field...")
            return
        }
        
        print("name: \(name), rarity: \(rarity), first_ met_place: \(first_met_place), met_count: \(met_count)")
                    
        let character = Character(name: name, rarity: Int(rarity)!, first_met_place: first_met_place, met_count: Int(met_count)!)
        
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

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        outputText.text = inputText.text
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
