//
//  QuoteAndNeedViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

struct QuoteAndNeedViewModel {
    
    //MARK: - PROPERTIES
    let service: FirebaseService
        
    init(service: FirebaseService = FirebaseService()) {
        self.service  = service
    }
    
    
    //MARK: - FUNCTIONS
    func saveNewReason(needYesFor reasonTitle: String, logs: [Log] = []) {
        service.saveNewReasonToFirestore(title: reasonTitle, logs: logs) {
            NotificationCenter.default.post(name: Constants.Notifications.newReasonCreated, object: nil)
        }
    }
}
