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
    
    struct CVCell {
        static let reasonListsCellHeight: Double = 45
        static let noLogListCellHeight: Double = 30
    }
    
    struct HomeScreenUI {
        static let cornerRadius: CGFloat    = 6
        static let shadowColor              = UIColor.black.cgColor
        static let shadowOpacity: Float     = 0.3
        static let shadowRadius: CGFloat    = 5
        static let shadowOffset             = CGSize(width: 0, height: 4)
        static let masksToBounds: Bool      = false
        static let borderColor              = UIColor.white.cgColor
        static let borderWidth: CGFloat     = 1
    }
    
    struct DetailButtonUI {
        static let shadowColor              = UIColor.black.cgColor
        static let shadowOpacity: Float     = 0.4
        static let shadowRadius: CGFloat    = 5
        static let shadowOffset             = CGSize(width: 0, height: 6)
        static let masksToBounds: Bool      = false
    }
}
