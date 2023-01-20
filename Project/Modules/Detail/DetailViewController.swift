//
//  DetailViewController.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit
import SwiftUI

final class DetailViewController: UIViewController,
                                  DetailPresenterDelegate {
    
    var presenter: DetailPresenter!
    
    private lazy var rootView: DetailView = {
        let view = DetailView()
        view.setup()
        return view
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController -
    //-----------------------------------------------------------------------
    
    override func loadView() {
        view = rootView
        rootView.update(exchange: presenter.exchange)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = presenter.exchange?.name
    }
}

//-----------------------------------------------------------------------
//  MARK: - SwiftUI Preview
//-----------------------------------------------------------------------

struct DetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIKitControllerPreview(controller: UINavigationController(rootViewController: DetailRouter(exchange: PreviewData.exchange).viewController))
    }
}
