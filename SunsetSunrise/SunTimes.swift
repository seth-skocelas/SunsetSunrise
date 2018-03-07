//
//  SunTimes.swift
//  SunsetSunrise
//
//  Created by Seth Skocelas on 3/4/18.
//  Copyright © 2018 Seth Skocelas. All rights reserved.
//

import UIKit
import Alamofire

class SunTimes {
    
    var _sunriseTime: String!
    var _sunsetTime: String!
    var _solarNoon: String!
    var _dayLength: Int!
    
    var sunriseTime: String {
        if _sunriseTime == nil {
            return ""
        }
        return _sunriseTime
    }
    
    var sunsetTime: String {
        if _sunsetTime == nil {
            return ""
        }
        return _sunsetTime
    }
    
    var solarNoon: String {
        if _solarNoon == nil {
            return ""
        }
        return _solarNoon
    }
    
    var dayLength: Int {
        if _dayLength == nil {
            return 0
        }
        return _dayLength
    }
    
    func downloadSunTimeDetails(completed: @escaping DownloadComplete) {
        
        let mainURL = URL(string: MAIN_URL)!
        print(mainURL)
        
        Alamofire.request(mainURL).responseJSON { response in
            
            let result = response.result
            
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let suntimeResults = dict["results"] as? Dictionary<String, AnyObject> {
                    
                    if let sunset = suntimeResults["sunset"] as? String {
                        
                        self._sunsetTime = String(sunset.dropLast(6)).convertUTCtoLocal(dateFormatterString: "yyyy-MM-dd'T'HH:mm:ss")
                        
                    }
                    
                    if let sunrise = suntimeResults["sunrise"] as? String {
                        self._sunriseTime = String(sunrise.dropLast(6)).convertUTCtoLocal(dateFormatterString: "yyyy-MM-dd'T'HH:mm:ss")
                    }
                    
                    if let solarNoonTime = suntimeResults["solar_noon"] as? String {
                        self._solarNoon = String(solarNoonTime.dropLast(6)).convertUTCtoLocal(dateFormatterString: "yyyy-MM-dd'T'HH:mm:ss")
                    }
                    
                    if let dayLengthTime = suntimeResults["day_length"] as? Int {
                        self._dayLength = dayLengthTime
                    }
                    
                }
                
            }
            
            completed()
        }
        
    }
    
}



