//
//  UIButton+Extension.swift
//  appearance
//
//  Created by yidahis on 2020/2/19.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import Foundation

extension UIControl{
    var dyStates: [UIControl.State] {
        get {
            [
             .highlighted,
             .selected,
             .disabled,
            .normal,]
        }
    }
}

public struct UpdateUIUnit {
    var sel: Selector
    var state: UIControl.State.RawValue
    var rColorName: String?
    var rImageName: String?
}
extension UIButton {
    
    static var keys_updateUnits = "keys_updateUnits"
    
    var updateUnits: [UpdateUIUnit]?{
        set{
            objc_setAssociatedObject(self, &UIButton.keys_updateUnits, newValue, .OBJC_ASSOCIATION_COPY)
        }
        get{
            objc_getAssociatedObject(self, &UIButton.keys_updateUnits) as? [UpdateUIUnit]
        }
    }
}

extension UIButton: DynamicThemeProtocol {
    override public func isDynamic() -> Bool {
        if updateUnits == nil {
            updateUnits = [UpdateUIUnit]()
        }
        var isDynamicBtn = false
        dyStates.forEach { (dyState) in
            if let color = titleColor(for: dyState),
                let dyColorName = color.dyColorName {
                let unit = UpdateUIUnit(sel: #selector(setTitleColor(_:for:)), state: dyState.rawValue, rColorName: dyColorName)
                updateUnits?.append(unit)
                isDynamicBtn = true
            }
            
            if let image = image(for: dyState),
                let dyName = image.dyName {
                let unit = UpdateUIUnit(sel: #selector(setImage(_:for:)), state: dyState.rawValue, rImageName: dyName)
                updateUnits?.append(unit)
                isDynamicBtn = true
            }
        }
        for dyState in dyStates {
            
        }
        return isDynamicBtn
    }
    override public func dyUpdateUI() ->() -> Void {
        super.dyUpdateUI()()
        return {
            print(self.updateUnits)
            self.updateUnits?.forEach({ (unit) in
                if let rImageName = unit.rImageName, let dyImage = UIView.dyImage(for: rImageName) {
                    self.dy_perform(unit.sel, with: [dyImage, unit.state])
                }

                if let rColorName = unit.rColorName, let rColor = UIView.dyColor(for: rColorName) {
                    self.dy_perform(unit.sel, with: [rColor, unit.state])
                }
            })
        }
    }
}



