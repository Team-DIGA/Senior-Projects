//
//  MapViewController.swift
//  DIGA
//
//  Created by Rintaro Kimura on 2022/06/29.
//

import UIKit
import CoreLocation
import MapKit

class MapAnnotationSetting:MKPointAnnotation{
    var pinImage:UIImage?
}

extension UIImage {
    func resized(size: CGSize) -> UIImage {
            // リサイズ後のサイズを指定してUIGraphicsImageRendererを作成する
            let renderer = UIGraphicsImageRenderer(size: size)
            return renderer.image { (context) in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    
    // 取得した緯度経度を保持するインスタンス
    var myLatitude: CLLocationDegrees!
    var myLongitude: CLLocationDegrees!
    
    // タップした緯度経度を保持するインスタンス
    var tapLatitude: CLLocationDegrees!
    var tapLongitude: CLLocationDegrees!
    var targetTitle = ""
    var targetCharacterImage: UIImage?
    var targetRemoveAnnotaion: MKAnnotation?
    
    // 位置情報初回のみ表示させる際のグローバル変数
    var first = true
    
    // 表示させる画像の配列
    var pinImagges:[UIImage?] = [
        UIImage(named: "exeid")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "gokuu")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "luffy")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "ana")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "anpanman")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "arumin")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "asitaka")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "baikinman")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "bejiita")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "blook")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "bou")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "carrepanman")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "cheeze")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "cririn")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "cyopper")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "donarud")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "doremon")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "dormi")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "eluza")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "eren")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "eriko")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "flankey")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "aguufyye")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "hauru")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "inosuke")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "jyian")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "mickey")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "mikasa")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "minnie")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "nakkuruz")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "nami")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "nausika")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "nezuko")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "nobita")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "pikkoro")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "puyo")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "robin")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "san")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "sanji")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "shadow")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "sizuka")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "sonic")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "suneo")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "syokupanman")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "tanjiro")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "teirus")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "titan")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "totoro")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "usop")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "zenitu")?.resized(size:CGSize(width: 50, height: 50)),
        UIImage(named: "zoro")?.resized(size:CGSize(width: 50, height: 50)),
    ]
    var pinTitles:[String] = [
        "exeid",
        "gokuu",
        "luffy",
        "ana",
        "anpanman",
        "arumin",
        "asitaka",
        "baikinman",
        "bejiita",
        "blook",
        "bou",
        "carrepanman",
        "cheeze",
        "cririn",
        "cyopper",
        "donarud",
        "doremon",
        "dormi",
        "eluza",
        "eren",
        "eriko",
        "flankey",
        "guufyye",
        "hauru",
        "inosuke",
        "jyian",
        "mickey",
        "mikasa",
        "minnie",
        "nakkuruz",
        "nami",
        "nausika",
        "nezuko",
        "nobita",
        "pikkoro",
        "puyo",
        "robin",
        "san",
        "sanji",
        "shadow",
        "sizuka",
        "sonic",
        "suneo",
        "syokupanman",
        "tanjiro",
        "teirus",
        "titan",
        "totoro",
        "usop",
        "zenitu",
        "zoro"
    ]
    var pinlocations:[CLLocationCoordinate2D] = []
    
    var randomInt: Int {
        get {
            return Int.random(in: 2..<pinTitles.count)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager!.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        myLatitude = locationManager.location?.coordinate.latitude
        myLongitude = locationManager.location?.coordinate.longitude
//        myLatitude = 35.1707
//        myLongitude = 136.8826
        guard let latitude = myLatitude else {return}
        guard let longitude = myLongitude else {return}
        debugPrint(latitude)
        debugPrint(longitude)

        let currentlocation = CLLocationCoordinate2DMake(latitude,longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: currentlocation, span: span)

        mapView.region = region
        mapView.delegate = self
        
        for i in 1..<52{
            if i % 2 == 0 {
                let randomDouble1 = Double.random(in: 0.0001...0.001)
                let randomDouble2 = Double.random(in: 0.0001...0.001)
                pinlocations.append(CLLocationCoordinate2DMake(latitude+randomDouble1,longitude-randomDouble2))
            } else {
                let randomDouble1 = Double.random(in: 0.0001...0.001)
                let randomDouble2 = Double.random(in: 0.0001...0.001)
                pinlocations.append(CLLocationCoordinate2DMake(latitude-randomDouble1,longitude+randomDouble2))
            }
        }
        
        for (index,pinTitle) in self.pinTitles.enumerated(){
            let pin = MapAnnotationSetting()
            let coordinate = self.pinlocations[index]
            pin.title = pinTitle
            pin.pinImage = pinImagges[index]
            pin.coordinate = coordinate
            self.mapView.addAnnotation(pin)
        }

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
        targetTitle = (view.annotation?.title)!!
        targetCharacterImage = view.image
        targetRemoveAnnotaion = view.annotation
        
        // ピンの情報削除
        self.mapView.removeAnnotation(view.annotation!)
        
        reverseGeoCording()
        self.performSegue(withIdentifier: "toARView", sender: self)
    }
    
    func reverseGeoCording(){
        let location = CLLocation(latitude: tapLatitude!, longitude: tapLongitude!)
        
        CLGeocoder().reverseGeocodeLocation(location){ [self]
            placemarks, error in
            guard let placemark = placemarks?.first, error == nil else {return}
            
            debugPrint(placemark)
            debugPrint(placemark.areasOfInterest ?? "nil")
            debugPrint(placemark.administrativeArea! + placemark.locality! + placemark.name!)
        }
        
        
    }

}



// ARに情報を渡す
extension MapViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "toARView" {
        let nextView = segue.destination as! ARViewController
          nextView.characterImage = targetCharacterImage
          nextView.removeAnnotaion = targetRemoveAnnotaion
          nextView.removeMap = mapView
      }
    }
    
}


//　（現在地情報何回も呼ばれるので）現在地情報取得したら初回のみ表示させる
extension MapViewController{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if first{
            first = false
            
            if self.myLatitude == nil && self.myLongitude == nil{
                myLatitude = locationManager.location?.coordinate.latitude
                myLongitude = locationManager.location?.coordinate.longitude
//                myLatitude = 35.1707
//                myLongitude = 136.8826
                let currentlocation = CLLocationCoordinate2DMake(myLatitude,myLongitude)
                let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                let region = MKCoordinateRegion(center: currentlocation, span: span)
                mapView.region = region
                mapView.delegate = self
                
                for i in 1..<52{
                if i % 2 == 0 {
                    let randomDouble1 = Double.random(in: 0.0001...0.001)
                    let randomDouble2 = Double.random(in: 0.0001...0.001)
                    pinlocations.append(CLLocationCoordinate2DMake(myLatitude+randomDouble1,myLongitude-randomDouble2))
                } else {
                    let randomDouble1 = Double.random(in: 0.0001...0.001)
                    let randomDouble2 = Double.random(in: 0.0001...0.001)
                    pinlocations.append(CLLocationCoordinate2DMake(myLatitude-randomDouble1,myLongitude+randomDouble2))
                    }
                }
                
                for (index,pinTitle) in self.pinTitles.enumerated(){
                    let pin = MapAnnotationSetting()
                    let coordinate = self.pinlocations[index]
                    pin.title = pinTitle
                    pin.pinImage = pinImagges[index]
                    pin.coordinate = coordinate
                    self.mapView.addAnnotation(pin)
                }
                
            }
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
//        吹き出しの表示
//        annotationView.canShowCallout = true
        return annotationView
    }
    
}
