//
//  Navigation.swift
//  OneYes
//
//  Created by iMac Pro on 4/13/23.
//

import UIKit

struct Navigation {
    
    static func noReasonsAvailable() {
        UserDefaults.standard.set(false, forKey: "userHasReasons")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "OnboardingNavController")
        UIApplication.shared.currentUIWindow()?.rootViewController = navigation
        UIApplication.shared.currentUIWindow()?.makeKeyAndVisible()
    }
    
    static func reasonsAvailable() {
        UserDefaults.standard.set(true, forKey: "userHasReasons")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "HomeNavController")
        UIApplication.shared.currentUIWindow()?.rootViewController = navigation
        UIApplication.shared.currentUIWindow()?.makeKeyAndVisible()
    }
}
