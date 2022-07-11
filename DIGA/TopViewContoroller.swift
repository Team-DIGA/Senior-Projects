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
import AmplifyPlugins
import AWSMobileClient

class TopViewController: UIViewController {
    @IBAction func signOutButton(_ sender: UIButton) {
        // サインアウト処理
        AWSMobileClient.sharedInstance().signOut()

        // サインイン画面を表示
        AWSMobileClient.sharedInstance().showSignIn(navigationController: self.navigationController!, { (userState, error) in
            if(error == nil){       //Successful signin
                DispatchQueue.main.async {
                    print("Sign In")
                }
            }
        })
    }
    
    @IBOutlet weak var signOutButton: UIButton!
    @IBAction func digagoButton(_ sender: UIButton) {
//        avPlayer.stop()
    }
    var randomNum = 0
    var nameNum = ""
    
    let uiDesign = UiDesign()
    
    @IBOutlet weak var digaGoButton: UIButton!
    @IBOutlet weak var showFriendsButton: UIButton!
    
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
        //ユーザー登録のメソッド
//        func signUp(username: String, password: String, email: String) {
//            let userAttributes = [AuthUserAttribute(.email, value: email)]
//            let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
//            Amplify.Auth.signUp(username: username, password: password, options: options) { result in
//                switch result {
//                case .success(let signUpResult):
//                    if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
//                        print("Delivery details \(String(describing: deliveryDetails))")
//                    } else {
//                        print("SignUp Complete")
//                    }
//                case .failure(let error):
//                    print("An error occurred while registering a user \(error)")
//                }
//            }
//        }
        //確認コード入力のメソッド
//        func confirmSignUp(for username: String, with confirmationCode: String) {
//            Amplify.Auth.confirmSignUp(for: username, confirmationCode: confirmationCode) { result in
//                switch result {
//                case .success:
//                    print("Confirm signUp succeeded")
//                case .failure(let error):
//                    print("An error occurred while confirming sign up \(error)")
//                }
//            }
//        }
        //ユーザー名とパスワードが入力されたらサインインするメソッド
//        func signIn(username: String, password: String) {
//            Amplify.Auth.signIn(username: username, password: password) { result in
//                switch result {
//                case .success:
//                    print("Sign in succeeded")
//                case .failure(let error):
//                    print("Sign in failed \(error)")
//                }
//            }
//        }
//        //認証
//        let hostedUIOptions = HostedUIOptions(scopes: ["openid", "email", "profile", "aws.cognito.signin.user.admin"])
//
//        // Present the Hosted UI sign in.
//        AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, hostedUIOptions: hostedUIOptions) { (userState, error) in
//            if let error = error as? AWSMobileClientError {
//                print(error.localizedDescription)
//            }
//            if let userState = userState {
//                // サインインが完了するとサインイン後のステータスが返却される
//                print("Status: \(userState.rawValue)")
//            }
//        }
        // 認証
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
                                    print("Sign In")
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
        uiDesign.buttonDesign(button: showFriendsButton)
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
