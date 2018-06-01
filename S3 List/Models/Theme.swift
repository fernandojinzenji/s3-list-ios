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
}

class Theme {
    
    var backgroundColor: UIColor
    var titleColor: UIColor
    var textColor: UIColor
    
    init(themeName: ThemeName) {
        
        switch themeName {
        case .Default:
            backgroundColor = UIColor.white
            titleColor = UIColor.black
            textColor = UIColor.darkGray
        case .Dark:
            backgroundColor = UIColor.black
            titleColor = UIColor.white
            textColor = UIColor.lightGray
        }
    }
}

class ThemeManager {
    
    class func saveTheme(themeName: ThemeName) {
        UserDefaults.standard.setValue(themeName.rawValue, forKey: savedThemeKey)
    }
    
    class func getTheme() -> Theme {
        
        var theme = Theme(themeName: .Dark)
        
        guard let savedThemeNameString = UserDefaults.standard.string(forKey: savedThemeKey) else { return theme }
        guard let savedThemeName = ThemeName(rawValue: savedThemeNameString) else { return theme }
        
        theme = Theme(themeName: savedThemeName)
        
        return theme
    }
}
