//
//  DetailCell.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit

final class DetailCell: UICollectionViewCell, ViewCode {
    
    static let identifier = "DetailCell"
    
    private lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.DetailCell.CollectionCellTitle
        label.textColor = UIColor.systemGreen
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblStartTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.DetailCell.CollectionCellStartTitleLabel
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblStart: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.DetailCell.CollectionCellStartLabel
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblEndTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.DetailCell.CollectionCellEndTitleLabel
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblEnd: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.DetailCell.CollectionCellEndLabel
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vwBackground: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.DetailCell.CollectionCellBackgroundView
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom Methods
    //-----------------------------------------------------------------------
    
    func loadUI(item: ExchangeData) {
        setup()
        
        lblTitle.text = item.title
        lblStartTitle.text = "Start: "
        lblStart.text = item.start?.toDateString(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ", newFormat: "yyyy-MM-dd")
        lblEndTitle.text = "End: "
        lblEnd.text = item.end?.toDateString(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ", newFormat: "yyyy-MM-dd")
        
        if item.title == "Data" {
            if let startData = item.start, let endData = item.end {
                lblStart.text = startData
                lblEnd.text = endData
            }
        }
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - ViewCode Protocol
    //-----------------------------------------------------------------------
    
    internal func setup() {
        buildHierarchy()
        addConstraints()
    }
    
    internal func buildHierarchy() {
        addSubview(vwBackground)
        vwBackground.addSubview(lblTitle)
        vwBackground.addSubview(lblStartTitle)
        vwBackground.addSubview(lblStart)
        vwBackground.addSubview(lblEndTitle)
        vwBackground.addSubview(lblEnd)
    }
    
    internal func addConstraints() {
        
        NSLayoutConstraint.activate([
            vwBackground.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            vwBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            vwBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            vwBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: vwBackground.topAnchor, constant: 16),
            lblTitle.trailingAnchor.constraint(equalTo: vwBackground.trailingAnchor, constant: -8),
            lblTitle.leadingAnchor.constraint(equalTo: vwBackground.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            lblStartTitle.leadingAnchor.constraint(equalTo: vwBackground.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            lblStart.leadingAnchor.constraint(equalTo: lblStartTitle.trailingAnchor, constant: 8),
            lblStart.trailingAnchor.constraint(equalTo: vwBackground.trailingAnchor, constant: -16),
            lblStart.centerYAnchor.constraint(equalTo: lblStartTitle.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lblEndTitle.topAnchor.constraint(equalTo: lblStartTitle.bottomAnchor, constant: 16),
            lblEndTitle.leadingAnchor.constraint(equalTo: vwBackground.leadingAnchor, constant: 16),
            lblEndTitle.bottomAnchor.constraint(equalTo: vwBackground.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            lblEnd.centerYAnchor.constraint(equalTo: lblEndTitle.centerYAnchor),
            lblEnd.leadingAnchor.constraint(equalTo: lblEndTitle.leadingAnchor, constant: 8),
            lblEnd.trailingAnchor.constraint(equalTo: vwBackground.trailingAnchor, constant: -16),
            lblEnd.bottomAnchor.constraint(equalTo: vwBackground.bottomAnchor, constant: -16)
        ])
    }
}
