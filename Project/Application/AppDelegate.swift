//
//  AppDelegate.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    //-----------------------------------------------------------------------
    //  MARK: - App Delegate -
    //-----------------------------------------------------------------------
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //-----------------------------------
        //  Loading Mocks
        //-----------------------------------
        
        Preferences.isRunningTestsFail = false
        
        //-----------------------------------
        //  BaseRouter
        //-----------------------------------
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Router().getRootView()
        window?.makeKeyAndVisible()
        
        return true
    }
}

