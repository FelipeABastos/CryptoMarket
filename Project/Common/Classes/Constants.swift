//
//  Constants.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit

final class Constants {
    
    struct API {

        static let BaseURL = "https://rest.coinapi.io/v1/"
        static let APIKey = "52C5F432-896E-499A-9746-65F795DEF7F1"
        
        struct Endpoint {
            static let Exchanges = "exchanges"
            static let ExchangesIcons = "exchanges/icons/96"
        }
    }
    
    struct Strings {
        static let Currency = "USD "
        static let Volumes = "Volumes"
        static let Hour = "Hour"
        static let Day = "Day"
        static let Month = "Month"
        static let Website = "Website:"
        static let Symbols = "Symbols:"
        static let ExchangeId = "Exchange Id:"
    }
    
    struct AccessibilityIdentifier {
        
        struct Detail {
            static let ScrollView = "Detail_ScrollView"
            static let ContentView = "Detail_ContentView"
            static let ChartTitleLabel = "Detail_ChartTitleLabel"
            static let HourTitleLabel = "Detail_HourTitleLabel"
            static let DayTitleLabel = "Detail_DayTitleLabel"
            static let MonthTitleLabel = "Detail_MonthTitleLabel"
            static let ValueHourLabel = "Detail_ValueHourLabel"
            static let ValueDayLabel = "Detail_ValueDayLabel"
            static let ValueMonthLabel = "Detail_ValueMonthLabel"
            static let HourBarChartView = "Detail_HourBarChartView"
            static let DayBarChartView = "Detail_DayBarChartView"
            static let MonthBarChartView = "Detail_MonthBarChartView"
            static let ChartView = "Detail_ChartView"
            static let DetailView = "Detail_DetailView"
            static let WebsiteTitleLabel = "Detail_WebsiteTitleLabel"
            static let WebsiteLabel = "Detail_WebsiteLabel"
            static let SymbolsTitleLabel = "Detail_SymbolsTitleLabel"
            static let SymbolsLabel = "Detail_SymbolsLabel"
            static let ExchangeIdTitleLabel = "Detail_ExchangeIdTitleLabel"
            static let ExchangeIdLabel = "Detail_ExchangeIdLabel"
            static let CollectionView = "Detail_CollectionView"
        }
        
        struct DetailCell {
            static let CollectionCellTitle = "DetailCell_CollectionCellTitle"
            static let CollectionCellStartTitleLabel = "DetailCell_CollectionCellStartTitleLabel"
            static let CollectionCellStartLabel = "DetailCell_CollectionCellStartLabel"
            static let CollectionCellEndTitleLabel = "DetailCell_CollectionCellEndTitleLabel"
            static let CollectionCellEndLabel = "DetailCell_CollectionCellEndLabel"
            static let CollectionCellBackgroundView = "DetailCell_CollectionCellBackgroundView"
        }
        
        struct Home {
            static let RefreshControl = "Home_RefreshControl"
            static let TableView = "Home_TableView"
        }
        
        struct ExchangeCell {
            static let TitleLabel = "ExchangeCell_TitleLabel"
            static let IconImage = "ExchangeCell_IconImage"
            static let ExchangeTitleList = "ExchangeCell_ExchangeTitleList"
            static let BackgroundView = "ExchangeCell_BackgroundView"
        }
        
        
    }
    
    struct Messages {
        static let CannotLoadAPI = "Ops! We cannot load data from API."
    }
    
    struct Title {
        static let HomeTitle = "Exchanges"
    }
}
