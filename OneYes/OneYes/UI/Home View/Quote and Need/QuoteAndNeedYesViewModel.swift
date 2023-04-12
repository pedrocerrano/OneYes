//
//  NeedYesViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

struct QuoteAndNeedYesViewModel {
    
    //MARK: - PROPERTIES
    var reason: Reason?
    let service: FirebaseService
        
    init(reason: Reason? = nil, service: FirebaseService = FirebaseService()) {
        self.reason   = reason
        self.service  = service
    }
    
    //MARK: - FUNCTIONS
    func saveNewReason(needYesFor reasonTitle: String, logs: [Log] = []) {
        service.saveNewReasonToFirestore(title: reasonTitle, logs: logs) {
            NotificationCenter.default.post(name: Constants.Notifications.newReasonCreated, object: nil)
        }
    }
}
