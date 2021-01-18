//
//  VideoModel.swift
//  Africa
//
//  Created by Sakthivel Balakrishnan on 15/01/21.
//

import Foundation

struct Video:Codable,Identifiable {
    let id:String
    let name:String
    let headline:String
    //Computed property
    var thumbnail:String{
        "video-\(id)"
    }
}
