//
//  UIFont+custom.swift
//  S3 List
//
//  Created by Fernando Jinzenji on 2018-05-29.
//  Copyright © 2018 Fernando Jinzenji. All rights reserved.
//

import UIKit

public extension UIFont {
    
    class func getAppFontLIGHT(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Light", size: size)!
    }
    
    class func getAppFontBOLD(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Bold", size: size)!
    }
    
    class func getAppFontMEDIUM(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Medium", size: size)!
    }
    
    class func getAppFontREGULAR(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Regular", size: size)!
    }
}
