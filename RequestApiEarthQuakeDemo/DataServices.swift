//
//  DataServices.swift
//  RequestApiEarthQuakeDemo
//
//  Created by Vu on 4/25/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import Foundation
import UIKit
typealias JSON = Dictionary<AnyHashable, Any>

class DataServices {
    static let shared: DataServices = DataServices()
    var quakeInfo : [EarthQuake] = []
//    var uRl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson"
    
    func requestApiQuake( completeHandle:  @escaping(EarthQuake) -> Void) {
        guard let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson") else { return}
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, reponse, err) in
            guard err == nil else {
                print(err?.localizedDescription ?? "Reponse Error")
                return
            }
            guard let aData = data else { return }
            do {
                if let jsonQuake = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? JSON {
                    DispatchQueue.main.async {
                      completeHandle(EarthQuake(dict: jsonQuake))
                    }
                }
                
            } catch {
                print(err?.localizedDescription)
            }
        }
        dataTask.resume()
    }
//    func loadInfo(completeHandler: @escaping ([EarthQuake]) -> Void) {
//        quakeInfo = []
//        requestApiQuake(urlString: uRl) { [unowned self] json in
//            guard let dictFeatures = json["features"] as? [JSON] else {return}
//            for featuresJson in dictFeatures {
//                if let propertiesJson = featuresJson["properties"] as? JSON {
//                    if let quake = EarthQuake(dict: propertiesJson) {
//                        self.quakeInfo.append(quake)
//                        print(self.quakeInfo)
//                    }
//                }
//            }
//            //            print(self.quakeInfo)
//            completeHandler(self.quakeInfo)
//        }
//    }

}
