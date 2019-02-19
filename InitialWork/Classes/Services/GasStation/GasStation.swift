//
//  GasStation.swift
//  ParklandFuelpricecollector
//
//  Created by Gunjan on 18/10/18.
//  Copyright © 2018 Parkland. All rights reserved.
//

import UIKit
extension ApiManager {
    
class GasStation: ApiCommunicator {
    
    init() {
        super.init(subPath: "")
    }
    func getGasstation( lat: Double,
                 long: Double,
                 radius: String,
                 api_key: String,
                 limit: String,
                 fuel_type: String, completion: @escaping ([NSDictionary]?, String?)->Void) {
        
        let params = [
            "latitude": "\(lat)",
            "longitude": "\(long)",
            "radius" : "\(radius)",
             "limit" : "\(limit)",
             "fuel_type" : "\(fuel_type)",
              "api_key" : "\(api_key)"
        ]
        self.executeApi(endpoint: "nearest.json?", params: params, method: .get) { (data: [NSDictionary]?, message, code) in
            if let Gasdata = data, code == 200
            {
                completion(Gasdata, message)
            } else {completion(nil, message)
            }
        }
      }
    
    
    }
}
