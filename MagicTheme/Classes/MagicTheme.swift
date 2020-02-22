//
//  ThemeManager.swift
//  appearance
//
//  Created by yidahis on 2020/2/18.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import UIKit

enum Theme {
    case dark
    case light
}

@objc open class MagicTheme: NSObject {
    
    private override init(){}
    private let hashTable = NSHashTable<AnyObject>(options: .weakMemory)
    
    public static let shared = MagicTheme()
    var theme = Theme.light
    var duration = 0.5
    
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

public extension MagicTheme{
    func changeTheme(){
        if theme == .dark {
            theme = .light
        }else{
            theme = .dark
        }
        self.updateUI()
    }
    
    fileprivate func updateUI(){
        self.hashTable.allObjects.forEach { (object) in
            if let dynamicUI = object as? DynamicThemeProtocol, let dynamicView = dynamicUI as? UIView{
                UIView.transition(with: dynamicView, duration: duration, options: .transitionCrossDissolve, animations: dynamicUI.dyUpdateUI(), completion: nil)
            }
        }
    }
}
