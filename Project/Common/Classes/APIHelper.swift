//
//  APIHelper.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import Foundation

final class APIHelper {
    
    static func request<T:Decodable>(endpoint: String,
                                     responseType: T.Type,
                                     mockType: MockType,
                                     completion: @escaping (_ response: T?) -> Void) {
        
        let serverURL: String = Constants.API.BaseURL + endpoint
        
        let request = NSMutableURLRequest()
        request.timeoutInterval = 30
        request.cachePolicy = .useProtocolCachePolicy
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        request.setValue(Constants.API.APIKey, forHTTPHeaderField: "X-CoinAPI-Key")
        request.url = URL(string: serverURL)
        
        //---------------------------------------------------------
        //  Running tests
        //---------------------------------------------------------
        
        if Preferences.isRunningTests {
            if Preferences.isRunningTestsFail {
                completion(nil)
            }else{
                if let mock = Mock.shared.load(type: mockType) {
                    let parse = try? JSONDecoder().decode(T.self, from: mock)
                    completion(parse)
                }
            }
            return
        }
        
        //---------------------------------------------------------
        //  Load API
        //---------------------------------------------------------
        
        DispatchQueue.global().async {
            let _ = URLSession.shared.dataTask(with: request as URLRequest,
                                               completionHandler: { data, response, _ -> Void in
                DispatchQueue.main.async {
                    if let data = data, data.count != 0 {
                        do {
                            let parse = try JSONDecoder().decode(T.self, from: data)
                            completion(parse)
                        }catch{
                            print(error)
                            completion(nil)
                        }
                    }else{
                        completion(nil)
                    }
                }
            }).resume()
        }
    }
}
