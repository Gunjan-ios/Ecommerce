//
//  ApiCommunicator.swift
//  GEM
//
//  Created by Lasith Hettiarachchi on 10/23/17.
//  Copyright © 2017 Lasith Hettiarachchi. All rights reserved.
//

import Foundation
import Alamofire

class ApiCommunicator {
    
    var baseUrl: String
    var api_url: String
    var api_version = "v1"
    
    init(subPath: String?) {
           self.baseUrl = DEV_URL
           self.api_url = self.baseUrl
           self.api_url = "\(self.baseUrl)/\(self.api_version)/"
        }
//        if AppData.getAppEnvironment() == AppEnvironment.dev {
//            self.baseUrl = DEV_URL
//        } else if AppData.getAppEnvironment() == AppEnvironment.live {
//            self.baseUrl = LIVE_URL
//        } else {
//            self.baseUrl = STAGING_URL
//        }
    
//        if let path = subPath, path.count > 0 {
//            self.api_url += "\(path)/"
//        }

    
    func executeApi(endpoint: String, params:[String: Any], method: HTTPMethod, completionArray: (([NSDictionary]?, String?, Int?) -> Void)?) {
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        print("------------- REQUEST -------------")
        dump(params)
        print("\(self.api_url)\(endpoint)")
        Alamofire.request("\(self.api_url)\(endpoint)", method: method, parameters: params, headers: headers)
            
            .responseJSON(completionHandler: { (response) in
                
                let error = response.result.error
                let value = response.result.value
                let code = response.response?.statusCode
                
                let message: String? = nil
//                if response.response == nil {
//                    message = "Please check your internet connection."
//                } else {
//                    message = "Server error"
//                }
                
                if error != nil {
                    NSLog("[APIClient] | [\(endpoint)] | Error = \(String(describing: error?.localizedDescription))")
                    completionArray?(nil, message, code)
                    return
                    
                } else if let object = value as? NSDictionary {
                    
                    let stat = object.value(forKey: "total_results") as! NSInteger                    
                    if  stat > 0
                      {
                        completionArray?(object.value(forKey: "fuel_stations") as? [NSDictionary], "successfully", code)
                    }
                    else {
                        completionArray?(nil,  "Ooopss....Data not Found !!", code)
                    }
                    
                    return
                    
                } else {
                    NSLog("[APIClient] | [\(endpoint)] | response.value is nil")
                    completionArray?(nil, message, code)
                    return
                }
            })
            .responseString { (res) in

                print("------------- RESPONSE -------------")
                print(res.response?.statusCode ?? "No status code found")
                dump(res.result.value ?? "result.value is nil")
        }
    }
    
    func executeApi(endpoint: String, params:[String: Any], method: HTTPMethod, completionObject:((NSDictionary?, String?, Int?) -> Void)?) {
        
        var headers = [
            "Content-Type": "application/x-www-form-urlencoded"
//            "Content-Type" : "application/json; charset=UTF-8"
        ]
        
        if let at = UserData.AuthorizationData.getAccessToken(), let client = UserData.AuthorizationData.getClient(), let uid = UserData.AuthorizationData.getUId() {
            headers["access-token"] = at
            headers["client"] = client
            headers["uid"] = uid
        }
        
        print("------------- REQUEST -------------")
        dump(params)
        print("\(self.api_url)\(endpoint)")
        Alamofire.request("\(self.api_url)\(endpoint)", method: method, parameters: params, headers: headers)
            
            .responseJSON(completionHandler: { (response) in
                
                print(response)
//                print(response.result)
//                print(response.result.isSuccess)
                
                let error = response.result.error
                let value = response.result.value
                let code = response.response?.statusCode
                
                var message: String? = nil
                if response.response == nil {
                    message = "Please check your internet connection."
                }
                else
                {
                    message = ""
                }
                
                if error != nil {
                    NSLog("[APIClient] | [\(endpoint)] | Error = \(String(describing: error?.localizedDescription))")
                    completionObject?(nil, message, code)
                    return
                } else if let object = value as? NSDictionary {
                    if let res = object.value(forKey: "res") as? NSDictionary{
                        completionObject?(res, message, code)
                    } else if let stat = object.value(forKey: "status") as? Bool, stat {
                        print(response.result)
                        completionObject?(object.value(forKey: "data") as? NSDictionary, object.value(forKey: "message") as? String, code)
                    } else {
                        if let msg = object.value(forKey: "message") as? String {
                            message = msg
                        }
                        completionObject?(nil, message, code)
                    }
                    return} else {
                    NSLog("[APIClient] | [\(endpoint)] | response.value is nil")
                    completionObject?(nil, message, code)
                    return
                }
            })
            .responseString { (res) in
                print("------------- RESPONSE -------------")
                print(res.response?.statusCode ?? "No status code found")
                dump(res.result.value ?? "result.value is nil")
        }
    }
    
    func executeApi(endpoint: String, params:[String: Any], method: HTTPMethod, completionObject:((String?, Int?) -> Void)?) {
        
        var headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        if let at = UserData.AuthorizationData.getAccessToken(), let client = UserData.AuthorizationData.getClient(), let uid = UserData.AuthorizationData.getUId() {
            headers["access-token"] = at
            headers["client"] = client
            headers["uid"] = uid
        }
        
        print("------------- REQUEST -------------")
        dump(params)
        print("\(self.api_url)\(endpoint)")
        Alamofire.request("\(self.api_url)\(endpoint)", method: method, parameters: params, headers: headers)
            
            .responseJSON(completionHandler: { (response) in
                
                let value = response.result.value
                let code = response.response?.statusCode
                
                var message: String? = nil
                
                if response.response == nil {
                    message = "Please check your internet connection."
                }
                
                if let object = value as? NSDictionary {
                        if let msg = object.value(forKey: "message") as? String {
                            message = msg
                        }
                    }
                    
                completionObject?(message, code)

            })
            .responseString { (res) in
                
                print("------------- RESPONSE -------------")
                print(res.response?.statusCode ?? "No status code found")
                dump(res.result.value ?? "result.value is nil")
        }
    }
    
    
}
