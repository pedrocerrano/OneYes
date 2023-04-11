//
//  DetailViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

protocol NoDetailViewModelDelegate: AnyObject {
    func reasonSuccessfullyUpdated()
}

class NoDetailViewModel {
    
    //MARK: - PROPERTIES
    var reason: Reason?
    let service: FirebaseService
    private weak var delegate: NoDetailViewModelDelegate?
    
    init(reason: Reason? = nil, service: FirebaseService = FirebaseService(), delegate: NoDetailViewModelDelegate) {
        self.reason   = reason
        self.service  = service
        self.delegate = delegate
    }
    
    
    //MARK: - FUNCTIONS
    func saveNewLog(logTitle: String) {
        if let reason = reason {
            service.saveNewLogToFirestore(forReason: reason, withLogTitle: logTitle)
        }
    }
    
    func updateReasonToYes() {
        if let reason = reason {
            reason.isCompleted = true
            service.updateReasonWithYes(forReason: reason) {
                self.delegate?.reasonSuccessfullyUpdated()
            }
        }
    }
}
