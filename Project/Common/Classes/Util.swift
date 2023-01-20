//
//  Util.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit
import Lottie
import NotificationBannerSwift

final class Util {
    
    //------------------------------------------------------------
    //  MARK: - Messages -
    //------------------------------------------------------------
    
    static func showMessage(message: String? = nil,
                            type: BannerStyle) {
        let banner = NotificationBanner(title: nil,
                                        subtitle: message,
                                        style: type)
        banner.show()
    }
    
    //------------------------------------------------------------
    //  MARK: - HUD -
    //------------------------------------------------------------
    
    static private var hudMask = UIView(frame: UIScreen.main.bounds)
    
    static func showHUD() {
        
        if hudMask.subviews.count > 0 { return }
        
        hudMask.alpha = 0
        hudMask.frame = UIScreen.main.bounds
        hudMask.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        let hudSquare: CGFloat = 180
        var hudCenter = hudMask.center
        hudCenter.x -= hudSquare/2
        hudCenter.y -= hudSquare/1.5
        
        let boxView = UIView(frame: CGRect(origin: hudCenter,
                                           size: CGSize(width: hudSquare,
                                                        height: hudSquare)))
        boxView.backgroundColor = .clear
        boxView.alpha = 0
        hudMask.addSubview(boxView)
        
        let animation = LottieAnimationView(name: "loading")
        animation.frame = CGRect(origin: .zero, size: boxView.frame.size)
        animation.loopMode = .loop
        animation.play()
        boxView.addSubview(animation)
        
        let window: UIWindow? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        window?.addSubview(hudMask)
        
        UIView.animate(withDuration: 0.3) { hudMask.alpha = 1 }
        UIView.animate(withDuration: 0.6) { boxView.alpha = 1 }
    }
    
    static func hideHUD() {
        UIView.animate(withDuration: 0.5,
                       animations: { hudMask.alpha = 0 },
                       completion: { (finished) in
                        if finished {
                            hudMask.removeFromSuperview()
                            hudMask = UIView(frame: UIScreen.main.bounds)
                        }
                       })
    }
}
