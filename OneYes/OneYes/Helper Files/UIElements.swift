//
//  UIElements.swift
//  OneYes
//
//  Created by iMac Pro on 4/6/23.
//

import UIKit

struct UIElements {
    
    struct Colors {
        static let oneYesGreen    = UIColor(red: 0/255, green: 166/255, blue: 81/255, alpha: 1)
        static let oneYesRed      = UIColor(red: 166/255, green: 0, blue: 2/255, alpha: 1)
    }
    
    static func configureButton(for button: UIButton, withColor color: UIColor) {
        let height                   = button.frame.height
        button.layer.cornerRadius    = height/2
        button.layer.shadowColor     = Constants.DetailButtonUI.shadowColor
        button.layer.shadowOpacity   = Constants.DetailButtonUI.shadowOpacity
        button.layer.shadowRadius    = Constants.DetailButtonUI.shadowRadius
        button.layer.shadowOffset    = Constants.DetailButtonUI.shadowOffset
        button.layer.backgroundColor = color.cgColor
        button.layer.masksToBounds   = Constants.DetailButtonUI.masksToBounds
    }
    
    static func configureCircleLabel(for label: UILabel, withColor color: UIColor) {
        let height                  = label.frame.height
        label.layer.cornerRadius    = height/2
        label.layer.borderColor     = Constants.CircleLabelUI.borderColor
        label.layer.borderWidth     = Constants.CircleLabelUI.borderWidth
        label.layer.shadowRadius    = Constants.CircleLabelUI.shadowRadius
        label.layer.shadowOffset    = Constants.CircleLabelUI.shadowOffset
        label.layer.masksToBounds   = Constants.CircleLabelUI.masksToBounds
        label.backgroundColor       = color
    }
    
    
    static func configureView(for view: UIView) {
        view.layer.cornerRadius  = Constants.HomeScreenUI.cornerRadius
        view.layer.shadowColor   = Constants.HomeScreenUI.shadowColor
        view.layer.shadowOpacity = Constants.HomeScreenUI.shadowOpacity
        view.layer.shadowRadius  = Constants.HomeScreenUI.shadowRadius
        view.layer.shadowOffset  = Constants.HomeScreenUI.shadowOffset
        view.layer.borderColor   = Constants.HomeScreenUI.borderColor
        view.layer.borderWidth   = Constants.HomeScreenUI.borderWidth
        view.layer.masksToBounds = Constants.HomeScreenUI.masksToBounds
    }
}
