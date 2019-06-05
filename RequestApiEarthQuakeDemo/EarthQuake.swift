//
//  EarthQuake.swift
//  RequestApiEarthQuakeDemo
//
//  Created by Vu on 4/25/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import Foundation




class EarthQuake {
    var features: [Features] = []
//    var box: [Double] = []
    
    init(dict: JSON) {
        let featuresData = dict["features"] as? [JSON] ?? []
        for item in featuresData {
            features.append(Features(dict: item))
        }
//        let bbox = dict["bbox"] as? [Double] ?? []
//        for item in bbox {
//            box.append(item)
//        }
        
    }
}

struct Features {
    var id: String?
    var mag: Double?
    var place: String?
    var timeInterval: TimeInterval?
    var timeString: String?
    let dateString: String!
    init(dict: JSON) {
        id = dict["id"] as? String ?? ""
        let properties = dict["properties"] as? JSON ?? [:]
        mag = properties["mag"] as? Double
        place = properties["place"] as? String
        timeInterval = properties["time"] as? TimeInterval

        
        
        let dataForMater = DateFormatter()
        dataForMater.timeStyle = .short
        self.timeString = dataForMater.string(from: Date(timeIntervalSince1970: timeInterval ?? 0 * 1/1000))
        dataForMater.timeStyle = .none
        dataForMater.dateStyle = .medium
        self.dateString = dataForMater.string(from: Date(timeIntervalSince1970: (timeInterval ?? 0) * 1/1000))
        print(dateString)
        
        
        
}
}
