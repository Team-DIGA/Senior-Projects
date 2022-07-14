//

// ViewController.swift
// DIGA
//
// Created by Rintaro Kimura on 2022/06/29.
//
import UIKit
import RealityKit
import MapKit
import Amplify
import AWSMobileClient

struct testStruct {
    func tests() {
        print("test")
    }
}

func delay(_ delay: Double, closure: @escaping ()->()) {
  DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
    closure()
  }
}

class ARViewController: UIViewController {
    
    var imageValue: String!
    var characterImage: UIImage?

    var characterRarity: Int!
    var characterPlace: String!
    var characterTitle: String!
    var characterMetObj: [String:Int] = [:]
    
    let testUtiols = testStruct()
    
    let uiDesign = UiDesign()
    
    let itemDataUtils = ItemDataUtils()
    let userDataUtils = UserDataUtils()
    let itemRepo = InMemoryItemRepository()
    
    let characterDataUtils = CharacterDataUtils()
    let textArray: [String] = [
        "１万円をあげる",
        "戦いを助ける",
        "口説く",
        "ペアプロをする",
        "ごまをする",
        "きびだんごをあげる",
        "ポ○モンボールを投げる",
        "微振動する",
        "スタバを奢る",
        "デートする",
        "色目をつかう",
        "新しい顔を投げつける",
        "pufpufする"
    ]
    
    var itemTitles:[Item] = []
    
    @IBOutlet weak var gage1: UIView!
    @IBOutlet weak var gage2: UIView!
    @IBOutlet weak var gage3: UIView!
    @IBOutlet weak var gage4: UIView!
    @IBOutlet weak var gage5: UIView!
    @IBOutlet weak var gage6: UIView!
    @IBOutlet weak var gage7: UIView!
    @IBOutlet weak var gage8: UIView!
    @IBOutlet weak var gage9: UIView!
    @IBOutlet weak var gage10: UIView!
    @IBOutlet weak var gage11: UIView!
    @IBOutlet weak var gage12: UIView!
    @IBOutlet weak var gage13: UIView!
    @IBOutlet weak var gage14: UIView!
    @IBOutlet weak var gage15: UIView!
    @IBOutlet weak var gage16: UIView!
    @IBOutlet weak var gage17: UIView!
    @IBOutlet weak var gage18: UIView!
    @IBOutlet weak var gage19: UIView!
    @IBOutlet weak var gage20: UIView!
    @IBOutlet weak var gage21: UIView!
    @IBOutlet weak var gage22: UIView!
    @IBOutlet weak var gage23: UIView!
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var GageStopButton: UIButton!
    
    
    
    @IBOutlet var arView: ARView!
    
    @IBOutlet weak var addFriendButton: UIButton!
    @IBOutlet weak var addFriendButton2: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rarityLabel: UILabel!
    @IBOutlet weak var metCountLabel: UILabel!
    
//    @IBAction func AddFriend2(_ sender: UIButton) {
//        addOrEscape(result: Int)
//    }
//
//    // 前の画面に戻る処理
//    @IBAction func AddFriend(_ sender: UIButton) {
//        addOrEscape(result: Int)
//    }
    
    func addOrEscape(result:Int){
        let arrOfCaptureProbability = [
            [50,55,60,65,70,75,80,85,90,95],
            [45,50,55,60,65,70,75,80,85,90],
            [40,45,50,55,60,65,70,75,80,85],
            [35,40,45,50,55,60,65,70,75,80],
            [30,35,40,45,50,55,60,65,70,75],
            [25,30,35,40,45,50,55,60,65,70],
            [20,25,30,35,40,45,50,55,60,65],
            [15,20,25,30,35,40,45,50,55,60],
            [10,15,20,25,30,35,40,45,50,55],
            [5,10,15,20,25,30,35,40,45,50],
        ]
        let myLevel = 0
        var myLevelZone = 0
            if myLevel <= 5 {
                myLevelZone = 0
            } else if myLevel <= 10 {
                myLevelZone = 1
            } else if myLevel <= 15 {
                myLevelZone = 2
            } else if myLevel <= 20 {
                myLevelZone = 3
            } else if myLevel <= 25 {
                myLevelZone = 4
            } else if myLevel <= 30 {
                myLevelZone = 5
            } else if myLevel <= 35 {
                myLevelZone = 6
            } else if myLevel <= 40 {
                myLevelZone = 7
            } else if myLevel <= 45 {
                myLevelZone = 8
            } else {
                myLevelZone = 9
            }
            
        var captureProbability:Int = arrOfCaptureProbability[characterRarity-1][myLevelZone]
        
        captureProbability += result
        print("アイテム使われる前", captureProbability)
        print("result", result)
        if itemRepo.getEasyCap() {
            captureProbability += 30
            print("アイテム使った後", captureProbability)
            itemRepo.changeEasyCap()
        }
        
        
        
        
//        let randomNum = Int.random(in: 1...characterRarity+1)
        let randomNum = Int.random(in: 1...100)
        if randomNum <= captureProbability {
            guard let metCount = characterMetObj[characterTitle] else {
                print("metCountError")
                return
            }
            characterDataUtils.updateCharacter(name: characterTitle, place: characterPlace, met_count_key:metCount)
            alertFunc(title: "\(characterTitle!)は\n仲間になった！", message: "",addFlag:true)
        } else {
            alertFunc(title: "\( characterTitle!)は\n去っていった！", message: "",addFlag:false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        itemRepo.changeEasyCap()
//        itemRepo.changeMaashi()
//        userDataUtils.updateUserExp(name: AWSMobileClient.default().username!, getExp: 30)

        itemTitles = itemDataUtils.getAllItem() as! [Item]

        view.addSubview(arView)
        view.bringSubviewToFront(addFriendButton)
        view.bringSubviewToFront(addFriendButton2)
        view.bringSubviewToFront(nameLabel)
        view.bringSubviewToFront(rarityLabel)
        view.bringSubviewToFront(metCountLabel)
        
        
        
        view.bringSubviewToFront(gage1)
        view.bringSubviewToFront(gage2)
        view.bringSubviewToFront(gage3)
        view.bringSubviewToFront(gage4)
        view.bringSubviewToFront(gage5)
        view.bringSubviewToFront(gage6)
        view.bringSubviewToFront(gage7)
        view.bringSubviewToFront(gage8)
        view.bringSubviewToFront(gage9)
        view.bringSubviewToFront(gage10)
        view.bringSubviewToFront(gage11)
        view.bringSubviewToFront(gage12)
        view.bringSubviewToFront(gage13)
        view.bringSubviewToFront(gage14)
        view.bringSubviewToFront(gage15)
        view.bringSubviewToFront(gage16)
        view.bringSubviewToFront(gage17)
        view.bringSubviewToFront(gage18)
        view.bringSubviewToFront(gage19)
        view.bringSubviewToFront(gage20)
        view.bringSubviewToFront(gage21)
        view.bringSubviewToFront(gage22)
        view.bringSubviewToFront(gage23)
        view.bringSubviewToFront(imageView)
        view.bringSubviewToFront(resultImage)
        view.bringSubviewToFront(GageStopButton)
        
        self.imageView.frame.origin.x = 250
        self.imageView.frame.origin.y = gage1.top - (imageView.bottom - imageView.top)/2 - 75
        
        if characterTitle! == "コイル" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -0.1, -8)

            let usdzModel = try! Entity.load(named: "coil3")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                usdzModel.playAnimation(animation.repeat())
            }
        } else if characterTitle! == "Amongs" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, 0, -0.1)

            if let usdzModel = try? Entity.load(named: "AMONGS") {
                anchor.addChild(usdzModel)
            }
            arView.scene.anchors.append(anchor)
        } else {
            //オブジェ作成表示
            createObjImage()
        }
        let text1 = textArray[Int.random(in: 0...textArray.count - 1)]
        let text2 = textArray[Int.random(in: 0...textArray.count - 1)]
        addFriendButton.setTitle(text1, for: .normal)
        addFriendButton2.setTitle(text2, for: .normal)
        nameLabel.text = characterTitle
        nameLabel.font = UIFont(name:"Arial-BoldMT", size: 30.0)
        
        var rareText: String = ""
        
        for i in 1...10 {
            if i <= characterRarity {
                rareText += "★"
            } else {
                rareText += "☆"
            }
        }
        
        rarityLabel.text = rareText
        rarityLabel.font = UIFont(name:"Arial-BoldMT", size: 20.0)
        
        guard let characterMetCount = characterMetObj[characterTitle] else { return }
        metCountLabel.text = "出会った回数： \(characterMetCount)"
        metCountLabel.font = UIFont(name:"Arial-BoldMT", size: 20.0)
        
//        let boxAnchor = try! Experience.loadBox()
//        arView.scene.anchors.append(boxAnchor)
        
        
        uiDesign.buttonDesign(button: addFriendButton)
        uiDesign.buttonDesign(button: addFriendButton2)
        
    }
    
    func createObjImage() {
        let anchor = AnchorEntity(world: [0, -0.5, -1])
        let plane = ModelEntity(mesh: .generatePlane(width: 0.5, height: 0.5, cornerRadius: 0.25))
        let box = ModelEntity(mesh: .generateBox(size: simd_make_float3(0.6, 0.2, 0.4)))
        plane.transform = Transform(pitch: 0, yaw: 0, roll: 0)
        box.transform = Transform(pitch: 0, yaw: 1, roll: 0)
        
        if let image = characterImage?.cgImage,
           let texture = try? TextureResource.generate(from: image, options: .init(semantic: nil)) {
            var imageMaterial = UnlitMaterial()
            imageMaterial.baseColor = MaterialColorParameter.texture(texture)
            box.model?.materials = [imageMaterial]
            plane.model?.materials = [imageMaterial]
        }
        
        Task{
            arView.scene.anchors.append(anchor)
            anchor.addChild(plane)
//            anchor.addChild(box)
        }
    }
    
    func alertFunc(title: String, message: String, addFlag:Bool) {
        let alert: UIAlertController =  UIAlertController(title: title,message: message, preferredStyle: UIAlertController.Style.alert)
        
        let backAction:UIAlertAction?
        
        if addFlag {
            backAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) -> Void in
//                let randomNum = Int.random(in: 1...2)
                let randomNum = 1
                if randomNum == 1 {
                    self.alertFunc2()
                } else {
                    self.navigationController?.popViewController(animated: true)
                }
            })
        } else {
            backAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) -> Void in
                    self.navigationController?.popViewController(animated: true)
            })
            
        }
        
        guard let backAction = backAction else {
            print("buckAction is nil")
            return
        }

        alert.addAction(backAction)
        present(alert, animated: true, completion:nil)
    }
    
    
    func alertFunc2(){
        let randomItemNum = Int.random(in: 0...itemTitles.count-1)
        print("itemTitles", itemTitles)
        let alert = UIAlertController(title: String("\(itemTitles[randomItemNum].name)を手に入れた！"), message: "", preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 70, width: 250, height: 250))
        let height = NSLayoutConstraint(item: alert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 380)
        alert.view.addConstraint(height)
        imageView.image = UIImage(named: itemTitles[randomItemNum].name)
        alert.view.addSubview(imageView)
        
        let backAction: UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) -> Void in
            self.navigationController?.popViewController(animated: true)
        })
        
        alert.addAction(backAction)
        present(alert, animated: true)
        
        guard let username = AWSMobileClient.default().username else {
            print("Error: Uncaught username")
            return
        }

        userDataUtils.updateUserItem(name: username, itemName: itemTitles[randomItemNum].name)
        
    }
    
    
    //ここからミニゲーム
    
   
   
    
    override func viewDidAppear(_ animated: Bool) {
        var gageSpeed:Double = 1
        
        if characterRarity == 1 {
            gageSpeed = 1.5
        } else if characterRarity == 2{
            gageSpeed = 1.3
        } else if characterRarity == 3{
            gageSpeed = 1
        } else if characterRarity == 4{
            gageSpeed = 0.9
        } else if characterRarity == 5{
            gageSpeed = 0.8
        } else if characterRarity == 6{
            gageSpeed = 0.7
        } else if characterRarity == 7{
            gageSpeed = 0.6
        } else if characterRarity == 8{
            gageSpeed = 0.5
        } else if characterRarity == 9{
            gageSpeed = 0.4
        } else if characterRarity == 10{
            gageSpeed = 0.3
        }
        
        if itemRepo.getMaashi() {
            gageSpeed += 1
            itemRepo.changeMaashi()
        }
        
        
        // プロパティのアニメーションの実行
        UIView.animate(withDuration: gageSpeed , // アニメーション合計継続時間(秒)
            delay: 0.0, // アニメーション開始時間(秒)
            options: [.repeat, .autoreverse],
            animations: {
                // プロパティの変更
            print("ゲージの最上端",self.gage1.top)
            print("ゲージの最下端",self.gage23.bottom)
            print("矢印の最下端",self.imageView.bottom)
            print("矢印の最上端",self.imageView.top)
            self.imageView.frame.origin.y = self.gage23.bottom + (self.imageView.bottom - self.imageView.top)/2 - 75
            }, completion: {(finished: Bool) in
            print("animation finished!!")
        })
    }
   
    // ボタン押下時に呼ばれる
    @IBAction func onButtonClick(sender: UIButton) {
        //animationを止める操作
        let layer = imageView.layer
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
        print(pausedTime)
    
        if let position = layer.presentation()?.position {
            print(position.y)
            if position.y < 184 {
                print("Excelent!!!")
            } else if position.y < 224 {
                print("Great!!")
            } else if position.y < 264 {
                print("Good job!")
            } else if position.y < 304 {
                print("It's OK!")
            } else if position.y < 344 {
                print("Not good.")
            } else if position.y < 384 {
                print("Not bad.")
            } else if position.y < 424 {
                print("Bad!")
            } else  {
                print("So bad!!")
            }
        }
            var result = 3
            delay(0.5) {
                // do something
                // 画面遷移のアニメーションの実行
                UIView.transition(with: self.imageView,
                duration: 1, // アニメーション合計継続時間(秒)
                options: [.transitionFlipFromLeft, .curveLinear], // オプション(左からのフリップ, 等速)
                    animations: {
                    // 画面の変更
                        if let position = self.imageView.layer.presentation()?.position {
                            if position.y < 184 {
                                print("Excelent!!!")
                                result = 20
                                self.resultImage.image = UIImage(named:"Excellent")
                            } else if position.y < 224 {
                                print("Great!!")
                                result = 10
                                self.resultImage.image = UIImage(named:"Amoungs")
                            } else if position.y < 264 {
                                print("Good job!")
                                result = 10
                                self.resultImage.image = UIImage(named:"Amoungs")
                            } else if position.y < 304 {
                                print("It's OK!")
                                result = 0
                                self.resultImage.image = UIImage(named:"Amoungs")
                            } else if position.y < 344 {
                                print("Not good.")
                                result = 0
                                self.resultImage.image = UIImage(named:"Amoungs")
                            } else if position.y < 384 {
                                print("Not bad.")
                                result = -10
                                self.resultImage.image = UIImage(named:"Amoungs")
                            } else if position.y < 424 {
                                print("Bad!")
                                result = -10
                                self.resultImage.image = UIImage(named:"Amoungs")
                            } else  {
                                print("So bad!!")
                                result = 20
                                self.resultImage.image = UIImage(named:"Amoungs")
                            }
                    }
                },
                completion:  {(finished: Bool) in
                // アニメーション完了時の処理
                }
            )
        }
        delay(1) {
            // do something
            self.addOrEscape(result: result)
        }
    }
}
