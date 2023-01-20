//
//  DetailUITests.swift
//  CryptoMarketUITests
//
//  Created by Felipe Amorim Bastos on 14/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import XCTest

final class DetailUITests: XCTestCase {
    private let app = XCUIApplication()
    
    func launchApp() {
        app.launchArguments = ["-isTesting"]
        app.launch()
    }
    
    func showDetail() {
        launchApp()
        app.tables.staticTexts["Binance"].tap()
    }
    
    func testChartCard() {
        showDetail()
        let contentView = app.otherElements["Detail_ContentView"]
        XCTAssertTrue(contentView.staticTexts["Detail_ChartTitleLabel"].exists)
        XCTAssertTrue(contentView.otherElements["Detail_ChartView"].exists)
        XCTAssertTrue(contentView.staticTexts["Detail_HourTitleLabel"].exists)
        XCTAssertTrue(contentView.staticTexts["Detail_DayTitleLabel"].exists)
        XCTAssertTrue(contentView.staticTexts["Detail_MonthTitleLabel"].exists)
        XCTAssertTrue(contentView.otherElements["Detail_HourBarChartView"].exists)
        XCTAssertTrue(contentView.otherElements["Detail_DayBarChartView"].exists)
        XCTAssertTrue(contentView.otherElements["Detail_MonthBarChartView"].exists)
        sleep(1)
        XCTAssertTrue(contentView.staticTexts["Detail_ValueHourLabel"].exists)
        XCTAssertTrue(contentView.staticTexts["Detail_ValueDayLabel"].exists)
        XCTAssertTrue(contentView.staticTexts["Detail_ValueMonthLabel"].exists)
    }
    
    func testEmptyValueItem() {
        launchApp()
        app.tables.staticTexts["European Central Bank"].tap()
        sleep(1)
        XCTAssertEqual(app.otherElements["Detail_ContentView"].staticTexts["Detail_ValueMonthLabel"].value as! String, "")
    }
    
    func testDetailCard() {
        showDetail()
        let contentView = app.otherElements["Detail_ContentView"]
        XCTAssertTrue(contentView.otherElements["Detail_DetailView"].exists)
        XCTAssertTrue(contentView.staticTexts["Detail_ExchangeIdTitleLabel"].exists)
        XCTAssertTrue(contentView.staticTexts["Detail_SymbolsTitleLabel"].exists)
        XCTAssertTrue(contentView.staticTexts["Detail_WebsiteTitleLabel"].exists)
        XCTAssertTrue(contentView.staticTexts["Detail_ExchangeIdLabel"].exists)
        XCTAssertTrue(contentView.staticTexts["Detail_SymbolsLabel"].exists)
        XCTAssertTrue(contentView.buttons["Detail_WebsiteLabel"].exists)
    }
    
    func testCollectionOrderbook() {
        showDetail()
        let orderbook = app.otherElements["Detail_ContentView"].collectionViews["Detail_CollectionView"].otherElements.containing(.staticText, identifier:"Orderbook")
        XCTAssertTrue(orderbook.staticTexts["DetailCell_CollectionCellStartTitleLabel"].exists)
        XCTAssertTrue(orderbook.staticTexts["DetailCell_CollectionCellEndLabel"].exists)
        XCTAssertTrue(orderbook.staticTexts["DetailCell_CollectionCellStartLabel"].exists)
        XCTAssertTrue(orderbook.staticTexts["DetailCell_CollectionCellEndLabel"].exists)
        XCTAssertTrue(app.otherElements["Detail_ContentView"].collectionViews["Detail_CollectionView"].staticTexts["Orderbook"].exists)
    }
    
    func testCollectionQuote() {
        showDetail()
        let quote = app.otherElements["Detail_ContentView"].collectionViews["Detail_CollectionView"].otherElements.containing(.staticText, identifier:"Quote")
        XCTAssertTrue(quote.staticTexts["DetailCell_CollectionCellStartTitleLabel"].exists)
        XCTAssertTrue(quote.staticTexts["DetailCell_CollectionCellEndLabel"].exists)
        XCTAssertTrue(quote.staticTexts["DetailCell_CollectionCellStartLabel"].exists)
        XCTAssertTrue(quote.staticTexts["DetailCell_CollectionCellEndLabel"].exists)
        XCTAssertTrue(app.otherElements["Detail_ContentView"].collectionViews["Detail_CollectionView"].staticTexts["Quote"].exists)
    }
    
    func testCollectionTrade() {
        showDetail()
        let trade = app.otherElements["Detail_ContentView"].collectionViews["Detail_CollectionView"].otherElements.containing(.staticText, identifier:"Trade")
        XCTAssertTrue(trade.staticTexts["DetailCell_CollectionCellStartTitleLabel"].exists)
        XCTAssertTrue(trade.staticTexts["DetailCell_CollectionCellEndLabel"].exists)
        XCTAssertTrue(trade.staticTexts["DetailCell_CollectionCellStartLabel"].exists)
        XCTAssertTrue(trade.staticTexts["DetailCell_CollectionCellEndLabel"].exists)
        XCTAssertTrue(app.otherElements["Detail_ContentView"].collectionViews["Detail_CollectionView"].staticTexts["Trade"].exists)
    }
    
    func testCollectionData() {
        showDetail()
        let data = app.otherElements["Detail_ContentView"].collectionViews["Detail_CollectionView"].otherElements.containing(.staticText, identifier:"Data")
        XCTAssertTrue(data.staticTexts["DetailCell_CollectionCellStartTitleLabel"].exists)
        XCTAssertTrue(data.staticTexts["DetailCell_CollectionCellEndLabel"].exists)
        XCTAssertTrue(data.staticTexts["DetailCell_CollectionCellStartLabel"].exists)
        XCTAssertTrue(data.staticTexts["DetailCell_CollectionCellEndLabel"].exists)
        XCTAssertTrue(app.otherElements["Detail_ContentView"].collectionViews["Detail_CollectionView"].staticTexts["Data"].exists)
    }
    
    func testWebsiteClicked() {
        showDetail()
        XCTAssertTrue(app.otherElements["Detail_ContentView"].buttons["Detail_WebsiteLabel"].isHittable)
        app.otherElements["Detail_ContentView"].buttons["Detail_WebsiteLabel"].tap()
    }
}
