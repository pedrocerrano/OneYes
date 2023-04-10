//
//  DetailViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

struct NoDetailViewModel {
    
    //MARK: - PROPERTIES
    var reason: Reason?
    let service: FirebaseService
    
    init(reason: Reason? = nil, service: FirebaseService = FirebaseService()) {
        self.reason  = reason
        self.service = service
    }
    
    
    //MARK: - FUNCTIONS
    func saveNewLog(logTitle: String) {
        if let reason = reason {
            service.saveNewLogToFirestore(forReason: reason, withLogTitle: logTitle)
        }
    }
}
