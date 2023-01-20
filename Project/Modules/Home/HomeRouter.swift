//
//  HomeRouter.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit

final class HomeRouter: Router {
    
    override init() {
        super.init()
        
        let controller = HomeViewController()
        let presenter = HomePresenter(delegate: controller)
        
        controller.presenter = presenter
        
        super.viewController = controller
    }
}
