//
//  NeedYesViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

struct NeedYesViewModel {
    
    //MARK: - PROPERTIES
    var affirmation: Affirmation?
    let service: FirebaseService
    
    init(affirmation: Affirmation? = nil, service: FirebaseService = FirebaseService()) {
        self.affirmation = affirmation
        self.service     = service
    }
    
    //MARK: - FUNCTIONS
    func save(needYesFor affirmationTitle: String, logs: [Log] = []) {
        service.saveToFirestore(title: affirmationTitle, logs: logs)
    }
}
