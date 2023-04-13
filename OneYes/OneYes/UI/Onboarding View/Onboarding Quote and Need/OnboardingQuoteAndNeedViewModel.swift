//
//  OnboardingQuoteAndNeedViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/13/23.
//

import UIKit

struct OnboardingQuoteAndNeedViewModel {
    
    //MARK: - PROPERTIES
    let service: FirebaseService
    
        
    init(service: FirebaseService = FirebaseService()) {
        self.service              = service
    }
    
    
    //MARK: - FUNCTIONS
    func saveNewReason(needYesFor reasonTitle: String, logs: [Log] = []) {
        service.saveNewReasonToFirestore(title: reasonTitle, logs: logs) {
            Navigation.reasonsAvailable()
        }
    }
}
