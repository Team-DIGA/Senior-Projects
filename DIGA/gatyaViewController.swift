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

    @IBOutlet weak var firstGatyaImage: UIImageView!
    @IBOutlet weak var gatyaAnimation: UIImageView!
    @IBOutlet weak var dropItemImage: UIImageView!
    @IBOutlet weak var gatyaButton: UIButton!
    
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
        
        self.gatyaAnimation.isHidden = true
        self.dropItemImage.isHidden = true
        self.gtyaLabel.isHidden = true
    }
    
    @IBAction func didTapGatyaButton(_ sender: UIButton) {
            let semaphore = DispatchSemaphore(value: 0)
            gatyaButton.isHidden = true
            firstGatyaImage.isHidden = true
            gatyaAnimation.isHidden = true
            dropItemImage.isHidden = true
            gtyaLabel.isHidden = true
        
            //所持金確認してOKなら所持金からガチャ代金をひく
            //所持金ないなら金持って出直してこいやと怒る
            //この部分のロジックを後で考える
        
            gachaAnimation()
            let getItem = gachaResult()
        
            guard let username = AWSMobileClient.default().username else {
            print("Error: Uncaught username")
            return
            }
            semaphore.signal()
            semaphore.wait()

            userDataUtils.updateUserItem(name: username, itemName: getItem as! String)
        
        
    }
    
    //ガチャの結果を表示する機能
    func gachaResult()-> Any {
        guard let randomItem = self.itemImageArray.randomElement() else {
            return print("randomItemがnilっぽい")
        }
        //結果の表示
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dropItemImage.image = UIImage(named: randomItem)!
            
            self.dropItemImage.isHidden = false
            self.gatyaAnimation.isHidden = true
            self.gatyaButton.isHidden = false
            self.gtyaLabel.isHidden = false
            self.gatyaButton.setTitle("もう一度ガチャる", for: .normal)
            self.gtyaLabel.text = "\(randomItem)を手に入れた"
            
        }
        return randomItem
    }
    
    func gachaAnimation (){
        
        self.gatyaAnimation.isHidden = false
        gatyaAnimation.loadGif(name: "img-gacha-animation")

    }
}
