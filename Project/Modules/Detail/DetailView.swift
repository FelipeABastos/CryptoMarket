//
//  DetailView.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit

final class DetailView: UIView,
                        ViewCode,
                        UICollectionViewDelegate,
                        UICollectionViewDataSource,
                        UICollectionViewDelegateFlowLayout {
    
    var exchange: Exchange!
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.ScrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.ContentView
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lblChartTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.ChartTitleLabel
        label.textColor = UIColor.systemGreen
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblHour: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.HourTitleLabel
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblDay: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.DayTitleLabel
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblMonth: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.MonthTitleLabel
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblValueHour: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.ValueHourLabel
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblValueDay: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.ValueDayLabel
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblValueMonth: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.ValueMonthLabel
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vwHourChart: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.HourBarChartView
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vwDayChart: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.DayBarChartView
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vwMonthChart: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.MonthBarChartView
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vwChart: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.ChartView
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vwDetails: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.DetailView
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lblWebsiteTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.WebsiteTitleLabel
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblWebsite: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.WebsiteLabel
        label.textColor = UIColor.cyan
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblSymbolsTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.SymbolsTitleLabel
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblSymbols: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.SymbolsLabel
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblExchangeIdTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.ExchangeIdTitleLabel
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblExchangeId: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.ExchangeIdLabel
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cvList: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.CollectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom Methods
    //-----------------------------------------------------------------------
    
    func update(exchange: Exchange) {
        
        self.exchange = exchange
        
        lblWebsiteTitle.text = Constants.Strings.Website
        lblWebsite.text = exchange.website
        lblSymbolsTitle.text = Constants.Strings.Symbols
        lblSymbols.text = exchange.symbolsCount?.format()
        lblExchangeIdTitle.text = Constants.Strings.ExchangeId
        lblExchangeId.text = exchange.exchangeId
        
        lblChartTitle.text = Constants.Strings.Volumes
        lblHour.text = Constants.Strings.Hour
        lblDay.text = Constants.Strings.Day
        lblMonth.text = Constants.Strings.Month
        
        if let volumeHour = exchange.volumeHour {
            lblValueHour.text = Constants.Strings.Currency + volumeHour.format()
        }
        if let volumeDay = exchange.volumeDay {
            lblValueDay.text = Constants.Strings.Currency + volumeDay.format()
        }
        if let volumeMonth = exchange.volumeMonth {
            lblValueMonth.text = Constants.Strings.Currency + volumeMonth.format()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.handleChart()
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapWebsite))
        lblWebsite.isUserInteractionEnabled = true
        lblWebsite.addGestureRecognizer(tap)
        
        cvList.reloadData()
    }
    
    @objc private func tapWebsite() {
        if let website = exchange.website,
            let url = URL(string: website) {
            UIApplication.shared.open(url)
        }
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Chart
    //-----------------------------------------------------------------------
    
    private func handleChart() {
        
        var trailingHour: CGFloat = 0
        var trailingDay: CGFloat = 0
        
        if let volumeMonth = exchange.volumeMonth {
            
            if let volumeHour = exchange.volumeHour {
                trailingHour = self.calculateProgress(lhs: volumeHour,
                                                      rhs: volumeMonth,
                                                      label: lblValueHour)
            }
            if let volumeDay = exchange.volumeDay {
                trailingDay = self.calculateProgress(lhs: volumeDay,
                                                     rhs: volumeMonth,
                                                     label: lblValueDay)
            }
        }
        
        vwHourChart.trailingAnchor.constraint(equalTo: vwChart.trailingAnchor, constant: -trailingHour).isActive = true
        vwDayChart.trailingAnchor.constraint(equalTo: vwChart.trailingAnchor, constant: -trailingDay).isActive = true
        
        if exchange.volumeMonth == 0 {
            
            let monthWidth = self.vwChart.frame.width - (lblMonth.frame.width + 40)
            let difference = monthWidth - lblValueMonth.frame.width
            
            vwMonthChart.trailingAnchor.constraint(equalTo: vwChart.trailingAnchor, constant: -difference).isActive = true
        }else{
            vwMonthChart.trailingAnchor.constraint(equalTo: vwChart.trailingAnchor, constant: -16).isActive = true
        }
        
        vwHourChart.layer.insertSublayer(gradientLayer(), at: 0)
        vwDayChart.layer.insertSublayer(gradientLayer(), at: 0)
        vwMonthChart.layer.insertSublayer(gradientLayer(), at: 0)
        
        UIView.animate(withDuration: 0.8,
                       delay: 0.3,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseOut) {
            self.layoutIfNeeded()
        } completion: { finished in
            if finished {
                UIView.animate(withDuration: 0.3) {
                    self.lblValueHour.alpha = 1
                    self.lblValueDay.alpha = 1
                    self.lblValueMonth.alpha = 1
                }
            }
        }

    }
    
    private func gradientLayer() -> CAGradientLayer {
        
        let monthWidth = self.vwChart.frame.width - (lblMonth.frame.width + 40)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: CGSize(width: monthWidth, height: 24))
        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.systemPink.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = 4
        
        return gradientLayer
    }
    
    private func calculateProgress(lhs: Double, rhs: Double, label: UILabel) -> CGFloat {
        
        let monthWidth = self.vwChart.frame.width - (lblMonth.frame.width + 40)
        let percentage = calculatePercentage(value: lhs, totalValue: rhs)
        var newWidth = (monthWidth / 100) * percentage
        
        if newWidth < label.frame.width {
            newWidth = label.frame.width
        }
        
        var difference = monthWidth - newWidth
        
        if difference.isNaN {
            difference = monthWidth - label.frame.width
        }
        
        return difference
    }
    
    private func calculatePercentage(value: Double, totalValue: Double) -> Double {
        return (value * 100) / totalValue
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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vwChart)
        
        vwChart.addSubview(lblChartTitle)
        vwChart.addSubview(lblHour)
        vwChart.addSubview(lblDay)
        vwChart.addSubview(lblMonth)
        vwChart.addSubview(vwHourChart)
        vwChart.addSubview(vwDayChart)
        vwChart.addSubview(vwMonthChart)
        
        vwHourChart.addSubview(lblValueHour)
        vwDayChart.addSubview(lblValueDay)
        vwMonthChart.addSubview(lblValueMonth)
        
        contentView.addSubview(vwDetails)
        vwDetails.addSubview(lblExchangeIdTitle)
        vwDetails.addSubview(lblExchangeId)
        vwDetails.addSubview(lblWebsiteTitle)
        vwDetails.addSubview(lblWebsite)
        vwDetails.addSubview(lblSymbolsTitle)
        vwDetails.addSubview(lblSymbols)
        contentView.addSubview(cvList)
    }
    
    internal func addConstraints() {
        
        // Scroll
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        ])
        
        // Chart
        
        NSLayoutConstraint.activate([
            vwChart.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            vwChart.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            vwChart.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            lblChartTitle.topAnchor.constraint(equalTo: vwChart.topAnchor, constant: 16),
            lblChartTitle.leadingAnchor.constraint(equalTo: vwChart.leadingAnchor, constant: 16),
            lblChartTitle.trailingAnchor.constraint(equalTo: vwChart.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            lblHour.topAnchor.constraint(equalTo: lblChartTitle.bottomAnchor, constant: 32),
            lblHour.leadingAnchor.constraint(equalTo: vwChart.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            lblDay.topAnchor.constraint(equalTo: lblHour.bottomAnchor, constant: 20),
            lblDay.leadingAnchor.constraint(equalTo: vwChart.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            lblMonth.topAnchor.constraint(equalTo: lblDay.bottomAnchor, constant: 20),
            lblMonth.leadingAnchor.constraint(equalTo: vwChart.leadingAnchor, constant: 16),
            lblMonth.bottomAnchor.constraint(equalTo: vwChart.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            vwHourChart.leadingAnchor.constraint(equalTo: lblMonth.trailingAnchor, constant: 8),
            vwHourChart.centerYAnchor.constraint(equalTo: lblHour.centerYAnchor),
            vwHourChart.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            vwDayChart.leadingAnchor.constraint(equalTo: lblMonth.trailingAnchor, constant: 8),
            vwDayChart.centerYAnchor.constraint(equalTo: lblDay.centerYAnchor),
            vwDayChart.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            vwMonthChart.leadingAnchor.constraint(equalTo: lblMonth.trailingAnchor, constant: 8),
            vwMonthChart.centerYAnchor.constraint(equalTo: lblMonth.centerYAnchor),
            vwMonthChart.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            lblValueHour.leadingAnchor.constraint(equalTo: vwHourChart.leadingAnchor, constant: 8),
            lblValueHour.centerYAnchor.constraint(equalTo: vwHourChart.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lblValueDay.leadingAnchor.constraint(equalTo: vwDayChart.leadingAnchor, constant: 8),
            lblValueDay.centerYAnchor.constraint(equalTo: vwDayChart.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lblValueMonth.leadingAnchor.constraint(equalTo: vwMonthChart.leadingAnchor, constant: 8),
            lblValueMonth.centerYAnchor.constraint(equalTo: vwMonthChart.centerYAnchor)
        ])
        
        // Detail
        
        NSLayoutConstraint.activate([
            vwDetails.topAnchor.constraint(equalTo: vwChart.bottomAnchor, constant: 24),
            vwDetails.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            vwDetails.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            lblExchangeIdTitle.topAnchor.constraint(equalTo: vwDetails.topAnchor, constant: 16),
            lblExchangeIdTitle.leadingAnchor.constraint(equalTo: vwDetails.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            lblExchangeId.leadingAnchor.constraint(equalTo: lblExchangeIdTitle.trailingAnchor, constant: 16),
            lblExchangeId.trailingAnchor.constraint(equalTo: vwDetails.trailingAnchor, constant: -16),
            lblExchangeId.centerYAnchor.constraint(equalTo: lblExchangeIdTitle.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lblSymbolsTitle.topAnchor.constraint(equalTo: lblExchangeIdTitle.bottomAnchor, constant: 16),
            lblSymbolsTitle.leadingAnchor.constraint(equalTo: vwDetails.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            lblSymbols.leadingAnchor.constraint(equalTo: lblSymbolsTitle.trailingAnchor, constant: 16),
            lblSymbols.trailingAnchor.constraint(equalTo: vwDetails.trailingAnchor, constant: -16),
            lblSymbols.centerYAnchor.constraint(equalTo: lblSymbolsTitle.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lblWebsiteTitle.topAnchor.constraint(equalTo: lblSymbolsTitle.bottomAnchor, constant: 16),
            lblWebsiteTitle.leadingAnchor.constraint(equalTo: vwDetails.leadingAnchor, constant: 16),
            lblWebsiteTitle.bottomAnchor.constraint(equalTo: vwDetails.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            lblWebsite.leadingAnchor.constraint(equalTo: lblWebsiteTitle.trailingAnchor, constant: 8),
            lblWebsite.trailingAnchor.constraint(equalTo: vwDetails.trailingAnchor, constant: -16),
            lblWebsite.centerYAnchor.constraint(equalTo: lblWebsiteTitle.centerYAnchor)
        ])
        
        // Collection View
        
        NSLayoutConstraint.activate([
            cvList.topAnchor.constraint(equalTo: vwDetails.bottomAnchor, constant: 24),
            cvList.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cvList.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cvList.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - UICollectionView Delegate / Datasource
    //-----------------------------------------------------------------------

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return exchange.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = exchange.data[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
        cell.loadUI(item: data)
        
        return cell
    }
    
    //-----------------------------
    //  Flow layout
    //-----------------------------
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width / 2) - 5, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
