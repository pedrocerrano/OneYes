//
//  NeedYesViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

protocol NeedYesViewModelDelegate: AnyObject {
    func newNeedYesCreated()
}

struct NeedYesViewModel {
    
    //MARK: - PROPERTIES
    var affirmation: Affirmation?
    let service: FirebaseService
    private weak var delegate: NeedYesViewModelDelegate?
    
    init(affirmation: Affirmation? = nil, service: FirebaseService = FirebaseService(), delegate: NeedYesViewModelDelegate) {
        self.affirmation = affirmation
        self.service     = service
        self.delegate    = delegate
    }
    
    //MARK: - FUNCTIONS
    func save(needYesFor affirmationTitle: String, logs: [Log] = []) {
        service.saveToFirestore(title: affirmationTitle, logs: logs)
        delegate?.newNeedYesCreated()
    }
}
