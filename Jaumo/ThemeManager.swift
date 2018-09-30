//
//  ThemeManager.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

class ThemeManager {
    class func applyDefaultTheme() {
        UIButton.appearance().layer.cornerRadius = 6
        UIButton.appearance().tintColor = UIColor.white
    }
}
