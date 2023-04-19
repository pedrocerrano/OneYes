//
//  Navigation.swift
//  OneYes
//
//  Created by iMac Pro on 4/13/23.
//

import UIKit

struct Navigation {
    
    static func noReasonsAvailable() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "OnboardingNavController")
        UIApplication.shared.currentUIWindow()?.rootViewController = navigation
        UIApplication.shared.currentUIWindow()?.makeKeyAndVisible()
        UserDefaults.standard.set(false, forKey: "userHasReasons")
    }
    
    static func reasonsAvailable() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "HomeNavController")
        UIApplication.shared.currentUIWindow()?.rootViewController = navigation
        UIApplication.shared.currentUIWindow()?.makeKeyAndVisible()
        UserDefaults.standard.set(true, forKey: "userHasReasons")
    }
}
