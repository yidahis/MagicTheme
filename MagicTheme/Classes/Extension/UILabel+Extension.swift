//
//  UILabel+Extension.swift
//  appearance
//
//  Created by yidahis on 2020/2/18.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import UIKit

extension UILabel {
    private static var keys_dy_textColor = "keys_textColor"
    var dy_textColorName: String?{
        set{
            objc_setAssociatedObject(self, &UILabel.keys_dy_textColor, newValue, .OBJC_ASSOCIATION_COPY)
        }
        get{
            objc_getAssociatedObject(self, &UILabel.keys_dy_textColor) as? String
        }
    }
}

extension UILabel: DynamicThemeProtocol {
    override public func isDynamic() -> Bool {
        return textColor.dyColorName != nil
    }

    override public func dyUpdateUI() -> () -> Void {
        return {
            if let colorName = self.textColor.dyColorName {
                self.textColor = UIView.dyColor(for: colorName)
            }
        }
    }
}
