//
//  UIImage+Extension.swift
//  appearance
//
//  Created by yidahis on 2020/2/20.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import UIKit

public extension UIImage {
    static var keys_dyName = "keys_dyName"
    var dyName: String? {
        get{
            objc_getAssociatedObject(self, &UIImage.keys_dyName) as? String
        }
        set{
            objc_setAssociatedObject(self, &UIImage.keys_dyName, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
    convenience init?(dyNamed name: String){
        self.init(named: name)
        dyName = name
    }

}
