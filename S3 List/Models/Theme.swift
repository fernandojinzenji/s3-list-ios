//
//  Theme.swift
//  S3 List
//
//  Created by Fernando Jinzenji on 2018-06-01.
//  Copyright © 2018 Fernando Jinzenji. All rights reserved.
//

import Foundation
import UIKit

let savedThemeKey = "savedTheme"

enum ThemeName: String {
    case Default = "default"
    case Dark = "dark"
    case Brazilian = "brazilian"
    case Canadian = "canadian"
}

class Theme {
    
    var backgroundColor: UIColor
    var titleColor: UIColor
    var textColor: UIColor
    var useClearButtons: Bool
    
    init(backgroundColor: UIColor, titleColor: UIColor, textColor: UIColor, useClearButtons: Bool) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.textColor = textColor
        self.useClearButtons = useClearButtons
    }
    
    convenience init(themeName: ThemeName) {
        
        switch themeName {
        case .Default:
            self.init(backgroundColor: UIColor.white, titleColor: UIColor.black, textColor: UIColor.darkGray, useClearButtons: false)
        case .Dark:
            self.init(backgroundColor: UIColor.black, titleColor: UIColor.white, textColor: UIColor.lightGray, useClearButtons: true)
        case .Brazilian:
            self.init(backgroundColor: UIColor.yellow, titleColor: UIColor(red: 65/255, green: 117/255, blue: 5/255, alpha: 1.0), textColor: UIColor(red: 65/255, green: 117/255, blue: 5/255, alpha: 1.0), useClearButtons: false)
        case .Canadian:
            self.init(backgroundColor: UIColor.red, titleColor: UIColor.white, textColor: UIColor.white, useClearButtons: true)
        }
    }
}

class ThemeManager {
    
    class func saveTheme(themeName: ThemeName) {
        UserDefaults.standard.setValue(themeName.rawValue, forKey: savedThemeKey)
    }
    
    class func getTheme() -> Theme {
        
        var theme = Theme(themeName: .Canadian)
        
        guard let savedThemeNameString = UserDefaults.standard.string(forKey: savedThemeKey) else { return theme }
        guard let savedThemeName = ThemeName(rawValue: savedThemeNameString) else { return theme }
        
        theme = Theme(themeName: savedThemeName)
        
        return theme
    }
}
