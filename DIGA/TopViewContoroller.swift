//
//  TopViewContoroller.swift
//  DIGA
//
//  Created by Rintaro Kimura on 2022/06/29.
//

import UIKit
import MapKit
import CoreLocation
import AVFoundation

class TopViewController: UIViewController {
    @IBAction func digagoButton(_ sender: UIButton) {
//        avPlayer.stop()
    }
    @IBAction func amongsTappedButton(_ sender: UIButton) {
        print("push")
        buttonAvPlayer.currentTime = 0         // 再生箇所を頭に移す
        buttonAvPlayer.play()
    }
    var avPlayer: AVAudioPlayer!
    var buttonAvPlayer : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        let soundFilePath = Bundle.main.path(forResource: "hello", ofType: "mp3")!
        let sound:URL = URL(fileURLWithPath: soundFilePath)
        // AVAudioPlayerのインスタンスを作成,ファイルの読み込み
        do {
            buttonAvPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
        } catch {
            print("AVAudioPlayerインスタンス作成でエラー")
        }
        // 再生準備
        buttonAvPlayer.prepareToPlay()
        // Bundle Resourcesからsample.mp4を読み込んで再生
        let path = Bundle.main.path(forResource: "amongs", ofType: "mp4")!
        var player = AVPlayer(url: URL(fileURLWithPath: path))
        player.play()


        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        let playerObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main) { [weak playerLayer] _ in
                playerLayer?.player?.seek(to: CMTime.zero)
                playerLayer?.player?.play()
        }
        playSound(name: "undefined")
        
    }
    func playSound(name: String) {
            guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
                print("notFile")
                return
            }
            do {
                avPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                avPlayer.enableRate = true
                avPlayer.rate = 1.0
                avPlayer.numberOfLoops = -1
                avPlayer.volume = 0.2
                avPlayer.play()
            } catch {
                print("error", error)
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
