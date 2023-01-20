//
//  PreviewData.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import Foundation

final class PreviewData {
    
    static var exchange: Exchange {
        exchanges().first!
    }
    
    static func exchanges() -> [Exchange] {
        
        var list: [Exchange] = []
        
        if let mock = Mock.shared.load(type: .exchanges),
           let parse = try? JSONDecoder().decode([Exchange].self, from: mock) {
            list = parse.compactMap({ item in
                var object = item
                
                var exchangeDatas: [ExchangeData] = []
                exchangeDatas.append(ExchangeData(title: "Orderbook", start: item.orderbookStart, end: item.orderbookEnd))
                exchangeDatas.append(ExchangeData(title: "Quote", start: item.quoteStart, end: item.quoteEnd))
                exchangeDatas.append(ExchangeData(title: "Trade", start: item.tradeStart, end: item.tradeEnd))
                exchangeDatas.append(ExchangeData(title: "Data", start: item.startData, end: item.endData))
                
                object.data = exchangeDatas
                
                return object
            })
        }
        return list
    }
}
