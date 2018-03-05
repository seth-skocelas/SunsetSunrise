//
//  Constants.swift
//  SunsetSunrise
//
//  Created by Seth Skocelas on 3/4/18.
//  Copyright © 2018 Seth Skocelas. All rights reserved.
//

import Foundation

let BASE_URL = "https://api.sunrise-sunset.org/json?"
let LATITUDE = "lat=32.7808320"
let LONGITUDE = "&lng=-96.7993290"
let DATE = "&date="
let FORMATTING = "&formatted=0"

typealias DownloadComplete = () -> ()

let MAIN_URL = "\(BASE_URL)\(LATITUDE)\(LONGITUDE)\(FORMATTING)"
