//
//  Theme.swift
//  Grocer
//
//  Created by Evan Boerchers on 2021-06-15.
//

import Foundation
import UIKit

final class Theme {
    
    static let mainColor = UIColor(hue: 0.9972, saturation: 0.61, brightness: 0.93, alpha: 1.0)
    
    static let foreground = UIColor.white
    
    static let toolbarButton = UIColor(hue: 0.9972, saturation: 0, brightness: 0.97, alpha: 1.0)
    
    static let background = UIColor(hue: 0.9972, saturation: 0.02, brightness: 0.96, alpha: 1.0)
    
    static let textPrimary = UIColor.black
    
    static let textSecondary = UIColor.systemGray
    
    static let textField = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
    
    static func navigationBarColors(){
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = mainColor
        
        navigationAppearance.titleTextAttributes = [.foregroundColor: foreground]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: foreground]
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: toolbarButton]
        
        UINavigationBar.appearance().standardAppearance.buttonAppearance = buttonAppearance
        UINavigationBar.appearance().compactAppearance?.buttonAppearance = buttonAppearance
        UINavigationBar.appearance().scrollEdgeAppearance?.buttonAppearance = buttonAppearance
    }
}
