//
//  YesDetailViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/6/23.
//

import Foundation

protocol YesDetailViewModelDelegate: AnyObject {
    func reasonSuccessfullyDeleted()
}

class YesDetailViewModel {
    
    //MARK: - PROPERTIES
    var reason: Reason?
    let service: FirebaseService
    private weak var delegate: YesDetailViewModelDelegate?
    
    init(reason: Reason? = nil, service: FirebaseService = FirebaseService(), delegate: YesDetailViewModelDelegate) {
        self.reason   = reason
        self.service  = service
        self.delegate = delegate
    }
    
    //MARK: - FUNCTIONS
    func deleteReason() {
        if let reason = reason {
            service.deleteFromFirestore(from: reason) {
                self.delegate?.reasonSuccessfullyDeleted()
            }
        }
    }
}
