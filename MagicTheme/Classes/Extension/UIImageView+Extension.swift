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
    var dyImage: R.Image?{
        set{
            objc_setAssociatedObject(self, &UIImageView.keys_dy_image, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get{
            objc_getAssociatedObject(self, &UIImageView.keys_dy_image) as? R.Image
        }
    }
}

extension UIImageView: DynamicThemeProtocol {
    override func isDynamic() -> Bool {
        if let image = image,
            let dyName = image.dyName
        {
            
            self.dyImage = R.Image(darkName: dyName)
            return true
        }
        return false
    }
    
    override func dyUpdateUI() -> () -> Void {
        return {
            self.image = self.dyImage?.theme
        }
    }
}
