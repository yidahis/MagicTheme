//
//  MainTableViewCell.swift
//  appearance
//
//  Created by yidahis on 2020/2/21.
//  Copyright © 2020 fame.inc. All rights reserved.
//

import UIKit
import MagicTheme

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib", self)
        self.selectionStyle = .none
        contentView.backgroundColor = R.Color.background.theme
        
        mainImageView.image = R.Image.icon_baby.theme
        
        mainLabel.text = "XIB Label"
        mainLabel.textColor = R.Color.title.theme
        
        mainButton.setTitle("Change", for: .normal)
        mainButton.setImage(R.Image.button_icon_teat.theme, for: .normal)
        mainButton.setTitleColor(R.Color.title.theme, for: .normal)
        mainButton.setTitleColor(R.Color.hightLightTitle.theme, for: .highlighted)
        mainButton.backgroundColor = R.Color.buttonBackground.theme
    }

    @IBAction func mainButtonAction(_ sender: Any) {
        let begin = Date()
        MagicTheme.shared.changeTheme()
        let time = Date().timeIntervalSince1970 - begin.timeIntervalSince1970
        print(time)
    }
}
