//
//  DetailRouter.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit

final class DetailRouter: Router {
    
    init(exchange: Exchange) {
        super.init()
        
        let controller = DetailViewController()
        let presenter = DetailPresenter(delegate: controller)
        
        controller.presenter = presenter
        controller.presenter.exchange = exchange
        
        super.viewController = controller
    }
}
