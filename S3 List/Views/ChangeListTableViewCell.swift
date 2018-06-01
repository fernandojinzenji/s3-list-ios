//
//  ChangeListTableViewCell.swift
//  S3 List
//
//  Created by Fernando Jinzenji on 2018-05-31.
//  Copyright © 2018 Fernando Jinzenji. All rights reserved.
//

import UIKit

class ChangeListTableViewCell: UITableViewCell {

    let theme = ThemeManager.getTheme()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = theme.backgroundColor
        
        let listNameLabel = UILabel()
        listNameLabel.text = "A list name here"
        listNameLabel.textColor = theme.textColor
        listNameLabel.font = UIFont.getAppFontLIGHT(size: 20.0)
        listNameLabel.textColor = theme.textColor
        listNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(listNameLabel)
        listNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        listNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
