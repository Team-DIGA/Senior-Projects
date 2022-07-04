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
    var randomNum = 0
    var nameNum = ""
    @IBAction func amongsTappedButton(_ sender: UIButton) {
        randomNum = Int.random(in: 0...200)
        nameNum = randomNum == 200 ? String(200) : String(randomNum % 10)
        //音声セット
        soundSet(name: nameNum)
        buttonAvPlayer.currentTime = 0
        buttonAvPlayer.play()
        print("push")
    }
    var avPlayer: AVAudioPlayer!
    var buttonAvPlayer : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bundle Resourcesからsample.mp4を読み込んで再生
        let path = Bundle.main.path(forResource: "amongs", ofType: "mp4")!
        let player = AVPlayer(url: URL(fileURLWithPath: path))
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
        //BGMstart
        playSound(name: "undefined")
        //soundSet
        soundSet(name: "0")
        
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
                avPlayer.volume = 0
                avPlayer.play()
            } catch {
                print("error", error)
            }
    }
    func soundSet (name: String) {
        let soundFilePath = Bundle.main.path(forResource: name, ofType: "mp3")!
        let sound:URL = URL(fileURLWithPath: soundFilePath)
        do {
            buttonAvPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
        } catch {
            print("AVAudioPlayerinstance error")
        }
        buttonAvPlayer.prepareToPlay()
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
    
}
