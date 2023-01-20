//
//  Exchange.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 12/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import Foundation

struct Exchange: Codable {
    
    var exchangeId: String?
    var website: String?
    var name: String?
    var startData: String?
    var endData: String?
    var quoteStart: String?
    var quoteEnd: String?
    var orderbookStart: String?
    var orderbookEnd: String?
    var tradeStart: String?
    var tradeEnd: String?
    var symbolsCount: Double?
    var volumeHour: Double?
    var volumeDay: Double?
    var volumeMonth: Double?
    var iconUrl: URL? = nil
    var data: [ExchangeData] = []
    
    enum CodingKeys: String, CodingKey {
        case exchangeId = "exchange_id"
        case website
        case name
        case startData = "data_start"
        case endData = "data_end"
        case quoteStart = "data_quote_start"
        case quoteEnd = "data_quote_end"
        case orderbookStart = "data_orderbook_start"
        case orderbookEnd = "data_orderbook_end"
        case tradeStart = "data_trade_start"
        case tradeEnd = "data_trade_end"
        case symbolsCount = "data_symbols_count"
        case volumeHour = "volume_1hrs_usd"
        case volumeDay = "volume_1day_usd"
        case volumeMonth = "volume_1mth_usd"
    }
}

struct ExchangeIcon: Codable {
    
    var exchangeId: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case exchangeId = "exchange_id"
        case url
    }
}

struct ExchangeData {
    
    var title: String?
    var start: String?
    var end: String?
}
