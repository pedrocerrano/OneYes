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
    var reason: [Reason] = []
    var service: FirebaseService
    private weak var delegate: NoListViewModelDelegate?
    
    init(service: FirebaseService = FirebaseService(), delegate: NoListViewModelDelegate) {
        self.service  = service
        self.delegate = delegate
    }
    
    //MARK: - FUNCTIONS
    func loadReasons() {
        service.loadReasonsFromFirestore { [weak self] result in
            switch result {
            case .success(let reasons):
                let sortedReasons = reasons.sorted {
                    $0.startDate > $1.startDate
                }
                
                self?.reason = sortedReasons.filter ({ reason in
                    reason.isCompleted == false
                })
                self?.delegate?.dataLoadedSuccessfully()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
