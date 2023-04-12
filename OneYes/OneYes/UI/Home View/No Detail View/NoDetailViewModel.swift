//
//  DetailViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

protocol NoDetailViewModelDelegate: AnyObject {
    func newLogCreated()
    func reasonSuccessfullyHandled()
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
            service.saveNewLogToFirestore(forReason: reason, withLogTitle: logTitle) {
                self.delegate?.newLogCreated()
            }
        }
    }
    
    func reloadLogs() {
        if let reason = reason {
            service.reloadLogsFromFirestore(forReason: reason) { result in
                switch result {
                case .success(let reason):
                    self.reason = reason
                    self.delegate?.newLogCreated()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func updateReasonToYes() {
        if let reason = reason {
            reason.isCompleted = true
            service.updateReasonWithYes(forReason: reason) {
                self.delegate?.reasonSuccessfullyHandled()
            }
        }
    }
    
    func deleteReason() {
        if let reason = reason {
            service.deleteFromFirestore(from: reason) {
                self.delegate?.reasonSuccessfullyHandled()
            }
        }
    }
}
