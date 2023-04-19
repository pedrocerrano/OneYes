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
    
    
    //MARK: - LIST LEADING HEADER
    var listLeadingHeaderFontSize: CGFloat { return 17 }
    var listLeadingHeaderNormalFont: UIFont { return UIFont.systemFont(ofSize: listLeadingHeaderFontSize)}
    var listLeadingHeaderBoldFont: UIFont { return UIFont.boldSystemFont(ofSize: listLeadingHeaderFontSize)}
    
    func listLeadingHeaderNormal(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [.font : listLeadingHeaderNormalFont]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func listLeadingHeaderBold(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [.font : listLeadingHeaderBoldFont]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func listLeadingHeaderBoldGreen(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [
            .font            : listLeadingHeaderBoldFont,
            .foregroundColor : UIElements.Colors.oneYesGreen
        ]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func listLeadingHeaderBoldRed(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [
            .font            : listLeadingHeaderBoldFont,
            .foregroundColor : UIElements.Colors.oneYesRed
        ]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    
    //MARK: - LIST TRAILING HEADER
    var listTrailingHeaderFontSize: CGFloat { return 13 }
    var listTrailingHeaderBoldFont: UIFont { return UIFont.boldSystemFont(ofSize: listTrailingHeaderFontSize)}
    
    func listTrailingHeaderBold(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [.font : listTrailingHeaderBoldFont]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func listTrailingHeaderBoldGreen(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [
            .font            : listTrailingHeaderBoldFont,
            .foregroundColor : UIElements.Colors.oneYesGreen
        ]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func listTrailingHeaderBoldRed(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [
            .font            : listTrailingHeaderBoldFont,
            .foregroundColor : UIElements.Colors.oneYesRed
        ]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    
    //MARK: - DETAIL NO LOG COUNT
    var detailNoLogCountFontSize: CGFloat { return 16 }
    var detailNoLogCountBoldFont: UIFont { return UIFont.boldSystemFont(ofSize: detailNoLogCountFontSize)}
    
    func detailNoLogCountBold(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [.font : detailNoLogCountBoldFont]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func detailNoLogCountBoldRed(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [
            .font            : detailNoLogCountBoldFont,
            .foregroundColor : UIElements.Colors.oneYesRed
        ]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    
    //MARK: - COMPLETED DATES
    var completedDatesFontSize: CGFloat { return 14 }
    var completedDatesNormalFont: UIFont { return UIFont.systemFont(ofSize: completedDatesFontSize)}
    
    func completedDatesNormal(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [.font : completedDatesNormalFont]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func completedDatesNormalGreen(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [
            .font            : completedDatesNormalFont,
            .foregroundColor : UIElements.Colors.oneYesGreen
        ]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
    
    func completedDatesNormalRed(_ value: String) -> NSMutableAttributedString {
        let normalAttributes: [NSAttributedString.Key : Any] = [
            .font            : completedDatesNormalFont,
            .foregroundColor : UIElements.Colors.oneYesRed
        ]
        self.append(NSAttributedString(string: value, attributes: normalAttributes))
        return self
    }
}
