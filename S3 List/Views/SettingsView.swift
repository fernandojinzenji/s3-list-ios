//
//  SettingsView.swift
//  S3 List
//
//  Created by Fernando Jinzenji on 2018-05-31.
//  Copyright © 2018 Fernando Jinzenji. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    let theme = ThemeManager.getTheme()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = theme.backgroundColor
        
        // Bottom
        let versionLabel = UILabel()
        versionLabel.text = "Version 1.0"
        versionLabel.textColor = theme.textColor
        versionLabel.font = UIFont.getAppFontLIGHT(size: 17.0)
        versionLabel.textColor = UIColor.darkGray
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(versionLabel)
        versionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        versionLabel.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -12.0).isActive = true
        
        let developedByLabel = UILabel()
        developedByLabel.text = "Developed by Fernando Jinzenji"
        developedByLabel.textColor = theme.textColor
        developedByLabel.font = UIFont.getAppFontLIGHT(size: 17.0)
        developedByLabel.textColor = UIColor.darkGray
        developedByLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(developedByLabel)
        developedByLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        developedByLabel.bottomAnchor.constraint(equalTo: versionLabel.topAnchor, constant: -4.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
