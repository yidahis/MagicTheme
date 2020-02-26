//
//  NSObject+Runtime.swift
//  appearance
//
//  Created by yidahis on 2020/2/20.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import Foundation
import ObjectiveC

public let swift_dy_prefix = "swift_dy_"

extension NSObject {
    static public func getMethodList(prefix: String) -> [Method] {
        var methods = [Method]()
        var count: UInt32 = 0
        
        guard let propertys = class_copyMethodList(self.classForCoder(), &count) else {
            return methods
        }
        
        for i  in 0...(Int(count) - 1) {
            let aMet: Method = propertys[i]
            let string = String(utf8String: property_getName(aMet))
            if let name = string, name.hasPrefix(prefix) {
                methods.append(aMet)
            }
        }
        return methods
    }
}

extension NSObject: NSSwiftyLoadProtocol{
    static var selectors: [(Selector,Selector)] = []
    
    public class func swiftyLoad() {
        let methods = getMethodList(prefix: swift_dy_prefix)
        methods.forEach { (method) in
            exchangImp(dy: method, prefix: swift_dy_prefix)
        }
    }
    
    private class func exchangImp(dy newMethod: Method, prefix: String){
        let newSelector = method_getName(newMethod)
        let newMethodName = String(utf8String: property_getName(newMethod))
        guard let orginMethodName = newMethodName?.replacingOccurrences(of: prefix, with: "")
            else {
                return
        }
        
        let origin = class_getInstanceMethod(self.classForCoder(), NSSelectorFromString(orginMethodName))
        let new = class_getInstanceMethod(self.classForCoder(), newSelector)
        guard let origin_s = origin , let new_s = new else {
            return
        }
        method_exchangeImplementations(origin_s, new_s)
    }
}


