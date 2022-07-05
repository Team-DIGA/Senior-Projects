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

    var characterRerity: Int!
    var characterPlace: String!
    var characterTitle: String!
    
    let testUtiols = testStruct()
    
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
//    var text1: String
//    var text2: String
    
    let itemArray:[UIImage?] = [
        UIImage(named: "アンパンマンの顔")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "エリクサー")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "ゴムゴムの実")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "スカウター")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "タケコプター")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "どこでもドア")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "ポーション")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "メラメラの実")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "胡蝶しのぶの日輪刀")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "仙豆")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "立体機動装置")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "煉獄杏寿郎の日輪刀")?.resized(size:CGSize(width: 50, height: 50)),
    ]
    let itemTitle:[String] = [
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
    
    @IBAction func AddFriend2(_ sender: UIButton) {
        addOrEscape()
    }
    
    // 前の画面に戻る処理
    @IBAction func AddFriend(_ sender: UIButton) {
        addOrEscape()
    }
    
    func addOrEscape(){
        let randomNum = Int.random(in: 1...2)
        if randomNum == 1 {
            dataUtils.updateData(name: characterTitle)
            alertFunc(title: "\(characterTitle!)は\n仲間になった！", message: "",addFlag:true)
        } else {
            alertFunc(title: "\( characterTitle!)は\n去っていった！", message: "",addFlag:false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(arView)
        view.bringSubviewToFront(addFriendButton)
        view.bringSubviewToFront(addFriendButton2)
        //オブジェ作成表示
        createObjImage()
        let text1 = textArray[Int.random(in: 0...textArray.count - 1)]
        let text2 = textArray[Int.random(in: 0...textArray.count - 1)]
        addFriendButton.setTitle(text1, for: .normal)
        addFriendButton2.setTitle(text2, for: .normal)
        
//        let boxAnchor = try! Experience.loadBox()
//        arView.scene.anchors.append(boxAnchor)
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
        let randomItemNum = Int.random(in: 0...itemTitle.count-1)
        let alert = UIAlertController(title: String("\(itemTitle[randomItemNum])を手に入れた！"), message: "", preferredStyle: .alert)
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
