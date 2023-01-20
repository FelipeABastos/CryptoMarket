//
//  DetailPresenter.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit

//-----------------------------------------------------------------------
//  MARK: - Presenter Delegate
//-----------------------------------------------------------------------

protocol DetailPresenterDelegate {}

//-----------------------------------------------------------------------
//  MARK: - Presenter
//-----------------------------------------------------------------------

final class DetailPresenter {

    var delegate: DetailPresenterDelegate?
    var exchange: Exchange!
    
    init (delegate: DetailPresenterDelegate?) {
        self.delegate = delegate
    }
}
