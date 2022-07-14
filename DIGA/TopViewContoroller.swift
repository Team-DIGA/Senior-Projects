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
import Amplify
import AWSMobileClient

class TopViewController: UIViewController {
    @IBAction func signOutButton(_ sender: UIButton) {
        // サインアウト処理
        AWSMobileClient.sharedInstance().signOut()

        // サインイン画面を表示
        AWSMobileClient.sharedInstance().showSignIn(navigationController: self.navigationController!, { (userState, error) in
            if(error == nil){
                //Successful signin
                DispatchQueue.main.async {
                    print("Sign In")
                }
            }
        })
    }
    
    @IBOutlet weak var signOutButton: UIButton!
    var randomNum = 0
    var nameNum = ""
    
    let uiDesign = UiDesign()
    
    let userDataUtils = UserDataUtils()
    
    @IBOutlet weak var digaGoButton: UIButton!
    
    @IBAction func amongsTappedButton(_ sender: UIButton) {
        randomNum = Int.random(in: 0...200)
        nameNum = randomNum == 200 ? String(200) : String(randomNum % 10)
        //音声セット
        soundSet(name: nameNum)
        buttonAvPlayer.currentTime = 0
        buttonAvPlayer.play()
    }
    var avPlayer: AVAudioPlayer!
    var buttonAvPlayer : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 認証 通常の認証画面を表示
        AWSMobileClient.sharedInstance().initialize { (userState, error) in
            if let userState = userState {
                switch(userState){
                case .signedIn:
                    
                    DispatchQueue.main.async {
                        print("Sign In")
                    }
                case .signedOut:
                    AWSMobileClient.sharedInstance().showSignIn(navigationController: self.navigationController!, { (userState, error) in
                        if(error == nil){       //Successful signin
                            DispatchQueue.main.async {
                                guard let userName = AWSMobileClient.default().username else {
                                    print("Error:Uncaught username")
                                    return
                                }
                                let addUser = User(name:userName, friends: [], items: [], level: 1, money: 0, exp: 0, update_count: 1)
                                self.userDataUtils.createUser(user: addUser)
                                print("Sign In")
                                // mutateで新規メッセージを作成
                                Amplify.API.mutate(request: .create(addUser)) { event in
                                    switch event {
                                    case .success(let result):
                                        switch result {
                                        case .success(let message):
                                            print("Successfully created user: \(message)")
                                        case .failure(let graphQLError):
                                            // サーバーからのエラーの場合はこっち
                                            print("Failed to create user by graphql \(graphQLError)")
                                        }
                                    case .failure(let apiError):
                                        // 通信まわりなどのErrorになった場合はこっち
                                        print("Failed to create user by apiError", apiError)
                                    }
                                }
                            }
                        }
                    })
                default:
                    AWSMobileClient.sharedInstance().signOut()
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
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
        
        uiDesign.buttonDesign(button: digaGoButton)
        uiDesign.buttonDesign(button: signOutButton)

        fetchCurrentAuthSession()
        
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
    
    func fetchCurrentAuthSession() {
        _ = Amplify.Auth.fetchAuthSession { result in
            switch result {
            case .success(let session):
                print("Is user signed in - \(session.isSignedIn)")
            case .failure(let error):
                print("Fetch session failed with error \(error)")
            }
        }
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
    
}
