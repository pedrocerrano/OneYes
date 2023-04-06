//
//  UIElements.swift
//  OneYes
//
//  Created by iMac Pro on 4/6/23.
//

import UIKit

struct UIElements {
    
    static func configureButton(for button: UIButton) {
        let height                 = button.frame.height
        button.layer.cornerRadius  = height/2
        button.layer.shadowColor   = Constants.DetailButtonUI.shadowColor
        button.layer.shadowOpacity = Constants.DetailButtonUI.shadowOpacity
        button.layer.shadowRadius  = Constants.DetailButtonUI.shadowRadius
        button.layer.shadowOffset  = Constants.DetailButtonUI.shadowOffset
        button.layer.masksToBounds = Constants.DetailButtonUI.masksToBounds
    }
    
    
    static func configureView(for view: UIView) {
        view.layer.cornerRadius  = Constants.HomeScreenUI.cornerRadius
        view.layer.shadowColor   = Constants.HomeScreenUI.shadowColor
        view.layer.shadowOpacity = Constants.HomeScreenUI.shadowOpacity
        view.layer.shadowRadius  = Constants.HomeScreenUI.shadowRadius
        view.layer.shadowOffset  = Constants.HomeScreenUI.shadowOffset
        view.layer.masksToBounds = Constants.HomeScreenUI.masksToBounds
    }
}
