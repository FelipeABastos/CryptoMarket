//
//  Preferences.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit

final class Preferences: NSObject {
    
    //------------------------------------------------------------
    //  UI and Unit Tests flags
    //------------------------------------------------------------
    
    //  Is running tests
    
    private static var preferenceIsRunningTests = false
    
    public static var isRunningTests: Bool {
        get {
            return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil ||
            ProcessInfo.processInfo.arguments.contains("-isTesting")
        }
    }
    
    //  Is running fail tests
    
    public static var isRunningTestsFail: Bool {
        get { return UserDefaults.standard.bool(forKey: "RunningTests_Fail") }
        set (newValue) { UserDefaults.standard.set(newValue, forKey: "RunningTests_Fail") }
    }
}
