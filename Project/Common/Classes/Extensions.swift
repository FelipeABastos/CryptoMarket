//
//  Extensions.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit

//-----------------------------------------------------------------------
//  MARK: - UIApplication -
//-----------------------------------------------------------------------

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        return controller
    }
}

//-----------------------------------------------------------------------
//  MARK: - Double -
//-----------------------------------------------------------------------

extension Double {
    
    func format() -> String {
        let value = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        formatter.decimalSeparator = "."
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.string(from: value)!
    }
}

//-----------------------------------------------------------------------
//  MARK: - UINavigationBar -
//-----------------------------------------------------------------------

extension UINavigationBar {
    
    func fix(largeTitle: Bool = false) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor.black
        
        self.tintColor = UIColor.yellow
        self.standardAppearance = navBarAppearance
        self.scrollEdgeAppearance = navBarAppearance
        self.compactAppearance = navBarAppearance
        self.prefersLargeTitles = largeTitle
    }
}

//-----------------------------------------------------------------------
//  MARK: - String -
//-----------------------------------------------------------------------

extension String {
    
    func toDateString(format: String? = "yyyy-MM-dd", newFormat: String? = "dd/MM/yyyy") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let newDate = dateFormatter.date(from: self)
        dateFormatter.dateFormat = newFormat!
        dateFormatter.locale = Locale(identifier: "pt_BR")
        if newDate != nil {
            return dateFormatter.string(from: newDate!)
        }
        return ""
    }
}
