//
//  NeedYesViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

protocol NeedYesViewModelDelegate: AnyObject {
    func newlyCreatedReason()
}

struct NeedYesViewModel {
    
    //MARK: - PROPERTIES
    var reason: Reason?
    let service: FirebaseService
    private weak var delegate: NeedYesViewModelDelegate?
        
    init(reason: Reason? = nil, service: FirebaseService = FirebaseService(), delegate: NeedYesViewModelDelegate) {
        self.reason   = reason
        self.service  = service
        self.delegate = delegate
    }
    
    //MARK: - FUNCTIONS
    func saveNewReason(needYesFor reasonTitle: String, logs: [Log] = []) {
        service.saveNewReasonToFirestore(title: reasonTitle, logs: logs)
        delegate?.newlyCreatedReason()
    }
}
