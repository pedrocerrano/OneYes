//
//  Reason.swift
//  OneYes
//
//  Created by iMac Pro on 3/30/23.
//

import UIKit

class Reason {
    
    enum ReasonKey {
        static let title         = "title"
        static let startDate     = "startDate"
        static let completedDate = "completedDate"
        static let isCompleted   = "isCompleted"
        static let logs          = "logs"
        static let reasonUUID    = "reasonUUID"
    }
    
    //MARK: - PROPERTIES
    var title: String
    let startDate: Date
    var completedDate: Date?
    var isCompleted: Bool
    var logs: [Log]
    let reasonUUID: String
    
    
    var reasonDictionaryRepresentation: [String : AnyHashable] {
        [
            ReasonKey.title         : self.title,
            ReasonKey.startDate     : self.startDate.timeIntervalSince1970,
            ReasonKey.completedDate : self.completedDate?.timeIntervalSince1970,
            ReasonKey.isCompleted   : self.isCompleted,
            ReasonKey.logs          : self.logs.map { $0.logDictionaryRepresentation },
            ReasonKey.reasonUUID    : self.reasonUUID
        ]
    }
    
    
    init(title: String, startDate: Date = Date(), completedDate: Date? = nil, isCompleted: Bool = false, logs: [Log], reasonUUID: String) {
        self.title         = title
        self.startDate     = startDate
        self.completedDate = completedDate
        self.isCompleted   = isCompleted
        self.logs          = logs
        self.reasonUUID    = reasonUUID
    }
}


//MARK: - EXT: Convenience Initializer
extension Reason {
    convenience init?(fromReasonDictionary reasonDictionary: [String : Any ]) {
        guard let title            = reasonDictionary[ReasonKey.title] as? String,
              let startDate        = reasonDictionary[ReasonKey.startDate] as? Double,
              let isCompleted      = reasonDictionary[ReasonKey.isCompleted] as? Bool,
              let logsDictionaries = reasonDictionary[ReasonKey.logs] as? [[String : AnyHashable]],
              let reasonUUID       = reasonDictionary[ReasonKey.reasonUUID] as? String else {
            print("Failed to initialize Reason Model object.")
            return nil
        }
        
        let completedDate = reasonDictionary[ReasonKey.completedDate] as? Double ?? 0
        var logsArray     = logsDictionaries.compactMap { Log(fromLogDictionary: $0) }
        
        self.init(title: title, startDate: Date(timeIntervalSince1970: startDate), completedDate: Date(timeIntervalSince1970: completedDate), isCompleted: isCompleted, logs: logsArray, reasonUUID: reasonUUID)
    }
}


//MARK: - EXT: Reason EQUATABLE
extension Reason: Equatable {
    static func == (lhs: Reason, rhs: Reason) -> Bool {
        return lhs.reasonUUID == rhs.reasonUUID
    }
}
