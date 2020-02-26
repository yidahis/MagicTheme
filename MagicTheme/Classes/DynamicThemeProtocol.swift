//
//  DynamicTheme.swift
//  appearance
//
//  Created by yidahis on 2020/2/20.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import Foundation

@objc public protocol DynamicThemeProtocol: AnyObject {
    func dyUpdateUI() -> () -> Void
    func isDynamic() -> Bool
}

public protocol MagicThemeProrocolol: Any {
    func dyImage(for name: String) -> UIImage?
    func dyColor(for name: String) -> UIColor?
}


