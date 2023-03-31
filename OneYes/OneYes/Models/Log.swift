//
//  Log.swift
//  OneYes
//
//  Created by iMac Pro on 3/30/23.
//

import Foundation

class Log {
    
    enum LogKey {
        static let logTitle = "logTitle"
        static let logDate  = "logDate"
        static let logUUID  = "logUUID"
    }
    
    //MARK: - PROPERTIES
    var logTitle: String
    var logDate: Date
    let logUUID: String
    
    var logDictionaryRepresentation: [String : AnyHashable] {
        [
            LogKey.logTitle : self.logTitle,
            LogKey.logDate  : self.logDate.timeIntervalSince1970,
            LogKey.logUUID  : self.logUUID
        ]
    }
    
    
    init(logTitle: String, logDate: Date = Date(), logUUID: String = UUID().uuidString) {
        self.logTitle = logTitle
        self.logDate  = logDate
        self.logUUID  = logUUID
    }
}


//MARK: - EXT: Convenience Initializer
extension Log {
    convenience init?(fromLogDictionary logDictionary: [String : Any]) {
        guard let logTitle = logDictionary[LogKey.logTitle] as? String,
              let logDate = logDictionary[LogKey.logDate] as? Double,
              let logUUID = logDictionary[LogKey.logUUID] as? String else {
            print("Failed to initialize Log Model object")
            return nil
        }
        
        self.init(logTitle: logTitle, logDate: Date(timeIntervalSince1970: logDate), logUUID: logUUID)
    }
}


//MARK: - EXT: Log EQUATABLE
extension Log: Equatable {
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.logUUID == rhs.logUUID
    }
}
