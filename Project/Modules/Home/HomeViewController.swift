//
//  HomeViewController.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit
import SwiftUI

final class HomeViewController: UIViewController,
                                HomePresenterDelegate,
                                HomeViewDelegate {
    
    var presenter: HomePresenter!
    private lazy var rootView: HomeView = {
        let view = HomeView()
        view.setup()
        view.delegate = self
        return view
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController -
    //-----------------------------------------------------------------------
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.Title.HomeTitle
        navigationController?.navigationBar.fix(largeTitle: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.getExchanges()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - HomeView Delegate -
    //-----------------------------------------------------------------------
    
    func goToDetail(exchange: Exchange) {
        presenter.showDetail(exchange: exchange)
    }
    
    func refreshData() {
        presenter.getExchanges(refresh: true)
    }
    
    func loading(_ loading: Bool) {
        if loading {
            Util.showHUD()
        }else{
            Util.hideHUD()
        }
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Presenter Delegate -
    //-----------------------------------------------------------------------
    
    func loadedData() {
        rootView.update(data: presenter.exchanges)
    }
}

//-----------------------------------------------------------------------
//  MARK: - SwiftUI Preview
//-----------------------------------------------------------------------

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIKitControllerPreview(controller: UINavigationController(rootViewController: HomeRouter().viewController))
    }
}
