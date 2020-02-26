//
//  UIImageView+Extension.swift
//  appearance
//
//  Created by yidahis on 2020/2/20.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import Foundation

extension UIImageView {
    static var keys_dy_image = "keys_dy_image"
    var dyImageName: String?{
        set{
            objc_setAssociatedObject(self, &UIImageView.keys_dy_image, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get{
            objc_getAssociatedObject(self, &UIImageView.keys_dy_image) as? String
        }
    }
}


extension UIImageView: DynamicThemeProtocol {
    override public func isDynamic() -> Bool {
        if let image = image,
            let imageName = image.dyName
        {
            self.dyImageName = imageName
            return true
        }
        return false
    }
    
    override public func dyUpdateUI() -> () -> Void {
        return {
            print(self.dyImageName)
            let img = UIView.dyImage(for: self.dyImageName)
            self.image = img
        }
    }
}
