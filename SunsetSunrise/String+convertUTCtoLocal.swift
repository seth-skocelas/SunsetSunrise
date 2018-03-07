//
//  Date+convertUTCtoLocal.swift
//  SunsetSunrise
//
//  Created by Seth Skocelas on 3/4/18.
//  Copyright © 2018 Seth Skocelas. All rights reserved.
//

import Foundation

extension String {
    
    func convertUTCtoLocal(dateFormatterString: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = dateFormatter.date(from: self) {
            
            dateFormatter.dateFormat = "h:mm a"
            dateFormatter.timeZone = TimeZone.autoupdatingCurrent
            
            return dateFormatter.string(from: date)
        }
        
        return ""
        
    }
    
}
