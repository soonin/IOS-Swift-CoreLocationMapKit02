//
//  ViewController.swift
//  IOS-Swift-CoreLocationMapKit02
//
//  Created by Pooya on 2018-10-06.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate{

    
    @IBOutlet weak var lonView: UITextField!
    @IBOutlet weak var latView: UITextField!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard  let trueData: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        print("location = \(trueData.latitude) , \(trueData.longitude)")
        
        self.latView.text = "Latitude: \(trueData.latitude)"
        self.lonView.text = "Longitude: \(trueData.longitude)"
    }
    
}

