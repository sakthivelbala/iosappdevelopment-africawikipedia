//
//  LocationModel.swift
//  Africa
//
//  Created by Sakthivel Balakrishnan on 15/01/21.
//

import Foundation
import MapKit

struct NationalParkLocation:Codable,Identifiable {
    let id:String
    let name:String
    let image:String
    let latitude:Double
    let longitude:Double
    //computer property
    var location:CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
