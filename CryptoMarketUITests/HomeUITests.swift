//
//  HomeUITests.swift
//  CryptoMarketUITests
//
//  Created by Felipe Amorim Bastos on 14/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import XCTest
@testable import CryptoMarket

final class HomeUITests: XCTestCase {
    
    private let app = XCUIApplication()
    
    func launchApp() {
        app.launchArguments = ["-isTesting"]
        app.launch()
    }
    
    func testFilledList() {
        launchApp()
        XCTAssertTrue(app.tables.staticTexts["Binance"].exists)
    }
    
    func testCellClicked() {
        launchApp()
        XCTAssertTrue(app.tables.staticTexts["Binance"].isHittable)
    }
    
    func testPullToRefresh() {
        launchApp()
        let firstCell = app.staticTexts["Binance"]
        let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 60))
        start.press(forDuration: 0, thenDragTo: finish)
    }
    
    func testIsScrollable() {
        launchApp()
        app.tables.cells.containing(.staticText, identifier:"Gemini").children(matching: .other).element.swipeUp()
        app.tables.cells.containing(.staticText, identifier:"Gemini").children(matching: .other).element.swipeUp()
        XCTAssertTrue(app.tables.cells.containing(.staticText, identifier:"OKCoin CNY").element.exists)
    }
}
