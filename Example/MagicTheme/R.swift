//
//  R.swift
//  appearance
//
//  Created by yidahis on 2020/2/18.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import UIKit
import MagicTheme

extension R {
    private enum DarkColor: String {
        case title
        case hightLightTitle
        case background
        case buttonBackground
        
        func rawValue1() -> String {
            switch self {
            case .title:
                return "ffffff"
            case .hightLightTitle:
                return "EA3F39"
            case .background:
                return "272634"
            case .buttonBackground:
                return "5000ff"
            }
        }
    }
    
    private enum LightColor: String {
        case title
        case hightLightTitle
        case background
        case buttonBackground
        
        func rawValue1() -> String {
            switch self {
            case .title:
                return "272634"
            case .hightLightTitle:
                return "F6CE46"
            case .background:
                return "ffff00"
            case .buttonBackground:
                return "E08D35"
            }
        }
    }
    
    public enum Color: String, CaseIterable {
        case title
        case hightLightTitle
        case background
        case buttonBackground
        
        init?(darkName: String?) {
            self.init(rawValue: darkName?.replacingOccurrences(of: "_dark", with: "") ?? "")
        }
        
        public var theme: UIColor {
            get {
                var colorValue = LightColor.init(rawValue: self.rawValue)!.rawValue1()
                if MagicTheme.shared.theme == .dark {
                     colorValue = DarkColor.init(rawValue: self.rawValue)!.rawValue1()
                }
                let color = UIColor.dy_colorWithHex(hex: colorValue)
                color.dyColorName = self.rawValue
                return color
            }
        }
    }
}

public extension R {
    enum Image: String {
        case icon_baby
        case button_icon_teat
        
        init?(darkName: String?) {
            self.init(rawValue: darkName?.replacingOccurrences(of: "_dark", with: "") ?? "")
        }
        
        public var theme: UIImage? {
            get {
                  let image = UIImage(named: self.rawValue)
                image?.dyName = self.rawValue
                  return image
            }
        }
    }
}

extension R: MagicThemeProrocolol {
    
    public func dyImage(for name: String) -> UIImage? {
        UIImage(named: name)
   }
    public func dyColor(for name: String) -> UIColor? {
        print("color ", name)
        
        return R.Color(darkName: name)?.theme
    }
}

