//
//  animeation.swift
//  DIGA
//
//  Created by Kazunori Nakajima on 2022/07/12.
//

import UIKit

class AnimationViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
         gageMotionStart()
    }

    // UIImageView のインスタンス生成,ダミーでimage0を指定
    let imageView:UIImageView = UIImageView(image:UIImage(named:"gage0")!)

    func gageMotionStart(){
        //アニメーション用の画像
        let image1 = UIImage(named:"gage1")!
        let image2 = UIImage(named:"gage2")!
        let image3 = UIImage(named:"gage3")!
        let image4 = UIImage(named:"gage4")!
        let image5 = UIImage(named:"gage5")!
        let image6 = UIImage(named:"gage6")!
        let image7 = UIImage(named:"gage7")!
        let image8 = UIImage(named:"gage8")!
        let image9 = UIImage(named:"gage9")!
        let image10 = UIImage(named:"gage10")!
        let image11 = UIImage(named:"gage11")!
        let image12 = UIImage(named:"gage12")!
        let image13 = UIImage(named:"gage13")!
        let image14 = UIImage(named:"gage14")!
        let image15 = UIImage(named:"gage15")!
        let image16 = UIImage(named:"gage16")!
        let image17 = UIImage(named:"gage17")!
        let image18 = UIImage(named:"gage18")!
        let image19 = UIImage(named:"gage19")!
        let image20 = UIImage(named:"gage20")!
        let image21 = UIImage(named:"gage21")!
        let image22 = UIImage(named:"gage22")!
        let image23 = UIImage(named:"gage23")!
        let image24 = UIImage(named:"gage24")!
        let image25 = UIImage(named:"gage25")!
        let image26 = UIImage(named:"gage26")!
        let image27 = UIImage(named:"gage27")!
        let image28 = UIImage(named:"gage28")!
        let image29 = UIImage(named:"gage29")!
        let image30 = UIImage(named:"gage30")!
        let image31 = UIImage(named:"gage31")!
        let image32 = UIImage(named:"gage32")!

        // UIImage の配列を作る
        var imageListArray :Array<UIImage> = []
        imageListArray.append(image1)
        imageListArray.append(image2)
        imageListArray.append(image3)
        imageListArray.append(image4)
        imageListArray.append(image5)
        imageListArray.append(image6)
        imageListArray.append(image7)
        imageListArray.append(image8)
        imageListArray.append(image9)
        imageListArray.append(image10)
        imageListArray.append(image11)
        imageListArray.append(image12)
        imageListArray.append(image13)
        imageListArray.append(image14)
        imageListArray.append(image15)
        imageListArray.append(image16)
        imageListArray.append(image17)
        imageListArray.append(image18)
        imageListArray.append(image19)
        imageListArray.append(image20)
        imageListArray.append(image21)
        imageListArray.append(image22)
        imageListArray.append(image23)
        imageListArray.append(image24)
        imageListArray.append(image25)
        imageListArray.append(image26)
        imageListArray.append(image27)
        imageListArray.append(image28)
        imageListArray.append(image29)
        imageListArray.append(image30)
        imageListArray.append(image31)
        imageListArray.append(image32)
        imageListArray.append(image32)
        imageListArray.append(image31)
        imageListArray.append(image30)
        imageListArray.append(image29)
        imageListArray.append(image28)
        imageListArray.append(image27)
        imageListArray.append(image26)
        imageListArray.append(image25)
        imageListArray.append(image24)
        imageListArray.append(image23)
        imageListArray.append(image22)
        imageListArray.append(image21)
        imageListArray.append(image20)
        imageListArray.append(image19)
        imageListArray.append(image18)
        imageListArray.append(image17)
        imageListArray.append(image16)
        imageListArray.append(image15)
        imageListArray.append(image14)
        imageListArray.append(image13)
        imageListArray.append(image12)
        imageListArray.append(image11)
        imageListArray.append(image10)
        imageListArray.append(image9)
        imageListArray.append(image8)
        imageListArray.append(image7)
        imageListArray.append(image6)
        imageListArray.append(image5)
        imageListArray.append(image4)
        imageListArray.append(image3)
        imageListArray.append(image2)
        imageListArray.append(image1)

        // 画面スクリーンサイズ
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height

        // 画像のサイズ
        let imageWidth = image1.size.width
        let imageHeight = image1.size.height



        // 画像サイズからImageViewの大きさを設定していく
        let rect = CGRect(x:0,
                          y:0,
                          width:imageWidth,
                          height:imageHeight )

        imageView.frame = rect

        // 画像が画面中央にくるように位置合わせ
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)

        // view に追加する
        self.view.addSubview(imageView)

        // 画像Arrayをアニメーションにセット
        imageView.animationImages = imageListArray

        // 間隔（秒単位）
        imageView.animationDuration = 1
        // 繰り返し
        imageView.animationRepeatCount = 10

        // アニメーションを開始
        imageView.startAnimating()




    }

    @IBAction func StopButton(_ sender: UIButton) {
        // アニメーションを終了
        imageView.stopAnimating()
    }
    
    
    
//    // スクリーン画面のサイズを取得
//        let scWid: CGFloat = UIScreen.main.bounds.width     //画面の幅
//        let scHei: CGFloat = UIScreen.main.bounds.height    //画面の高さ
//
//        var barView:UIView!
//
//    override func viewWillAppear(_ animated: Bool) {
//            // バーの高さ・幅
//            let barHeight = scHei*0.6
//            let barWidth = scWid*0.1
//
//            // バーのX座標・Y座標・終端のX座標
//            let barXPosition = scWid*0.8
//            let barYPosition = scHei*0.2
//            let barYPositionEnd = barYPosition + barHeight
//
//            // UIImageViewを初期化
//            barView = UIView()
//
//            // 画像の表示する座標を指定する
//            barView.frame = CGRect(x: barXPosition ,y: barYPosition ,width: barWidth ,height: barHeight)
            
//            let gradientLayer = CAGradientLayer()
//        gradientLayer.frame.size = barView.frame.size
//            let topColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0).cgColor
//            let bottomColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor
//            let gradientColors: [CGColor] = [topColor, bottomColor]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
//            gradientLayer.colors = gradientColors
//            barView.layer.insertSublayer(gradientLayer, at: 0)
//            // バーに色を付ける
//            barView.backgroundColor = .orange
//
//            // barViewをViewに追加する
//
//            view.addSubview(barView)
//
//            // バーをアニメーションさせる
//            // 1秒かけてバーを下から上に減少させる
//            UIView.animate(withDuration: 1, delay: 0.0, options : [.repeat, .autoreverse], animations: {() -> Void  in
//                // アニメーション終了後の座標とサイズを指定
//                self.barView.frame = CGRect(x: barXPosition, y: barYPositionEnd, width: barWidth, height: 0)
//            },
//                           completion: {(finished: Bool) -> Void in
//                            // アニメーション終了後の処理
//
//            })
//
//        }
//
//        override func didReceiveMemoryWarning() {
//            super.didReceiveMemoryWarning()
//            // Dispose of any resources that can be recreated.
//        }
}
