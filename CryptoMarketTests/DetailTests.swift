//
//  DetailTests.swift
//  CryptoMarketTests
//
//  Created by Felipe Amorim Bastos on 14/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import XCTest
@testable import CryptoMarket

final class DetailTests: XCTestCase {
    
    func testDetailPresenterInitialization() {
        let presenter = DetailPresenter(delegate: nil)
        presenter.exchange = PreviewData.exchange
        XCTAssertNotNil(presenter.exchange.exchangeId)
    }
}
