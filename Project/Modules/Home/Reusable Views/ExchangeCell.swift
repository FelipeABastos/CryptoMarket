//
//  ExchangeCell.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 12/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftUI

final class ExchangeCell: UITableViewCell, ViewCode {
    
    static let identifier = "ExchangeCell"
 
    private lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.ExchangeCell.TitleLabel
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imgIcon: UIImageView = {
        let image = UIImageView()
        image.accessibilityIdentifier = Constants.AccessibilityIdentifier.ExchangeCell.IconImage
        image.layer.cornerRadius = 24
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var lblValue: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.ExchangeCell.ExchangeTitleList
        label.textColor = UIColor.systemGreen
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vwBackground: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.ExchangeCell.BackgroundView
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom Methods
    //-----------------------------------------------------------------------
    
    func loadUI(item: Exchange) {
        
        setup()
        
        backgroundColor = .clear
        selectionStyle = .none
        
        lblTitle.text = item.name
        if let volumeDay = item.volumeDay {
            lblValue.text = Constants.Strings.Currency + volumeDay.format()
        }
        imgIcon.kf.setImage(with: item.iconUrl, placeholder: UIImage(named: "Placeholder"))
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
        addSubview(lblValue)
        addSubview(imgIcon)
        addSubview(lblTitle)
    }
    
    internal func addConstraints() {
        
        NSLayoutConstraint.activate([
            vwBackground.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            vwBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            vwBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            vwBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            imgIcon.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            imgIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            imgIcon.heightAnchor.constraint(equalToConstant: 48),
            imgIcon.widthAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            lblTitle.leadingAnchor.constraint(equalTo: imgIcon.trailingAnchor, constant: 16),
            lblTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lblTitle.centerYAnchor.constraint(equalTo: imgIcon.centerYAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            lblValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            lblValue.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 5),
            lblValue.leadingAnchor.constraint(equalTo: imgIcon.trailingAnchor, constant: 16)
        ])
    }
}
