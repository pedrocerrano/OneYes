//
//  YesDetailViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/6/23.
//

import Foundation

struct YesDetailViewModel {
    
    //MARK: - PROPERTIES
    var reason: Reason?
    let service: FirebaseService
    
    init(reason: Reason? = nil, service: FirebaseService = FirebaseService()) {
        self.reason = reason
        self.service = service
    }
    
    //MARK: - FUNCTIONS
    func deleteReason() {
        
    }
}
