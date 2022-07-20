//
//  gatyaViewController.swift
//  DIGA
//
//  Created by Kazunori Nakajima on 2022/07/15.
//

import UIKit
import SwiftGifOrigin
import AWSMobileClient

class GatyaViewController: UIViewController{
    
    var user: User!
    @IBOutlet weak var firstGatyaImage: UIImageView!
    @IBOutlet weak var gatyaAnimation: UIImageView!
    @IBOutlet weak var dropItemImage: UIImageView!
    @IBOutlet weak var gatyaButton: UIButton!
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var gtyaLabel: UILabel!
    var counter : Int = 0
    var timer = Timer()
    
   // let closedCapcel: UIImage = UIImage(named: "capcel")!
    
    let itemImageArray: [String] = [
        "€rikoの権化",
        "キャラクターホイホイ",
        "スライムフィーバー",
        "ツバサを授ける",
        "ポテトへの挑戦",
        "まーしの微振動",
        "ヨクツカマール",
        "レガシーは突然に。",
        "山田パーリナイ",
        "呪いの面",
        "大賢者の召喚",
        "魔封波",
    ]
    
    //UI部品の接続
//    @IBOutlet weak var gachaImageView: UIImageView!
//    @IBOutlet weak var capcelImageView: UIImageView!
//    @IBOutlet weak var gachaStartImageView: UIImageView!
//    @IBOutlet weak var lottery1Button: UIButton!
//    @IBOutlet weak var shareButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        guard let username = AWSMobileClient.default().username else {
        print("Error: Uncaught username")
        return
        }
        user = userDataUtils.getUser(name: username) as? User
        
        self.gatyaAnimation.isHidden = true
        self.dropItemImage.isHidden = true
        self.gtyaLabel.isHidden = true
        self.moneyLabel.text = "所持金 " + String(user.money) + "€riko"
    }
    
    @IBAction func didTapGatyaButton(_ sender: UIButton) {
            gatyaButton.isHidden = true
            firstGatyaImage.isHidden = true
            gatyaAnimation.isHidden = true
            dropItemImage.isHidden = true
            gtyaLabel.isHidden = true
        let getItem:String
        
            //所持金確認してOKなら所持金からガチャ代金をひく
            //所持金ないなら金持って出直してこいやと怒る
            //この部分のロジックを後で考える
        if user.money >= 50000 {
            gachaAnimation()
            getItem = gachaResult() as! String
            userDataUtils.updateUserStatus(name: user.name, getExp: 0, getMoney: -50000, getItem: getItem )
            itemDataUtils.updateItem(name: getItem, itemCount: 1)
        } else {
            let Alert = UIAlertController(title: String(
                "所持€rikoが足りないよ。\n€rikoを集めてきて。"
            ), message: "", preferredStyle: .alert)
            
        }
    }
    
    //ガチャの結果を表示する機能
    func gachaResult()-> Any {
        guard let randomItem = self.itemImageArray.randomElement() else {
            return print("randomItemがnilっぽい")
        }
        //結果の表示
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            self.dropItemImage.image = UIImage(named: randomItem)!
            guard let username = AWSMobileClient.default().username else {
            print("Error: Uncaught username")
            return
            }
            self.user = userDataUtils.getUser(name: username) as? User
            self.dropItemImage.isHidden = false
            self.gatyaAnimation.isHidden = true
            self.gatyaButton.isHidden = false
            self.gtyaLabel.isHidden = false
            self.moneyLabel.text = "所持金 " + String(self.user.money) + "€riko"
            self.gatyaButton.setTitle("もう一度ガチャる", for: .normal)
            self.gtyaLabel.text = "\(randomItem)を手に入れた"
            
        }
        return randomItem
    }
    
    func gachaAnimation (){
        
        self.gatyaAnimation.isHidden = false
        gatyaAnimation.loadGif(name: "img-gacha-animation")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.gatyaAnimation.isHidden = true
        self.dropItemImage.isHidden = true
        self.gtyaLabel.isHidden = true
        firstGatyaImage.isHidden = false
        self.moneyLabel.text = "おかね" + String(user.money) + " €riko"
        self.gatyaButton.setTitle("50000€rikoでガチャる", for: .normal)
    }
}
