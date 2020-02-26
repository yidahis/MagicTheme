//
//  UIWindow+Extension.swift
//  FBSnapshotTestCase
//
//  Created by yidahis on 2020/2/26.
//

import Foundation

extension UIWindow {
    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 12.0, *) {
            guard let trai = previousTraitCollection else {
                return
            }
            if trai.userInterfaceStyle == .dark {
                MagicTheme.shared.theme = .dark
            }else {
                MagicTheme.shared.theme = .light
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
