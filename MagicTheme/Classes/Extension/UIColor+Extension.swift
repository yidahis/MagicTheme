//
//  UIColor+Extension.swift
//  appearance
//
//  Created by yidahis on 2020/2/20.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import UIKit

@objc public extension UIColor {
    class func hex(_ hex: String) -> UIColor {
        var cString = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            let index = cString.index(cString.startIndex, offsetBy:1)
            cString = String(cString[index...])
        }
    
        if cString.count != 6 {
            return UIColor.red
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2)
        let rString = String(cString[..<rIndex])
        let otherString = String(cString[rIndex...])
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = String(otherString[..<gIndex])
        let bIndex = cString.index(cString.endIndex, offsetBy: -2)
        let bString = String(cString[bIndex...])
        
        var r:CUnsignedLongLong = 0, g:CUnsignedLongLong = 0, b:CUnsignedLongLong = 0
        Scanner(string: rString).scanHexInt64(&r)
        Scanner(string: gString).scanHexInt64(&g)
        Scanner(string: bString).scanHexInt64(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    class func dy_colorWithHex(hex string: String) -> UIColor {
        hex(string)
    }
}

fileprivate var colorDic = [UnsafeMutablePointer<Any>: String]()
public extension UIColor {
    static var keys_dyColorName = "keys_dyColorName"
    var dyColorName: String? {
        get{
            objc_getAssociatedObject(self, &(UIColor.keys_dyColorName)) as? String
           
        }
        set{
            objc_setAssociatedObject(self, &(UIColor.keys_dyColorName), newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}

