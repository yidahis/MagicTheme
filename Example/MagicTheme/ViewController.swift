//
//  ViewController.swift
//  MagicTheme
//
//  Created by yidahis@gmail.com on 02/21/2020.
//  Copyright (c) 2020 yidahis@gmail.com. All rights reserved.
//

import UIKit
import MagicTheme

class ViewController: UIViewController {
    
    @IBOutlet weak var storyBoardLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib", self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = R.Color.background.theme
        storyBoardLabel.textColor = R.Color.title.theme
        print("set storyBoardLabel textColor")
        addViews()
        
    }
    
   
    
    func addViews(){
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

