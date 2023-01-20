//
//  UIKitPreview.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import UIKit
import SwiftUI

struct UIKitControllerPreview<PreviewController: UIViewController>: UIViewControllerRepresentable {
    var controller: PreviewController
    func makeUIViewController(context: Context) -> PreviewController {
        return controller
    }
    func updateUIViewController(_ uiViewController: PreviewController, context: Context) {}
}
