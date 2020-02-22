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
    var dy_textColor: R.Color?{
        set{
            objc_setAssociatedObject(self, &UILabel.keys_dy_textColor, newValue, .OBJC_ASSOCIATION_COPY)
        }
        get{
            objc_getAssociatedObject(self, &UILabel.keys_dy_textColor) as? R.Color
        }
    }
}

extension UILabel: DynamicThemeProtocol {
    override func isDynamic() -> Bool {
        print("UILabel isDynamic" ,self.text,textColor.dyColorName)
        return textColor.dyColorName != nil
    }
    
    override func dyUpdateUI() -> () -> Void {
        return {
            if let colorName = self.textColor.dyColorName {
                self.textColor = R.Color(rawValue: colorName)?.theme
            }
        }
    }
}
