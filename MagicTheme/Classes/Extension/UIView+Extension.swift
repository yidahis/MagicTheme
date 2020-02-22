//
//  UIView+Extension.swift
//  appearance
//
//  Created by yidahis on 2020/2/19.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import UIKit

extension UIViewController {
    
    @objc func swift_dy_viewDidLayoutSubviews(){
        print("swift_dy_viewDidLayoutSubviews", self)
        swift_dy_viewDidLayoutSubviews()
        view.searchDynamicView()
    }
}

extension UIView {
    func searchDynamicView(){
        print("searchDynamicView", self)
        if isDynamic() == true {
            MagicTheme.shared.add(self)
        }
        if subviews.count == 0 {
            return
        }
        for subView in subviews {
            if  subView.isDynamic() == true {
                MagicTheme.shared.add(subView)
                subView.searchDynamicView()
            }
        }
    }
}

extension UIView {
    
    private static var keys_dy_backgroundColor = "keys_backgroundColor"
    var dy_backgroundColor: R.Color?{
        set{
            objc_setAssociatedObject(self, &UIView.keys_dy_backgroundColor, newValue, .OBJC_ASSOCIATION_COPY)
        }
        get{
            objc_getAssociatedObject(self, &UIView.keys_dy_backgroundColor) as? R.Color
        }
    }
    
    @objc func swift_dy_setBackgroundColor(_ backgroundColor: UIColor){
        if let dyColorName = backgroundColor.dyColorName{
            MagicTheme.shared.add(self)
            dy_backgroundColor = R.Color(rawValue: dyColorName)
        }
        swift_dy_setBackgroundColor(backgroundColor)
    }
}

extension UIView: DynamicThemeProtocol {
    func isDynamic() -> Bool {
        if let dyColorName = backgroundColor?.dyColorName{
            dy_backgroundColor = R.Color(rawValue: dyColorName)
            return true
        }
        return false
    }
    
    func dyUpdateUI() -> () -> Void {
        return {
            self.backgroundColor = self.dy_backgroundColor?.theme
        }
    }
}
