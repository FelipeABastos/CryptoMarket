//
//  HomeTests.swift
//  CryptoMarketTests
//
//  Created by Felipe Amorim Bastos on 14/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import XCTest
@testable import CryptoMarket

final class HomeTests: XCTestCase {
    
    private let presenter = HomePresenter(delegate: nil)
    
    func testGetExchangesSuccess() {
        Preferences.isRunningTestsFail = false
        presenter.getExchanges()
        XCTAssertGreaterThan(presenter.exchanges.count, 0)
    }
    
    func testRefreshSuccess() {
        Preferences.isRunningTestsFail = false
        presenter.getExchanges() // to fill exchange array
        presenter.getExchanges(refresh: true)
        XCTAssertGreaterThan(presenter.exchanges.count, 0)
    }
    
    func testGetExchangesFail() {
        Preferences.isRunningTestsFail = true
        presenter.getExchanges()
        XCTAssertEqual(presenter.exchanges.count, 0)
    }
}
