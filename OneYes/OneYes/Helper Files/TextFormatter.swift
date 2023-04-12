//
//  TextFormatter.swift
//  OneYes
//
//  Created by iMac Pro on 4/12/23.
//

import UIKit

extension NSMutableAttributedString {
    var quoteFontSize: CGFloat { return 14 }
    var normalFont: UIFont { return UIFont.systemFont(ofSize: quoteFontSize)}
    var italicFont: UIFont { return UIFont.italicSystemFont(ofSize: quoteFontSize)}
    var boldFont: UIFont { return UIFont.boldSystemFont(ofSize: quoteFontSize)}
    
    func normal(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [.font : normalFont]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func italics(_ value: String) -> NSMutableAttributedString {
        let italicAttributes: [NSAttributedString.Key : Any] = [.font : italicFont]
        self.append(NSAttributedString(string: value, attributes: italicAttributes))
        return self
    }
    
    func bold(_ value: String) -> NSMutableAttributedString {
        let boldAttributes: [NSAttributedString.Key : Any] = [.font : boldFont]
        self.append(NSAttributedString(string: value, attributes: boldAttributes))
        return self
    }
}
