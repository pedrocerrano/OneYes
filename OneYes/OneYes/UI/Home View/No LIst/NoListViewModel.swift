//
//  NoListViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

protocol NoListViewModelDelegate: AnyObject {
    func dataLoadedSuccessfully()
}

class NoListViewModel {
    
    //MARK: - PROPERTIES
    var affirmations: [Affirmation] = []
    var service: FirebaseService
    private weak var delegate: NoListViewModelDelegate?
    
    init(service: FirebaseService = FirebaseService(), delegate: NoListViewModelDelegate) {
        self.service  = service
        self.delegate = delegate
    }
    
    //MARK: - FUNCTIONS
    func loadAffirmations() {
        service.loadFromFirestore { [weak self] result in
            switch result {
            case .success(let affirmations):
                let sortedAffirmations = affirmations.sorted {
                    $0.startDate > $1.startDate
                }
                
                self?.affirmations = sortedAffirmations.filter ({ affirmation in
                    affirmation.isCompleted == false
                })
                self?.delegate?.dataLoadedSuccessfully()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
