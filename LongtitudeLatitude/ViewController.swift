//
//  ViewController.swift
//  LongtitudeLatitude
//
//  Created by chia on 2021/4/2.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var InfoTextView: UITextView!
    var longdegree = 0, latdegree = 0
    var longmin = 0.0, latmin = 0.0
    var longIntsec = 0, latIntsec = 0
    var longsec = 0.0, latsec = 0.0
    var longminStr = "", latminStr = ""
    var longsecStr = "",latsecStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    func myPostition() {
        MapView.showsUserLocation = true
        let position = MapView.userLocation
        let region = MKCoordinateRegion(center: position.coordinate, latitudinalMeters: 300, longitudinalMeters: 300)
        MapView.setRegion(region, animated: true)
        latitude.text = "\(position.coordinate.latitude)"
        longitude.text = "\(position.coordinate.longitude)"
    }
    @IBAction func MySite(_ sender: Any) {
        myPostition()
    }
    
    @IBAction func Convertto(_ sender: Any) {
        Convert()
    }
    func Convert() {
        if let mylong = Double(longitude.text!) {
            if let mylat = Double(latitude.text!) {
                longdegree = Int(mylong)
                latdegree = Int(mylat)
                longmin = (mylong - Double(longdegree)) * 60
                longminStr = String(format: "%.3f", longmin)
                latmin = (mylat - Double(latdegree)) * 60
                latminStr = String(format: "%.3f", latmin)
                longIntsec = Int(longmin)
                latIntsec = Int(latmin)
                longsec = (longmin - Double(longIntsec)) * 60
                latsec = (latmin - Double(latIntsec)) * 60
                longsecStr = String(format: "%.3f", longsec)
                latsecStr = String(format: "%.3f", latsec)
                
                InfoTextView.text = "緯度：\(latdegree) 緯分：\(latminStr)\n經度：\(longdegree) 經分：\(longminStr)\n\n\n緯度：\(latdegree)緯分：\(latminStr) 緯秒：\(latsecStr)\n經度：\(longdegree) 經分：\(longminStr) 經秒：\(longsecStr) "
            
                //MapView.addAnnotation(<#T##annotation: MKAnnotation##MKAnnotation#>)
//                let mysite = MKCoordinateSpan(latitudeDelta: mylat, longitudeDelta: mylong)
//                print(mysite)
//                print(mylat)
            }
        }
    }
}

