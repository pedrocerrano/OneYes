//
//  YesListViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

protocol YesListViewModelDelegate: AnyObject {
    func reasonsSuccessfullyLoaded()
}

class YesListViewModel {
    
    //MARK: - PROPERTIES
    var reasons: [Reason] = []
    var service: FirebaseService
    private weak var delegate: YesListViewModelDelegate?
    
    init(service: FirebaseService = FirebaseService(), delegate: YesListViewModelDelegate) {
        self.service  = service
        self.delegate = delegate
    }
    
    
    //MARK: - FUNCTIONS
    func loadYesReasons() {
        service.loadReasonsFromFirestore { [weak self] result in
            switch result {
            case .success(let yesReasons):
                if yesReasons.isEmpty {
                    Navigation.noReasonsAvailable()
                } else {
                    let filteredYesReasons = yesReasons.filter { yesReasons in
                        yesReasons.isCompleted == true
                    }
                    
                    self?.reasons = filteredYesReasons.sorted {
                        $0.completedDate ?? Date() > $1.completedDate ?? Date()
                    }
                    
                    self?.delegate?.reasonsSuccessfullyLoaded()
                }
            case .failure(_):
                Navigation.noReasonsAvailable()
            }
        }
    }
}
