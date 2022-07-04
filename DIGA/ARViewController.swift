//

// ViewController.swift
// DIGA
//
// Created by Rintaro Kimura on 2022/06/29.
//
import UIKit
import RealityKit
import MapKit

class ARViewController: UIViewController {
    
    var imageValue: String!
    var characterImage: UIImage?

    var characterRerity: Int!
    var characterPlace: String!
    var characterTitle: String!
    
    let dataUtils = DataUtils()
    
    @IBOutlet var arView: ARView!
    
    @IBOutlet weak var addFriendButton: UIButton!
    
    
    // 前の画面に戻る処理
    @IBAction func AddFriend(_ sender: UIButton) {
        debugPrint("Hello")
        self.navigationController?.popViewController(animated: true)
        dataUtils.updateData(name: characterTitle)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(arView)
        view.bringSubviewToFront(addFriendButton)
        //オブジェ作成表示
        createObjImage()
        
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

}
