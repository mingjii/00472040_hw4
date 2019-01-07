//
//  airResults.swift
//  iOSChartsDemo
//
//  Created by User19 on 2019/1/6.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import Foundation



struct AirResults: Codable {
    //var success: Bool
    var result: AirDataResult
    

}

struct AirDataResult: Codable {
    var records: [AirData]
    
}

struct AirData: Codable {
    /*
    var SiteName: String?
    var County: String?
    var AQI: String?
    var Pollutant: String?
    var Status: String?
    var SO2: String?
    var CO: String?
    var CO_8hr: String?
    var O3: String?
    var O3_8hr: String?
    var PM10: String?
    var PM25 : String?
    var NO2: String?
    var NOx: String?
    var NO: String?
    var PublishTime: String?
    
    enum CodingKeys: String, CodingKey {
        case SiteName
        case County
        case AQI
        case Pollutant
        case Status
        case SO2
        case CO
        case CO_8hr
        case O3
        case O3_8hr
        case PM25 = "PM2.5"
        case PM10
        case NO2
        case NOx
        case NO
        case PublishTime
    }
    */
    
    var siteName: String
    var county: String
    var aQI: String
    var pollutant: String
    var status: String
    var sO2: String
    var cO: String
    var cO8hr: String
    var o3: String
    var o38hr: String
    var pM10: String
    var pM25 : String
    var pM25AVG: String
    var pM10AVG: String
    var nO2: String
    var nOx: String
    var nO: String
    var publishTime: String
    
     enum CodingKeys: String, CodingKey {
         case siteName = "SiteName"
         case county = "County"
         case aQI = "AQI"
         case pollutant = "Pollutant"
         case status = "Status"
         case sO2 = "SO2"
         case cO = "CO"
         case cO8hr = "CO_8hr"
         case o3 = "O3"
         case o38hr = "O3_8hr"
         case pM10 = "PM10"
         case pM25 = "PM2.5"
         case pM25AVG = "PM2.5_AVG"
         case pM10AVG = "PM10_AVG"
         case nO2 = "NO2"
         case nOx = "NOx"
         case nO = "NO"
         case publishTime = "PublishTime"
        
        
     
     }


}




