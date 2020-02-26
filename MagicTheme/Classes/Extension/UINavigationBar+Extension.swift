//
//  UINavigationBar+Extension.swift
//  appearance
//
//  Created by yidahis on 2020/2/21.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import UIKit

extension UINavigationBar: DynamicThemeProtocol {
    override public func isDynamic() -> Bool {
        barTintColor?.dyColorName != nil
    }
    override public func dyUpdateUI() -> () -> Void {
        return {
            if let colorName = self.barTintColor?.dyColorName {
                self.barTintColor = UIColor.hex(colorName)
            }
        }
    }
}
