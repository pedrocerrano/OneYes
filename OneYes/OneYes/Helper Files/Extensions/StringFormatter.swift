//
//  StringFormatter.swift
//  OneYes
//
//  Created by iMac Pro on 4/12/23.
//

import UIKit

extension NSMutableAttributedString {
    
    //MARK: - QUOTES
    var quoteFontSize: CGFloat { return 14 }
    var quoteNormalFont: UIFont { return UIFont.systemFont(ofSize: quoteFontSize)}
    var quoteItalicFont: UIFont { return UIFont.italicSystemFont(ofSize: quoteFontSize)}
    var quoteBoldFont: UIFont { return UIFont.boldSystemFont(ofSize: quoteFontSize)}
    
    func quoteNormal(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [.font : quoteNormalFont]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func quoteItalics(_ value: String) -> NSMutableAttributedString {
        let italicAttributes: [NSAttributedString.Key : Any] = [.font : quoteItalicFont]
        self.append(NSAttributedString(string: value, attributes: italicAttributes))
        return self
    }
    
    func quoteBold(_ value: String) -> NSMutableAttributedString {
        let boldAttributes: [NSAttributedString.Key : Any] = [.font : quoteBoldFont]
        self.append(NSAttributedString(string: value, attributes: boldAttributes))
        return self
    }
    
    //MARK: - LIST TITLES
    var listTitleFontSize: CGFloat { return 17 }
    var listTitleNormalFont: UIFont { return UIFont.systemFont(ofSize: listTitleFontSize)}
    var listTitleBoldFont: UIFont { return UIFont.boldSystemFont(ofSize: listTitleFontSize)}
    
    func listTitleNormal(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [.font : listTitleNormalFont]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func listTitleBold(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [.font : listTitleBoldFont]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func listTitleBoldGreen(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [
            .font : listTitleBoldFont,
            .foregroundColor : UIElements.Colors.oneYesGreen
        ]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
}
