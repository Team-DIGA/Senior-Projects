//
//  MapViewController.swift
//  DIGA
//
//  Created by Rintaro Kimura on 2022/06/29.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    var locationManager: CLLocationManager!
    
    // 取得した緯度経度を保持するインスタンス
    var my_latitude: CLLocationDegrees!
    var my_longitude: CLLocationDegrees!
    
    // タップした緯度経度を保持するインスタンス
    var tap_latitude: CLLocationDegrees!
    var tap_longitude:CLLocationDegrees!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager!.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        my_latitude = locationManager.location?.coordinate.latitude
        my_longitude = locationManager.location?.coordinate.longitude
//        debugPrint(my_latitude!)
//        debugPrint(my_longitude!)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let currentlocation = CLLocationCoordinate2DMake(my_latitude!,my_longitude!)
        let region = MKCoordinateRegion(center: currentlocation, span: span)
        
        let pin = MKPointAnnotation()
        pin.title = "title"
        pin.subtitle = "subtitle"
        pin.coordinate = currentlocation
        
        mapView.addAnnotation(pin)
        mapView.region = region
        mapView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.coordinate)
        print(view.annotation?.title)
        print(view.annotation?.subtitle)
        tap_latitude = view.annotation?.coordinate.latitude
        tap_longitude = view.annotation?.coordinate.longitude
        reverseGeoCording()
        self.performSegue(withIdentifier: "toARView", sender: self)
    }
    
    func reverseGeoCording(){
        let location = CLLocation(latitude: tap_latitude!, longitude: tap_longitude!)
        
        CLGeocoder().reverseGeocodeLocation(location){
            placemarks, error in
            guard let placemark = placemarks?.first, error == nil else {return}
            print(placemark.name!)
            print(placemark.administrativeArea!)
            print(placemark.subAdministrativeArea ?? "")
            print(placemark.locality!)
            print(placemark.administrativeArea! + placemark.locality! + placemark.name!)
        }
    }
    
}
