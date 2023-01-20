//
//  HomeView.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 12/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit
import SwiftUI

protocol HomeViewDelegate {
    func goToDetail(exchange: Exchange)
    func refreshData()
}

final class HomeView: UIView,
                      ViewCode,
                      UITableViewDelegate,
                      UITableViewDataSource {
    
    var delegate: HomeViewDelegate!
    
    private var exchanges: [Exchange] = []
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.accessibilityIdentifier = Constants.AccessibilityIdentifier.Home.RefreshControl
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        refreshControl.translatesAutoresizingMaskIntoConstraints = false
        return refreshControl
    }()
    
    private lazy var tbList: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.accessibilityIdentifier = Constants.AccessibilityIdentifier.Home.TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(ExchangeCell.self, forCellReuseIdentifier: ExchangeCell.identifier)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom Methods
    //-----------------------------------------------------------------------
    
    func update(data: [Exchange]) {
        exchanges = data
        tbList.reloadData()
        
        refreshControl.endRefreshing()
    }
    
    @objc private func refresh() {
        self.delegate.refreshData()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - ViewCode Protocol
    //-----------------------------------------------------------------------
    
    func setup() {
        backgroundColor = .black
        buildHierarchy()
        addConstraints()
    }
    
    internal func buildHierarchy() {
        addSubview(tbList)
        tbList.addSubview(refreshControl)
    }
    
    internal func addConstraints() {
        NSLayoutConstraint.activate([
            tbList.topAnchor.constraint(equalTo: self.topAnchor),
            tbList.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tbList.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tbList.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - UITableView Delegate / Datasource
    //-----------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return exchanges.count
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let exchange = self.exchanges[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeCell.identifier,
                                                 for: indexPath) as! ExchangeCell
        cell.loadUI(item: exchange)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        let exchange = self.exchanges[indexPath.row]
        
        self.delegate.goToDetail(exchange: exchange)
    }
}
