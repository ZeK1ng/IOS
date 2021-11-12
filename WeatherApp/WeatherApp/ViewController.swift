//
//  ViewController.swift
//  WeatherApp
//
//  Created by zeking on 2/8/21.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @IBOutlet var lbl : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        print(locationManager.location)
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {

        let locValue:CLLocationCoordinate2D = manager.location!.coordinate

        lbl?.text="locations = \(locValue.latitude) \(locValue.longitude)"

    }
    private func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("ASD")
        print(error as Any)
        manager.stopUpdatingLocation()
    }
    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("ASDASDAS")
    }
  
}



