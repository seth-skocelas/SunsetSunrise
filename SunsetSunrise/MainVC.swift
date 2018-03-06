//
//  MainVC.swift
//  SunsetSunrise
//
//  Created by Seth Skocelas on 3/4/18.
//  Copyright © 2018 Seth Skocelas. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class MainVC: UIViewController, CLLocationManagerDelegate {


    @IBOutlet weak var sunriseTime: UILabel!
    @IBOutlet weak var sunsetTime: UILabel!
    @IBOutlet weak var solarNoonTime: UILabel!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currentSunTimes: SunTimes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        currentSunTimes = SunTimes()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        locationAuthStatus()
        
        
    }

    
    func locationAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
            currentLocation = locationManager.location
            
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            currentSunTimes.downloadSunTimeDetails {
                self.updateUI()
            }
            
        } else {
            
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
            
        }
        
    }
    
    func updateUI() {
        
        self.sunsetTime.text = self.currentSunTimes._sunsetTime
        self.sunriseTime.text = self.currentSunTimes._sunriseTime
        self.solarNoonTime.text = self.currentSunTimes._solarNoon
        
    }


}

