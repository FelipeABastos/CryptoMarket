//
//  Exchange+APIHelper.swift
//  CryptoMarketTests
//
//  Created by Felipe Amorim Bastos on 14/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import Foundation

extension Exchange {
    
    static func loadAll(_ completion: @escaping (_ result: [Exchange]?) -> Void) {
        
        APIHelper.request(endpoint: Constants.API.Endpoint.Exchanges,
                          responseType: [Exchange].self,
                          mockType: .exchanges) { response  in
            completion(response)
        }
    }
    
    static func loadIcons(_ completion: @escaping (_ result: [ExchangeIcon]?) -> Void) {
        
        APIHelper.request(endpoint: Constants.API.Endpoint.ExchangesIcons,
                          responseType: [ExchangeIcon].self,
                          mockType: .exchangesIcons) { response  in
            completion(response)
        }
    }
}
