//
//  DateFormatter.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
}
