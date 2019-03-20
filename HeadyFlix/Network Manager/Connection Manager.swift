//
//  Connection Manager.swift
//  HeadyFlix
//
//  Created by Nakul Hindustani on 20/03/19.
//  Copyright © 2019 Nakul Hindustani. All rights reserved.
//

import Foundation

class ConnectionManager {
    
    static let instance = ConnectionManager()
    
    func callAPI(success: @escaping ((_ response: AnyObject?) -> Void), failure: @escaping ((_ error: NSError?) -> Void)) {
        
        var request = URLRequest(url: URL(string: "https://celebritybucks.com/developers/birthdays/JSON")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                if let jsonData = data {
                    let json = try JSONSerialization.jsonObject(with: jsonData) as? Dictionary<String, AnyObject>
                    success(json as AnyObject)
                }
            } catch {
                print("error")
            }
        }).resume()
    }
}
