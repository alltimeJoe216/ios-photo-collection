//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Marissa Gonzales on 4/23/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import Foundation


class ThemeHelper {
    
    let themePreferenceKey = "themePrefenceKey"
    
    init() {
        
        if themePreferenceKey == "Blue" {
            
            let userDefaults = UserDefaults.standard
            
            userDefaults.set("Blue", forKey: "themePreferenceKey")
        }
    }

    func setThemePreferenceToDark() {
        
        UserDefaults.standard.set("Dark", forKey: "themePreferenceKey")
 
    }
    
    func setThemePreferenceToYourColorHere() {
        
        let userDefaults = UserDefaults.standard
        
        userDefaults.set("Blue", forKey: "themePreferenceKey")
    }
    
    var themePreference: String? {
        
        let shouldShowColor = UserDefaults.standard.string(forKey: themePreferenceKey)
        
        return shouldShowColor
    }
}
    

    

