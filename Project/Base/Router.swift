//
//  BaseRouter.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit

class Router {
    
    var viewController: UIViewController!
    
    //-----------------------------------------------------------------------
    //  MARK: - Mount root view -
    //-----------------------------------------------------------------------
    
    func getRootView() -> UINavigationController {
        return UINavigationController(rootViewController: HomeRouter().viewController)
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Present views -
    //-----------------------------------------------------------------------
    
    func show() {
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
}

//-----------------------------------------------------------------------
//  MARK: - Show modules (calling routers) -
//-----------------------------------------------------------------------

extension Router {
    static func showDetail(exchange: Exchange) {
        DetailRouter(exchange: exchange).show()
    }
}
