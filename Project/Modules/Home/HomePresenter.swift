//
//  HomePresenter.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import Foundation

//-----------------------------------------------------------------------
//  MARK: - Presenter Delegate
//-----------------------------------------------------------------------

protocol HomePresenterDelegate {
    func loadedData()
    func loading(_ loading: Bool)
}

//-----------------------------------------------------------------------
//  MARK: - Presenter
//-----------------------------------------------------------------------

final class HomePresenter {
    
    var delegate: HomePresenterDelegate?
    
    private(set) var exchanges: [Exchange] = []
    private(set) var icons: [ExchangeIcon] = []
    
    init (delegate: HomePresenterDelegate?) {
        self.delegate = delegate
    }
    
    func getExchanges(refresh: Bool = false) {
        
        if exchanges.isEmpty || refresh {
            self.delegate?.loading(true)
            Exchange.loadAll { result  in
                if let items = result {
                    Exchange.loadIcons { result in
                        self.delegate?.loading(false)
                        if let iconsList = result {
                            self.icons = iconsList
                        }
                        self.handleItems(items: items)
                        self.delegate?.loadedData()
                    }
                }else{
                    self.delegate?.loading(false)
                    Util.showMessage(message: Constants.Messages.CannotLoadAPI, type: .warning)
                }
            }
        }
    }
    
    private func handleData(item: Exchange) -> [ExchangeData] {
        var exchangeDatas: [ExchangeData] = []
        exchangeDatas.append(ExchangeData(title: "Orderbook", start: item.orderbookStart, end: item.orderbookEnd))
        exchangeDatas.append(ExchangeData(title: "Quote", start: item.quoteStart, end: item.quoteEnd))
        exchangeDatas.append(ExchangeData(title: "Trade", start: item.tradeStart, end: item.tradeEnd))
        exchangeDatas.append(ExchangeData(title: "Data", start: item.startData, end: item.endData))
        return exchangeDatas
    }
    
    private func handleItems(items: [Exchange]) {
        self.exchanges = items.compactMap { item in
            var object = item
            if !icons.isEmpty {
                object.iconUrl = URL(string: icons.filter({ icon in
                    icon.exchangeId == item.exchangeId
                }).first?.url ?? "")
            }
            object.data = self.handleData(item: item)
            return object
        }
    }
    
    func showDetail(exchange: Exchange) {
        Router.showDetail(exchange: exchange)
    }
}
