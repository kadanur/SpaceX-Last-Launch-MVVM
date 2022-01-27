//
//  Space.swift
//  AppNationCase
//
//  Created by M Kaan Adanur on 26.01.2022.
//

import Foundation

struct Space: Codable{
    
    
    var name: String
    var flight_number: Int?
    var date_unix: Double?
    var details : String?
    var links: Links
}

struct Links: Codable{
    var patch: Patch
    var webcast: String?
    var wikipedia: String?
}

struct Patch: Codable{
    var small: String
    var large: String
}
