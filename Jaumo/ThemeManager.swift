//
//  ThemeManager.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

extension UIButton {
    @objc dynamic var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}

class ThemeManager {
    class func applyDefaultTheme() {
        UIButton.appearance().cornerRadius = 6;
        UIButton.appearance().tintColor = UIColor.white
    }
    
}
