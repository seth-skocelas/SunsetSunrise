//
//  MainVC.swift
//  SunsetSunrise
//
//  Created by Seth Skocelas on 3/4/18.
//  Copyright © 2018 Seth Skocelas. All rights reserved.
//

import UIKit

class MainVC: UIViewController {


    @IBOutlet weak var sunriseTime: UILabel!
    @IBOutlet weak var sunsetTime: UILabel!
    @IBOutlet weak var solarNoonTime: UILabel!
    
    var currentSunTimes: SunTimes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentSunTimes = SunTimes()
        currentSunTimes.downloadSunTimeDetails {
            self.sunsetTime.text = self.currentSunTimes._sunsetTime
            self.sunriseTime.text = self.currentSunTimes._sunriseTime
            self.solarNoonTime.text = self.currentSunTimes._solarNoon
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

