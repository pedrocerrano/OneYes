//
//  NoListViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

class NoListViewModel {
    
    //MARK: - PROPERTIES
    var affirmations: [Affirmation] = []
    var service: FirebaseService
    
    init(service: FirebaseService = FirebaseService()) {
        self.service = service
    }
    
    //MARK: - FUNCTIONS
    func loadAffirmations() {
        service.loadFromFirestore { [weak self] result in
            switch result {
            case .success(let affirmations):
                self?.affirmations = affirmations
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
