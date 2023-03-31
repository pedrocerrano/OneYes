//
//  Affirmation.swift
//  OneYes
//
//  Created by iMac Pro on 3/30/23.
//

import Foundation

class Affirmation {
    
    enum AffirmationKey {
        static let title           = "title"
        static let startDate       = "startDate"
        static let completedDate   = "completedDate"
        static let isCompleted     = "isCompleted"
        static let logs            = "logs"
        static let affirmationUUID = "affirmationUUID"
    }
    
    //MARK: - PROPERTIES
    var title: String
    let startDate: Date
    let completedDate: Date
    var isCompleted: Bool
    var logs: [Log]
    let affirmationUUID: String
    
    
    var affirmationDictionaryRepresentation: [String : AnyHashable] {
        [
            AffirmationKey.title            : self.title,
            AffirmationKey.startDate        : self.startDate.timeIntervalSince1970,
            AffirmationKey.completedDate    : self.completedDate.timeIntervalSince1970,
            AffirmationKey.isCompleted      : self.isCompleted,
//            AffirmationKey.logs             : self.logs,
            AffirmationKey.affirmationUUID  : self.affirmationUUID
        ]
    }
    
    init(title: String, startDate: Date = Date(), completedDate: Date = Date(), isCompleted: Bool, logs: [Log], affirmationUUID: String = UUID().uuidString) {
        self.title           = title
        self.startDate       = startDate
        self.completedDate   = completedDate
        self.isCompleted     = isCompleted
        self.logs            = logs
        self.affirmationUUID = affirmationUUID
    }
}


//MARK: - EXT: Convenience Initializer
extension Affirmation {
    convenience init?(fromAffirmationDictionary affirmationDictionary: [String : Any ]) {
        guard let title           = affirmationDictionary[AffirmationKey.title] as? String,
              let startDate       = affirmationDictionary[AffirmationKey.startDate] as? Double,
              let completedDate   = affirmationDictionary[AffirmationKey.completedDate] as? Double,
              let isCompleted     = affirmationDictionary[AffirmationKey.isCompleted] as? Bool,
              let logsArray       = affirmationDictionary[AffirmationKey.logs] as? [Log],
              let affirmationUUID = affirmationDictionary[AffirmationKey.affirmationUUID] as? String else {
            print("Failed to initialize Affirmation Model object.")
            return nil
        }
        
        self.init(title: title, startDate: Date(timeIntervalSince1970: startDate), completedDate: Date(timeIntervalSince1970: completedDate), isCompleted: isCompleted, logs: logsArray, affirmationUUID: affirmationUUID)
    }
}


//MARK: - EXT: Affirmation EQUATABLE
extension Affirmation: Equatable {
    static func == (lhs: Affirmation, rhs: Affirmation) -> Bool {
        return lhs.affirmationUUID == rhs.affirmationUUID
    }
}
