//
//  Locations.swift
//  Trackr
//
//  Created by dremobaba on 2022/12/11.
//

import Foundation

class Locations: ObservableObject {
    let places:[Location]
    
    init(places: [Location]) {
        self.places = places
    }
}
