//
//  ThemeManager.swift
//  appearance
//
//  Created by yidahis on 2020/2/18.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import UIKit

public enum Theme: String {
    case dark
    case light
}

public struct R {
    public init() {
        
    }
}

@objc open class MagicTheme: NSObject {
    
    private override init(){}
    private let hashTable = NSHashTable<AnyObject>(options: .weakMemory)
    
    public var delegate: MagicThemeProrocolol?{
        didSet{
            start()
        }
    }
    
    public static let shared = MagicTheme()
    public var theme = Theme.light{
        didSet{
            self.updateUI()
        }
    }
    
    var lastTheme  = Theme.dark
    
    var duration = 0.5
    
    var retainColor: UIColor?
    
    func start(){
        if #available(iOS 13.0, *) {
           
                  retainColor = UIColor { (trai) -> UIColor in
                      if trai.userInterfaceStyle == .dark {
                          self.theme = .dark
                      }else {
                          self.theme = .light
                      }
                      return UIColor.clear
                  }
              } else {
                  // Fallback on earlier versions
              }
        
         UIApplication.shared.keyWindow?.backgroundColor = retainColor
    }
    
    func allObjects() -> [AnyObject]{
        return hashTable.allObjects
    }
    
    func contains(_ anObject: AnyObject?) -> Bool{
        return hashTable.contains(anObject)
    }
    
    func add(_ view: UIView){
        if  MagicTheme.shared.contains(view) == false {
            hashTable.add(view)
        }
    }
    
    func remove(_ view: UIView) {
        hashTable.remove(view)
    }
}

public extension MagicTheme {
    
}

public extension MagicTheme{
    func changeTheme(){
        lastTheme = theme
        if theme == .dark {
            theme = .light
        }else{
            theme = .dark
        }
    }
    
    fileprivate func updateUI(){
        self.hashTable.allObjects.forEach { (object) in
            if let dynamicUI = object as? DynamicThemeProtocol, let dynamicView = dynamicUI as? UIView{
                UIView.transition(with: dynamicView, duration: duration, options: .transitionCrossDissolve, animations: dynamicUI.dyUpdateUI(), completion: nil)
            }
        }
    }
}
