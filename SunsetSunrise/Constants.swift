//
//  Constants.swift
//  SunsetSunrise
//
//  Created by Seth Skocelas on 3/4/18.
//  Copyright © 2018 Seth Skocelas. All rights reserved.
//

import Foundation

let BASE_URL = "https://api.sunrise-sunset.org/json?"
let LATITUDE = "lat="
let LONGITUDE = "&lng="
let DATE = "&date="
let FORMATTING = "&formatted=0"

typealias DownloadComplete = () -> ()

let MAIN_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(FORMATTING)"
