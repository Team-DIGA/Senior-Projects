//

// ViewController.swift
// DIGA
//
// Created by Rintaro Kimura on 2022/06/29.
//
import UIKit
import RealityKit
import MapKit

struct testStruct {
    func tests() {
        print("test")
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
    
    let dataUtils = DataUtils()
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
    
    var itemArray:[UIImage?] = []
    
    let itemTitles:[String] = [
        "アンパンマンの顔",
        "エリクサー",
        "ゴムゴムの実",
        "スカウター",
        "タケコプター",
        "どこでもドア",
        "ポーション",
        "メラメラの実",
        "胡蝶しのぶの日輪刀",
        "仙豆",
        "立体機動装置",
        "煉獄杏寿郎の日輪刀",
    ]
    
    @IBOutlet var arView: ARView!
    
    @IBOutlet weak var addFriendButton: UIButton!
    @IBOutlet weak var addFriendButton2: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rarityLabel: UILabel!
    @IBOutlet weak var metCountLabel: UILabel!
    
    @IBAction func AddFriend2(_ sender: UIButton) {
        addOrEscape()
    }
    
    // 前の画面に戻る処理
    @IBAction func AddFriend(_ sender: UIButton) {
        addOrEscape()
    }
    
    func addOrEscape(){
        let randomNum = Int.random(in: 1...characterRarity+1)
        if randomNum == 1 {
            guard let metCount = characterMetObj[characterTitle] else {
                print("metCountError")
                return
            }
            dataUtils.updateData(name: characterTitle, place: characterPlace, met_count_key:metCount)
            alertFunc(title: "\(characterTitle!)は\n仲間になった！", message: "",addFlag:true)
        } else {
            alertFunc(title: "\(characterTitle!)は\n去っていった！", message: "",addFlag:false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(arView)
        view.bringSubviewToFront(addFriendButton)
        view.bringSubviewToFront(addFriendButton2)
        view.bringSubviewToFront(nameLabel)
        view.bringSubviewToFront(rarityLabel)
        view.bringSubviewToFront(metCountLabel)
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
        
        for itemTitle in itemTitles {
            itemArray.append(UIImage(named: itemTitle))
        }
        
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
                let randomNum = Int.random(in: 1...2)
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
        let alert = UIAlertController(title: String("\(itemTitles[randomItemNum])を手に入れた！"), message: "", preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 70, width: 250, height: 250))
        
        let height = NSLayoutConstraint(item: alert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 380)
        alert.view.addConstraint(height)
        imageView.image = itemArray[randomItemNum]
        alert.view.addSubview(imageView)
        
        let backAction: UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) -> Void in
            self.navigationController?.popViewController(animated: true)
        })
        
        alert.addAction(backAction)
        present(alert, animated: true)
    }
    

}
