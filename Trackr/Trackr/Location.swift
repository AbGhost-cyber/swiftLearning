//
//  Location.swift
//  Trackr
//
//  Created by dremobaba on 2022/12/11.
//

import Foundation
struct Location{
    let id:Int
    let name:String
    let country:String
    let description:String
    let more:String
    let latitude:Double
    let longitude:Double
    let heroPicture:String
    let advisory:String
    
    static let example = Location(id: 1, name: "Great Smokey Mountain", country: "United States", description: "A great place to visit", more: "More text here", latitude: 35.6532, longitude: -83.50, heroPicture: "smokies", advisory: "Beware of the bears!")
}
