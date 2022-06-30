//
//  ViewController.swift
//  DIGA
//
//  Created by Rintaro Kimura on 2022/06/29.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    @IBAction func AddFriends(_ sender: UIButton) {
        debugPrint("Hello")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//            let arView = ARView(frame: view.bounds)
            view.addSubview(arView)
            // ストーリーボードの@IBOutlet接続でも大丈夫です
        
            //オブジェ作成表示
            let anchor = AnchorEntity(world: [0, -0.5, -1])
            let plane = ModelEntity(mesh: .generatePlane(width: 0.5, height: 0.5))
            let box = ModelEntity(mesh: .generateBox(size: simd_make_float3(0.6, 0.2, 0.4)))
            plane.transform = Transform(pitch: 0, yaw: 0, roll: 0)
            box.transform = Transform(pitch: 0, yaw: 1, roll: 0)
            if let url = Bundle.main.url(forResource: "ダウンロード", withExtension: "jpeg"),
               let texture = try? TextureResource.load(contentsOf:url, withName:nil) {
                var imageMaterial = UnlitMaterial()
                imageMaterial.baseColor = MaterialColorParameter.texture(texture)
                box.model?.materials = [imageMaterial]
                plane.model?.materials = [imageMaterial]
            }
        
      //    anchor.addChild(box)
      
        Task{
            arView.scene.anchors.append(anchor)
            anchor.addChild(plane)
        }
      
//      arView.scene.addAnchor(anchor)
//          guard let robot = try? Entity.load(named: "amongs") else { return }
//          for animation in robot.availableAnimations {
//            robot.playAnimation(animation.repeat()) // 歩行アニメーション
//          }
//          robot.move(to: Transform(translation: [0,0,20]), relativeTo: robot, duration: 4, timingFunction: .easeInOut)

    }
}
