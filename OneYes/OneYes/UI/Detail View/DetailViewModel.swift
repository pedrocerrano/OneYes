//
//  DetailViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import Foundation

struct DetailViewModel {
    
    //MARK: - PROPERTIES
    var affirmation: Affirmation?
    
    init(affirmation: Affirmation? = nil) {
        self.affirmation = affirmation
    }
}
