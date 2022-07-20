//
//  MapViewController.swift
//  DIGA
//
//  Created by Rintaro Kimura on 2022/06/29.
//

import UIKit
import CoreLocation
import MapKit
import Amplify
import AWSMobileClient


class MapAnnotationSetting:MKPointAnnotation{
    var pinImage:UIImage?
}

extension UIImage {
    func resized(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    var user: User!
    var userName: String!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var SerchButton: UIButton!
    @IBOutlet weak var statusZone: UIView!
    @IBOutlet weak var profPicture: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var LvLavel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var nextLevellabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBAction func didTapSerchButton(_ sender: UIButton) {
            self.viewDidLoad()
    }
    var locationManager: CLLocationManager!
    
    var myLatitude: CLLocationDegrees!
    var myLongitude: CLLocationDegrees!
    
    var tapLatitude: CLLocationDegrees!
    var tapLongitude: CLLocationDegrees!

    var targetTitle: String!
    var targetCharacterImage: UIImage?
    var targetRarity: Int?
    var targetPlace: String?
    var targetMetCount: Int?
    let hokkaidoLatitude = 43.344778
    let hokkaidoLongitude = 142.382944
    let okinawaLatitude = 26.451614
    let okinawaLongitude = 127.899915
    let honshuLatitude = 35.0
    let honshuLongitude = 135.0
    var targetRemoveAnnotaion: MKAnnotation?
    var mapTargetTitle: [String?] = []
    var mapTargetImage: [UIImage?] = []
    var annotationArray:[MKAnnotation] = []
    
    private let itemRepo = InMemoryItemRepository()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    // 位置情報初回のみ表示させる際のグローバル変数
    var first = true
    
    //    サーバのデータ取り込み（名前とイメージ）
    var allData: [Character] = []
    var pinImages:[UIImage?] = []
    var pinTitles:[String] = []
    var raritiesObj:[String:Int] = [:]
    var raritiesArray:[Int] = []
    var metCountObj:[String:Int] = [:]
    
    func getAllNamesAndImages() {
        
        //***Refactor***//
        //CharacterDataUtilsのgetAllCharacter使ってもっとシンプルに書けないか？
        
        let semaphore = DispatchSemaphore(value: 0)
        // Amplify SDK経由でqueryオペレーションを実行しCharacterの配列を取得
        Amplify.API.query(request: .list(Character.self, where: nil)) { event in
            switch event {
                case .success(let result):
                // GraphQLの場合、Query失敗時のerrorもレスポンスに含まれる
                switch result {
                    case .success(let friends):
                    
                    self.allData = friends
                    for friend in friends {
                        self.pinTitles.append(friend.name)
                        self.pinImages.append(UIImage(named: friend.name)?.resized(size:CGSize(width: 50, height: 50)))
                        self.raritiesObj[friend.name] = friend.rarity
                        self.metCountObj[friend.name] = friend.met_count
                        self.raritiesArray.append(friend.rarity)
                    }
                    
                    semaphore.signal()
                    
                case .failure(let graphQLError):
                    // サーバーから返されるエラーはこっち
                    print("Failed to getAllData graphql \(graphQLError)")
                    semaphore.signal()
                }
            case .failure(let apiError):
                // 通信エラー等の場合はこっち
                print("Failed to getAllData a message", apiError)
                semaphore.signal()
            }
        }
        semaphore.wait()
    }
    
    var pinlocations:[CLLocationCoordinate2D] = []
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        guard let username = AWSMobileClient.default().username else {
            print("Error: Uncaught username")
            return
        }
        
        userName = username
        
        user = userDataUtils.getUser(name: userName) as? User
        
        print("キャラホイ", itemRepo.getHoihoi())
        print("ヨクツカマール", itemRepo.getEasyCap())
        print("まーしの微振動", itemRepo.getMaashi())
        print("レガシーは突然に", itemRepo.getLegacy())
        print("キャラチェン", itemRepo.getChara())
        print("ブースター", itemRepo.getBooster())
        print("getChara:",itemRepo.getChara())
        
//        itemRepo.switchChara(itemNum:2)
        getAllNamesAndImages()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager!.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myLatitude = locationManager.location?.coordinate.latitude
        myLongitude = locationManager.location?.coordinate.longitude
        guard let latitude = myLatitude else {return}
        guard let longitude = myLongitude else {return}
        let currentlocation = CLLocationCoordinate2DMake(latitude,longitude)
        
        // MapViewに中心を設定.
        mapView.setCenter(currentlocation, animated: true)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: currentlocation, span: span)

        mapView.region = region
        mapView.delegate = self
        
        // MapCameraに中心点、視点、高さを設定./
        let myCamera: MKMapCamera =
        MKMapCamera(lookingAtCenter: currentlocation, fromDistance: 750, pitch: 75, heading: 0)
        // CameraをMapViewに設定.
        mapView.setCamera(myCamera, animated: true)
        // ビルを3Dに見えるようにする.
        mapView.showsBuildings = true
        // MapViewをviewに追加.
        view.addSubview(mapView)
        view.bringSubviewToFront(SerchButton)
        view.bringSubviewToFront(statusZone)
        view.bringSubviewToFront(profPicture)
        view.bringSubviewToFront(userNameLabel)
        view.bringSubviewToFront(LvLavel)
        view.bringSubviewToFront(moneyLabel)
        view.bringSubviewToFront(nextLevellabel)
        view.bringSubviewToFront(expLabel)
        
        userNameLabel.text = user.name
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let dirPath = paths.first{
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("userImage")
            debugPrint(imageURL)
            profPicture.image = UIImage(contentsOfFile: imageURL.path)
        } else {
            profPicture.image = UIImage(named: "スネ夫")
        }
        LvLavel.text = " 　Lv.\(user.level)"
        moneyLabel.text = "所持金　\(user.money) €riko"
        let nextLv = (user.level+1)*(user.level+1)*(user.level+1)*3/2
        expLabel.text = "あと　\(nextLv - user.exp)　の経験値"
        
        //表示するキャラの数
        if itemRepo.getChara() == 1 {
            //eriko
            for i in 0..<self.pinTitles.count {
                if itemRepo.getDigArray().contains(self.pinTitles[i]) {
                    appendMap(i: i)
                    itemRepo.switchChara(itemNum: 0)
                }
            }
        } else if itemRepo.getChara() == 2 {
            //slime
            for _ in 0..<30 {
                guard let indexSlime = pinTitles.firstIndex(of: "スライム") else {
                    print("Error:slime not found")
                    return
                }
                appendMap(i: indexSlime)
                itemRepo.switchChara(itemNum: 0)
            }
        } else  {
            let numChara:Int
            if itemRepo.getHoihoi() {
                numChara = 15
                itemRepo.changeHoihoi()
            } else {
                numChara = Int.random(in:7...10)
            }
            var countChara = 0
            for i in 0..<self.pinTitles.count {
                var rarity:Int
                if itemRepo.getLegacy() {
                    rarity = 11 - raritiesArray[i]
                } else {
                    rarity = raritiesArray[i]
                }
                let selectChara = Int.random(in: 1...rarity + 1)
                if selectChara == 1 && countChara < numChara && pinTitles[i] != "Yusuke" {
//                    print("name", pinTitles[i])
//                    print("motomoto", raritiesArray[i])
//                    print("hanten",rarity)
                    appendMap(i: i)
                    countChara += 1
                }
            
            }
            if itemRepo.getLegacy() {
                itemRepo.changeLegacy()
            }
            //Yusuke
            if itemRepo.getChara() == 3 {
                guard let indexYusuke = pinTitles.firstIndex(of: "Yusuke") else {
                    print("Error:Yusuke not found")
                    return
                }
                appendMap(i: indexYusuke)
                itemRepo.switchChara(itemNum: 0)
            }
        }
            
        
        for (index,pinTitle) in self.mapTargetTitle.enumerated(){
            let pin = MapAnnotationSetting()
            let annotation = MKPointAnnotation()
            let coordinate = self.pinlocations[index]
            pin.title = pinTitle
            pin.pinImage = mapTargetImage[index]
            pin.subtitle = String(raritiesObj[pinTitle!]!)
            pin.coordinate = coordinate
            self.mapView.addAnnotation(pin)
            annotation.coordinate = coordinate
        }


    }
    
    override func viewWillAppear(_ animated: Bool) {
        user = userDataUtils.getUser(name: userName) as? User
        
        userNameLabel.text = user.name
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let dirPath = paths.first{
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("userImage")
            debugPrint(imageURL)
            profPicture.image = UIImage(contentsOfFile: imageURL.path)
        } else {
            profPicture.image = UIImage(named: "スネ夫")
        }
        LvLavel.text = "Lv.\(user.level)"
        moneyLabel.text = "所持金　\(user.money) €riko"
        let nextLv = (user.level+1)*(user.level+1)*(user.level+1)*3/2
        expLabel.text = "あと　\(nextLv - user.exp)　の経験値"
        
    }
    
}


// 現在地取得の許可
extension MapViewController{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
            manager.requestWhenInUseAuthorization()
            break
        default:
            break
        }
    }
    
}


//タップしたピンの位置情報取得
extension MapViewController{
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        tapLatitude = view.annotation?.coordinate.latitude
        tapLongitude = view.annotation?.coordinate.longitude
        targetTitle = (view.annotation?.title)!
        targetCharacterImage = view.image
        targetRemoveAnnotaion = view.annotation
        targetRarity = Int((view.annotation?.subtitle)!!)
        
        let location = CLLocation(latitude: tapLatitude!, longitude: tapLongitude!)
        CLGeocoder().reverseGeocodeLocation(location){
            placemarks, error in
            guard let placemark = placemarks?.first, error == nil
//            var test: String?
//            guard let placemark = test, error == nil
            else {
                debugPrint("placeMark============= :  地上です")
                return self.targetPlace = "地上"
            }
            debugPrint("placeMark=============: \(placemark)")
            debugPrint("placeMark.name=============: \(placemark.name)")
            if let placemarkName = placemark.name {
                self.targetPlace = placemarkName
            }else{
                self.targetPlace = "不明な場所"
            }
        }
//        print("async check 1=================================")
//        let semaphore = DispatchSemaphore(value: 0)
//        reverseGeoCording(latitude: tapLatitude, longitude: tapLongitude) {
//            postalCode in
//            if let postalCode = postalCode {
//                print("postalCode : \(postalCode)")
//                self.targetPlace = postalCode
//                semaphore.signal()
//            }
//        }
//        semaphore.wait()
//        print("async check 4=================================")
        
        // ピンの情報削除
        self.mapView.removeAnnotation(view.annotation!)
        
        // 現在地を押してもARに切り替わらない処理
        if view.annotation is MKUserLocation{
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.performSegue(withIdentifier: "toARView", sender: self)
        }
        
    }
    
//    func reverseGeoCording(){
//        let location = CLLocation(latitude: tapLatitude!, longitude: tapLongitude!)
//        let semaphore = DispatchSemaphore(value: 0)
//        print("async check 2=================================")
//
//        CLGeocoder().reverseGeocodeLocation(location){
//            placemarks, error in
//            guard let placemark = placemarks?.first, error == nil
////            var test: String?
////            guard let placemark = test, error == nil
//            else {
//                debugPrint("placeMark============= :  地上です")
//                semaphore.signal()
//                return self.targetPlace = "地上"
//            }
//            debugPrint("placeMark=============: \(placemark)")
//            debugPrint("placeMark.name=============: \(placemark.name)")
//            self.targetPlace = placemark.name!
//            semaphore.signal()
//        }
//        semaphore.wait()
//    }
//    func reverseGeoCording(latitude: CLLocationDegrees, longitude: CLLocationDegrees, compltion: ((String?) -> Void)?){
//        let location = CLLocation(latitude: latitude, longitude: longitude)
//        print("async check 2=================================")
//
//        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
//            let place = placemarks?.first
//            compltion?(place?.name)
//        })
//        debugPrint("async check 3=================================")
//    }testtest

}



// ARに情報を渡す
extension MapViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toARView" {
            let nextView = segue.destination as! ARViewController
            nextView.characterImage = targetCharacterImage
            nextView.characterRarity = targetRarity
            nextView.characterPlace = targetPlace
            nextView.characterTitle = targetTitle
            nextView.characterMetObj = metCountObj
//            nextView.removeAnnotaion = targetRemoveAnnotaion
//            nextView.removeMap = mapView
        }
    }

}


//　（現在地情報何回も呼ばれるので）現在地情報取得したら初回のみ表示させる
extension MapViewController{
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if first{
//            first = false
//
//
//            if self.myLatitude == nil && self.myLongitude == nil{
//                myLatitude = locationManager.location?.coordinate.latitude
//                myLongitude = locationManager.location?.coordinate.longitude
//                let currentlocation = CLLocationCoordinate2DMake(myLatitude,myLongitude)
//                let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
//                let region = MKCoordinateRegion(center: currentlocation, span: span)
//                mapView.region = region
//                mapView.delegate = self
                //表示するキャラの数
//                let numChara:Int
//                if itemRepo.getHoihoi() {
//                    numChara = 15
//                } else {
//                    numChara = Int.random(in:7...10)
//                }
//                itemRepo.changeHoihoi()
//                var countChara = 0
//                for i in 0..<self.pinTitles.count {
//                    //表示するキャラの選択
//                    let selectChara = Int.random(in: 1...raritiesArray[i] + 1)
//                    if selectChara == 1 && countChara < numChara {
//                        appendMap(i: i)
//                        countChara += 1
//
//                    }
                    
                    //area map
//                    let mod = i % 10
//                    pinLocationAppend(count: mod)
//                }
                
//                for (index,pinTitle) in self.mapTargetTitle.enumerated(){
//                    let pin = MapAnnotationSetting()
//                    let coordinate = self.pinlocations[index]
//                    pin.title = pinTitle
//                    pin.subtitle = String(raritiesObj[pinTitle!]!)
//                    pin.pinImage = mapTargetImage[index]
//                    pin.coordinate = coordinate
//                    self.mapView.addAnnotation(pin)
//                    annotationArray.append(pin)
//                    print("annotationArray",annotationArray)
//                }
                
//            }
//        }
//    }
    
}


// ピンを全国にランダム配置する関数
extension MapViewController{
    
    func appendMap(i: Int) {
    //表示するかどうか
        //表示する場所
        let randomDouble1 = Double.random(in: -0.001...0.001)
        let randomDouble2 = Double.random(in: -0.001...0.001)
        pinlocations.append(CLLocationCoordinate2DMake(myLatitude+randomDouble1,myLongitude+randomDouble2))
        mapTargetTitle.append(pinTitles[i])
        mapTargetImage.append(pinImages[i])
    }
    
    func pinLocationAppend(count: Int) {
        switch count {
        case 0://沖縄左下
            let randomDouble1 = Double.random(in: 0.1...0.23)
            let randomDouble2 = randomDouble1 + Double.random(in: -0.1...0.03)
            pinlocations.append(CLLocationCoordinate2DMake(okinawaLatitude-randomDouble1,okinawaLongitude-randomDouble2))
        case 1://沖縄右上
            let randomDouble1 = Double.random(in: 0.001...0.3)
            let randomDouble2 = randomDouble1 + Double.random(in: 0...0.1)
            pinlocations.append(CLLocationCoordinate2DMake(okinawaLatitude+randomDouble1,okinawaLongitude+randomDouble2))
        case 2...4://本州右上
            let randomDouble1 = Double.random(in: -0.01...5)
            let randomDouble2 = randomDouble1 + Double.random(in: 0.3...2.5)
            pinlocations.append(CLLocationCoordinate2DMake(honshuLatitude+randomDouble1,honshuLongitude+randomDouble2))
        case 5...7://本州左下
            let randomDouble1 = Double.random(in: -0.01...2)
            let randomDouble2 = randomDouble1 + Double.random(in: 0...3)
            pinlocations.append(CLLocationCoordinate2DMake(honshuLatitude-randomDouble1,honshuLongitude-randomDouble2))
        case 8://北海道右上
            let randomDouble1 = Double.random(in: -1...1)
            let randomDouble2 = Double.random(in: -1...1)
            pinlocations.append(CLLocationCoordinate2DMake(hokkaidoLatitude+randomDouble1,hokkaidoLongitude+randomDouble2))
        case 9://北海道左下
            let randomDouble1 = Double.random(in: -1...1)
            let randomDouble2 = Double.random(in: -1...1)
            pinlocations.append(CLLocationCoordinate2DMake(hokkaidoLatitude-randomDouble1,hokkaidoLongitude-randomDouble2))
        default:
            break
        }
    }
    
}

// マップに画像やピンを立てる処理
extension MapViewController{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if (annotation is MKUserLocation) {
            return nil
        }
        
        let identifier = "pin"
        var annotationView:MKAnnotationView!
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation:annotation,reuseIdentifier: identifier)
        }
        
        if let pin = annotation as? MapAnnotationSetting{
            if let pinImage = pin.pinImage{
                annotationView.image = pinImage
            }
        }
        
        annotationView.annotation = annotation

        return annotationView
    }
    
}
