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
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if isDynamic() == true {
            MagicTheme.shared.add(self)
        }
    }

    open func swift_dy_didMoveToSuperview(){
        swift_dy_didMoveToSuperview()
        if isDynamic() == true {
            MagicTheme.shared.add(self)
        }
    }
}

extension UIView{
    class func dyImage(for name: String?) -> UIImage?{
        
        guard var imageName = name else {
            return nil
        }
        
        let theme = MagicTheme.shared.theme
        if theme != .light{
            imageName.append("_\(theme)")
        }
        
        return MagicTheme.shared.delegate?.dyImage(for: imageName)
    }
    
    class func dyColor(for name: String?) -> UIColor?{
        guard var colorName = name else {
            return nil
        }
        
        let theme = MagicTheme.shared.theme
        if theme != .light{
            colorName.append("_\(theme)")
        }
        return MagicTheme.shared.delegate?.dyColor(for: colorName)
    }
}

extension UIView {
    
    private static var keys_dy_backgroundColor = "keys_backgroundColor"
    var dy_backgroundColorName: String?{
        set{
            objc_setAssociatedObject(self, &UIView.keys_dy_backgroundColor, newValue, .OBJC_ASSOCIATION_COPY)
        }
        get{
            objc_getAssociatedObject(self, &UIView.keys_dy_backgroundColor) as? String
        }
    }
    
    @objc func swift_dy_setBackgroundColor(_ backgroundColor: UIColor){
        if let dyColorName = backgroundColor.dyColorName{
            MagicTheme.shared.add(self)
            dy_backgroundColorName = dyColorName
        }
        swift_dy_setBackgroundColor(backgroundColor)
    }
}

extension UIView: DynamicThemeProtocol {
    public func isDynamic() -> Bool {
        print("isDynamic",self,self,backgroundColor?.dyColorName)
        if let dyColorName = backgroundColor?.dyColorName{
            dy_backgroundColorName = dyColorName
            return true
        }
        return false
    }
    
    public func dyUpdateUI() -> () -> Void {
        return {
            print("dyUpdateUI::>",#function,self.dy_backgroundColorName ,UIView.dyColor(for: self.dy_backgroundColorName))
            let color = UIView.dyColor(for: self.dy_backgroundColorName)
            self.backgroundColor = color
        }
    }
}

