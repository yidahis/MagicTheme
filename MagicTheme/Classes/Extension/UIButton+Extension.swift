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
            [.normal,
             .highlighted,
             .selected,
             .disabled]
        }
    }
}

public struct UpdateUIUnit {
    var sel: Selector
    var state: UIControl.State.RawValue
    var rColor: R.Color?
    var rImage: R.Image?
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
    override func isDynamic() -> Bool {
        if updateUnits == nil {
            updateUnits = [UpdateUIUnit]()
        }
        var isDynamicBtn = false
        for dyState in dyStates {
            if let color = titleColor(for: dyState),
                let dyColorName = color.dyColorName,
                let rColor = R.Color(rawValue: dyColorName) {
                let unit = UpdateUIUnit(sel: #selector(setTitleColor(_:for:)), state: dyState.rawValue, rColor: rColor)
                updateUnits?.append(unit)
                isDynamicBtn = true
            }
            
            if let image = image(for: dyState),
                let dyName = image.dyName,
                let rImage = R.Image(darkName: dyName) {
                let unit = UpdateUIUnit(sel: #selector(setImage(_:for:)), state: dyState.rawValue, rImage: rImage)
                updateUnits?.append(unit)
                isDynamicBtn = true
            }
        }
        return isDynamicBtn
    }
    override func dyUpdateUI() ->() -> Void {
        super.dyUpdateUI()()
        return {
            self.updateUnits?.forEach({ (unit) in
                if let rImage = unit.rImage, let dyImage = rImage.theme {
                    self.dy_perform(unit.sel, with: [dyImage, unit.state])
                }
                
                if let rColor = unit.rColor {
                    self.dy_perform(unit.sel, with: [rColor.theme, unit.state])
                }
            })
        }
    }
}



