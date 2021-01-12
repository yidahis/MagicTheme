//
//  ViewController.swift
//  MagicTheme
//
//  Created by yidahis@gmail.com on 02/21/2020.
//  Copyright (c) 2020 yidahis@gmail.com. All rights reserved.
//

import UIKit
import MagicTheme

//protocol Personable {
//
//}

//typealias Person = Personable

//class Student: Person {
//
//}

protocol Runnable {
    associatedtype Speed
    var speed: Speed{get}
}
class Person : Runnable {
    var speed: Double{
        0.0
    }
}
class Car : Runnable {
    var speed: Int{
        0
    }
}
func get<T: Runnable>(_ type: Int) -> T {
    if type == 0 {
        return Person() as! T
    }
    return Car() as! T
}

@available(iOS 13.0.0, *)
func get1(_ type: Int) -> some Runnable {
//    if type == 0 {
//        return Person()
//    }
    return Car()
}

var r1: Car = get(0)
var r2: Person = get(1)




class ViewController: UIViewController {
//    var p: Runnable
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var storyBoardLabel: UILabel!
//    var age: Int
//    init() {
//        age = 0
//        p = Person()
//        super.init(nibName: nil, bundle: nil)
//        self.age = 0
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        print(123)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configUI()
        
        for var i in stride(from: 0, to: 10, by: 2){
            print("---------")
            
            i += 2
            print(i)
        }
        
        
    }
    
    
    func configUI(){
        title = "Main"
        view.backgroundColor = R.Color.buttonBackground.theme
        
        navigationController?.navigationBar.barTintColor = R.Color.background.theme
        storyBoardLabel.textColor = R.Color.title.theme
        nextBtn.setTitleColor(R.Color.title.theme, for: .normal)
        
        for _ in 0..<1 {
            let label = UILabel()
            label.frame = CGRect(x: 100, y: 100, width: 60, height: 20)
            //            label.backgroundColor = R.Color.background.themeColor
            label.textColor = R.Color.title.theme
            label.text = "a label"
            view.addSubview(label)
        }
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 240, y: 100, width: 100, height: 100)
        imageView.image = R.Image.icon_baby.theme
        self.view.addSubview(imageView)
        
        let btn = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 100))
        btn.setTitle("a button", for: .normal)
        btn.setTitleColor(R.Color.title.theme, for: .normal)
        btn.setTitleColor(R.Color.hightLightTitle.theme, for: .highlighted)
        btn.setImage(R.Image.button_icon_teat.theme, for: .normal)
        //        btn.backgroundColor = R.Color.buttonBackground.themeColor
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func btnAction(_ sender: UIButton){
        let begin = Date()
        MagicTheme.shared.changeTheme()
        let time = Date().timeIntervalSince1970 - begin.timeIntervalSince1970
        print(time)
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        let mainController = MainViewController()
        navigationController?.pushViewController(mainController, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//extension ViewController:

