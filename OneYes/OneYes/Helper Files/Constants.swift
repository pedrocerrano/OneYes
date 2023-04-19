//
//  Constants.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

struct Constants {
    
    struct Firebase {
        static let deviceCollectionType = UIDevice.current.identifierForVendor?.uuidString
    }
    
    struct Notifications {
        static let newReasonCreated = Notification.Name("newReasonCreated")
    }
    
    struct CVCell {
        static let reasonListsCellHeight: Double = 35
        static let noLogListCellHeight: Double = 20
    }
    
    struct HomeScreenUI {
        static let cornerRadius: CGFloat    = 6
        static let shadowColor              = UIColor.black.cgColor
        static let shadowOpacity: Float     = 0.4
        static let shadowRadius: CGFloat    = 4
        static let shadowOffset             = CGSize(width: 0, height: 4)
        static let borderColor              = UIColor.white.cgColor
        static let borderWidth: CGFloat     = 1
        static let masksToBounds: Bool      = false
    }
    
    struct DetailButtonUI {
        static let shadowColor           = UIColor.black.cgColor
        static let shadowOpacity: Float  = 0.4
        static let shadowRadius: CGFloat = 5
        static let shadowOffset          = CGSize(width: 0, height: 6)
        static let labelShadowColor      = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        static let labelShadowOffset     = CGSize(width: 0, height: 2)
        static let masksToBounds: Bool   = false
    }
    
    struct CircleLabelUI {
        static let borderColor           = UIColor.white.cgColor
        static let borderWidth: CGFloat  = 1
        static let shadowColor           = UIColor.black.cgColor
        static let shadowOpacity: Float  = 0.4
        static let shadowRadius: CGFloat = 5
        static let shadowOffset          = CGSize(width: 0, height: 6)
        static let masksToBounds: Bool   = true
    }
}
