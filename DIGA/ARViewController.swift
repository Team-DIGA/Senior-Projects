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
    
    var user: User!
    var myLevel: Int = 0
    var myLevelZone: Int = 0
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
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var GageStopButton: UIButton!
    
    @IBOutlet var arView: ARView!
    
    @IBOutlet weak var addFriendButton: UIButton!
    @IBOutlet weak var addFriendButton2: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rarityLabel: UILabel!
    @IBOutlet weak var metCountLabel: UILabel!
    
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
        
        let randomNum = Int.random(in: 1...100)
        if randomNum <= captureProbability {
            guard let metCount = characterMetObj[characterTitle] else {
                print("metCountError")
                return
            }
            print("＝＝＝＝＝今からキャラデータ登録＝＝＝＝＝＝")
            characterDataUtils.updateCharacter(name: characterTitle, place: characterPlace, met_count_key:metCount)
            print("＝＝＝＝＝キャラデータ登録完了＝＝＝＝＝＝")
            alertFunc1(title: "\(characterTitle!)は\n仲間になった！", message: "",addFlag:true)
        } else {
            alertFunc1(title: "\( characterTitle!)は\n去っていった！", message: "",addFlag:false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        guard let username = AWSMobileClient.default().username else {
            print("Error: Uncaught username")
            return
        }
        user = userDataUtils.getUser(name: username) as? User
        myLevel = user.level
        
        itemTitles = itemDataUtils.getAllItem() as! [Item]

        view.addSubview(arView)
        view.bringSubviewToFront(addFriendButton)
        view.bringSubviewToFront(addFriendButton2)
        view.bringSubviewToFront(nameLabel)
        view.bringSubviewToFront(rarityLabel)
        view.bringSubviewToFront(metCountLabel)
        view.bringSubviewToFront(resultImage)
        view.bringSubviewToFront(GageStopButton)
        
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
        } else if characterTitle! == "トロロ" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -0.2, -0.2)

            if let usdzModel = try? Entity.load(named: "Totoro") {
                anchor.addChild(usdzModel)
            }
            arView.scene.anchors.append(anchor)
        }else if characterTitle! == "Shimabu" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, 0, 0)

            if let usdzModel = try? Entity.load(named: "SHIMABU") {
                anchor.addChild(usdzModel)
            }
            arView.scene.anchors.append(anchor)
        } else if characterTitle! == "チョッパー" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -1, -2)

            let usdzModel = try! Entity.load(named: "chopper_boxing_test")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                usdzModel.playAnimation(animation.repeat())
            }
        } else if characterTitle! == "ソニック" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -3, -3)
            let usdzModel = try! Entity.load(named: "sonic_the_hedgehog2")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
        } else if characterTitle! == "ロビン" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -2, -2)

            let usdzModel = try! Entity.load(named: "standing_greeting_robin_test")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                usdzModel.playAnimation(animation.repeat())
            }
        }else if characterTitle! == "サンジ" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -2, -2)
            let usdzModel = try! Entity.load(named: "Sanji_One_Piece")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                            usdzModel.playAnimation(animation.repeat())
                        }
        }else if characterTitle! == "クリリン" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -0.1, -0.1)
            let usdzModel = try! Entity.load(named: "kurillin1")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                            usdzModel.playAnimation(animation.repeat())
                        }
        }else if characterTitle! == "レアコイル" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -2, -2)
            let usdzModel = try! Entity.load(named: "rarecoil")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                            usdzModel.playAnimation(animation.repeat())
                        }
        }else if characterTitle! == "ミッキー" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -0.1, -0.1)
            let usdzModel = try! Entity.load(named: "dancing_mickey")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                            usdzModel.playAnimation(animation.repeat())
                        }
        }else if characterTitle! == "ぷよ" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -3, -4)
            let usdzModel = try! Entity.load(named: "puyo")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                            usdzModel.playAnimation(animation.repeat())
                        }
        }else if characterTitle! == "スライム" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -0.5, -0.8)
            let usdzModel = try! Entity.load(named: "slime_5th")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                            usdzModel.playAnimation(animation.repeat())
                        }
        }else if characterTitle! == "メタルスライム" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -150, -200)
            let usdzModel = try! Entity.load(named: "metal_slime")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                            usdzModel.playAnimation(animation.repeat())
                        }
            
        }else if characterTitle! == "巨人化したエレン" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -8, -8)
            let usdzModel = try! Entity.load(named: "Eren(Titan)_3")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                            usdzModel.playAnimation(animation.repeat())
                        }
            
        }else if characterTitle! == "悟空" {
            let anchor = AnchorEntity()
            anchor.position = simd_make_float3(0, -2, -2)
            let usdzModel = try! Entity.load(named: "Goku_Rigged__Animated")
            anchor.addChild(usdzModel)
            arView.scene.anchors.append(anchor)
            for animation in usdzModel.availableAnimations {
                            usdzModel.playAnimation(animation.repeat())
                        }
            
        }else {
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
    
    func alertFunc1(title: String, message: String, addFlag:Bool) {
        let alert: UIAlertController =  UIAlertController(title: title,message: message, preferredStyle: UIAlertController.Style.alert)
        
        let backAction:UIAlertAction?
        
        if addFlag {
            backAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) -> Void in
                    self.alertFunc2()
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
        present(alert, animated: true, completion: nil)
    }
    
    func alertFunc2(){
        let expTable : [String : Int] = [
            "スライム":15,
            "アナ":100,
            "アンパンマン":150,
            "アルミン":39,
            "アシタカ":50,
            "バイキンマン":10,
            "ベジータ":350,
            "ブルック":120,
            "坊":5000,
            "カレーパンマン":23,
            "チーズ":2,
            "クリリン":20,
            "チョッパー":35,
            "ドナルド":20,
            "ドラえもん":25,
            "ドラミ":20,
            "エルザ":35,
            "エレン":100,
            "エリーザ":530000,
            "エグゼイド":1031,
            "フランキー":262,
            "悟空":500,
            "グーフィー":120,
            "ハウル":100,
            "伊之助":380,
            "ジャイアン":30,
            "ルフィー":150,
            "ミッキー":200,
            "ミカサ":130,
            "ミニー":32,
            "ナックル":79,
            "ナミ":73,
            "ナウシカ":74,
            "禰󠄀豆子":222,
            "のび太":25,
            "ピッコロ":24,
            "ぷよ":10,
            "ロビン":620,
            "サン":3,
            "サンジ":32,
            "シャドウ":410,
            "静香":42,
            "ソニック":429,
            "食パンマン":498,
            "炭治郎":126,
            "テイルズ":650,
            "巨人化したエレン":333,
            "トロロ":166,
            "ウソップ":657,
            "善逸":258,
            "ゾロ":666,
            "コイル":516,
            "Shimabu":36,
            "Abiru":55,
            "アンミカ":200,
            "イサージ":3,
            "ご機嫌な島袋":1,
            "Masashi":9999999999,
            "Amongs":5
        ]
        
        guard var getExp = expTable[characterTitle] else {
            print("Error:Uncaught exp table")
            return
        }
        
        if itemRepo.getCursed() {
            getExp = getExp / 2
        }
    
        if itemRepo.getBooster() == 1 {
            getExp = getExp * (3/2)
        } else if itemRepo.getBooster() == 2 {
            getExp = getExp * 2
        }
        
        
        user.exp += getExp
        let myLv  = Int(floor(pow(Double(user.exp),0.33)))
        var alert : UIAlertController
        
        if myLv > user.level {
            alert = UIAlertController(title: String(
                "経験値　\(getExp)　を獲得した！\nレベルが　\(myLv - user.level) 上がった！！"
            ), message: "", preferredStyle: .alert)
        } else {
            alert = UIAlertController(title: String(
                "経験値　\(getExp)　を獲得した！"
            ), message: "", preferredStyle: .alert)
        }
        
        let backAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) -> Void in
            self.alertFunc3(getExp:getExp)
        })
        
        user.level += myLv - user.level
        alert.addAction(backAction)
        present(alert, animated: true)
        
        //userDataUtils.updateUserLvAndExp(name: user.name, myLv: myLv ,getExp: Int(getExp))

    }
    func alertFunc3(getExp:Int){
        let moneyTable : [String : Int] = [
            "スライム":15,
            "アナ":100,
            "アンパンマン":99,
            "アルミン":95,
            "アシタカ":39,
            "バイキンマン":10,
            "ベジータ":350,
            "ブルック":120,
            "坊":5000,
            "カレーパンマン":23,
            "チーズ":2,
            "クリリン":20,
            "チョッパー":35,
            "ドナルド":20,
            "ドラえもん":25,
            "ドラミ":20,
            "エルザ":35,
            "エレン":100,
            "エリーザ":530000,
            "エグゼイド":1031,
            "フランキー":262,
            "悟空":500,
            "グーフィー":120,
            "ハウル":100,
            "伊之助":380,
            "ジャイアン":30,
            "ルフィー":150,
            "ミッキー":200,
            "ミカサ":130,
            "ミニー":32,
            "ナックル":79,
            "ナミ":73,
            "ナウシカ":74,
            "禰󠄀豆子":222,
            "のび太":25,
            "ピッコロ":24,
            "ぷよ":10,
            "ロビン":620,
            "サン":3,
            "サンジ":32,
            "シャドウ":410,
            "静香":42,
            "ソニック":429,
            "食パンマン":498,
            "炭治郎":126,
            "テイルズ":650,
            "巨人化したエレン":333,
            "トロロ":166,
            "ウソップ":657,
            "善逸":258,
            "ゾロ":666,
            "コイル":516,
            "Shimabu":36,
            "Abiru":55,
            "アンミカ":200,
            "イサージ":3,
            "ご機嫌な島袋":1,
            "Masashi":9999999999,
            "Amongs":5
        ]
        
        guard var getMoney = moneyTable[characterTitle] else {
        print("Error:Uncaught moneyTable")
            return
        }
        
        if itemRepo.getCursed() {
            getMoney = getMoney / 2
        }
        
        if itemRepo.getBooster() == 1 {
            getMoney = getMoney * (2/3)
        } else if itemRepo.getBooster() == 2 {
            getMoney = getMoney / 4
        }
      
        let alert = UIAlertController(title: String(
            "\(characterTitle!)　が上納金を納めた。\n所持金が　\(getMoney)€riko 増えた！！"
        ), message: "", preferredStyle: .alert)
        
        let backAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) -> Void in
            let randomNum = Int.random(in: 1...10)
            if randomNum == 1 {
                self.alertFunc4()
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        })
        
        alert.addAction(backAction)
        present(alert, animated: true, completion: nil)
        
        userDataUtils.updateUserStatus(name: user.name, getExp: getExp, getMoney: getMoney, getItem: nil)

    }
    
    func alertFunc4(){
        let randomItemNum = Int.random(in: 0...itemTitles.count-1)
        print("itemTitles", itemTitles)
        let alert = UIAlertController(title: String("\(itemTitles[randomItemNum].name)を手に入れた！"), message: "", preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 70, width: 250, height: 250))
        let height = NSLayoutConstraint(item: alert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 380)
        alert.view.addConstraint(height)
        imageView.image = UIImage(named: itemTitles[randomItemNum].name)
        alert.view.addSubview(imageView)
        if itemTitles[randomItemNum].name == "呪いの面" {
            itemRepo.onCursed()
        }
        
        let backAction: UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) -> Void in
            self.navigationController?.popViewController(animated: true)
        })
        
        alert.addAction(backAction)
        present(alert, animated: true)
        
//        guard let username = AWSMobileClient.default().username else {
//            print("Error: Uncaught username")
//            return
//        }

//        userDataUtils.updateUserItem(name: username, itemName: itemTitles[randomItemNum].name)
        itemDataUtils.updateItem(name: itemTitles[randomItemNum].name, itemCount: 1)
        
    }
    
    
    //ここからミニゲーム
    // スクリーン画面のサイズを取得
    let scWid: CGFloat = UIScreen.main.bounds.width     //画面の幅
    let scHei: CGFloat = UIScreen.main.bounds.height    //画面の高さ
    
    var barView:UIView = UIView()
    var baseBarView:UIView = UIView()
    var gageFlameView:UIView = UIView()
   
    
    override func viewWillAppear(_ animated: Bool) {
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


//        // プロパティのアニメーションの実行
//        UIView.animate(withDuration: gageSpeed , // アニメーション合計継続時間(秒)
//            delay: 0.0, // アニメーション開始時間(秒)
//            options: [.repeat, .autoreverse],
//            animations: {
//                // プロパティの変更
//            print("ゲージの最上端",self.gage1.top)
//            print("ゲージの最下端",self.gage23.bottom)
//            print("矢印の最下端",self.imageView.bottom)
//            print("矢印の最上端",self.imageView.top)
//            self.imageView.frame.origin.y = self.gage23.bottom + (self.imageView.bottom - self.imageView.top)/2 - 75
//            }, completion: {(finished: Bool) in
//            print("animation finished!!")
//        })
        
        
        // バーの高さ・幅
        let barHeight = scHei*0.6
        let barWidth = scWid*0.1
        
        // バーのX座標・Y座標・終端のY座標
        let barXPosition = scWid*0.8
        let barYPosition = scHei*0.2
        
        
        
        // 画像の表示する座標を指定する
        barView.frame = CGRect(x: barXPosition ,y: barYPosition ,width: barWidth ,height: barHeight)
        baseBarView.frame = CGRect(x: barXPosition ,y: barYPosition ,width: barWidth ,height: barHeight)
        gageFlameView.frame = CGRect(x: barXPosition-10 ,y: barYPosition-10 ,width: barWidth+20 ,height: barHeight+20)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = baseBarView.frame.size
        let topColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor
        let gradientColors: [CGColor] = [topColor, bottomColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.colors = gradientColors
        baseBarView.layer.insertSublayer(gradientLayer, at: 0)
        // バーに色を付ける
        barView.backgroundColor = .gray
//        baseBarView.backgroundColor = .orange
        gageFlameView.backgroundColor = .darkGray
        
        // barViewをViewに追加する
        
        view.addSubview(gageFlameView)
        view.addSubview(baseBarView)
        view.addSubview(barView)
        view.bringSubviewToFront(resultImage)
        
        // バーをアニメーションさせる
        // gageSpeed秒かけてバーを上下させる
        UIView.animate(withDuration: gageSpeed, delay: 0.0, options : [.repeat, .autoreverse], animations: {() -> Void  in
            // アニメーション終了後の座標とサイズを指定
            self.barView.frame = CGRect(x: barXPosition, y: barYPosition, width: barWidth, height: 0)
        },
                       completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        

        })
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
        
    
   
    // ボタン押下時に呼ばれる
    @IBAction func onButtonClick(sender: UIButton) {
        //animationを止める操作
        let layer = barView.layer
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
        var result = 0
        // 画面遷移のアニメーションの実行
        UIView.transition(with: self.barView,
        duration: 1, // アニメーション合計継続時間(秒)
        options: [.transitionFlipFromLeft, .curveLinear], // オプション(左からのフリップ, 等速)
        animations: {
            // 画面の変更
            if let position = self.barView.layer.presentation()?.position {
                if position.y < 170 {
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
        delay(0.5){
            self.addOrEscape(result: result)
        }
        
    }
}
