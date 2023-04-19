//
//  YesDetailViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/6/23.
//

import UIKit

protocol YesDetailViewModelDelegate: AnyObject {
    func reasonSuccessfullyDeleted()
}

class YesDetailViewModel {
    
    //MARK: - PROPERTIES
    var reason: Reason?
    let service: FirebaseService
    private weak var delegate: YesDetailViewModelDelegate?
    
    init(reason: Reason? = nil, service: FirebaseService = FirebaseService(), delegate: YesDetailViewModelDelegate) {
        self.reason   = reason
        self.service  = service
        self.delegate = delegate
    }
    
    //MARK: - FUNCTIONS
    func deleteReason() {
        if let reason = reason {
            service.deleteFromFirestore(from: reason) {
                self.service.loadReasonsFromFirestore { result in
                    switch result {
                    case .success(let reasons):
                        if reasons.isEmpty {
                            Navigation.noReasonsAvailable()
                        } else {
                            self.delegate?.reasonSuccessfullyDeleted()
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    
    func styleFirstNoReceivedLabel(for label: UILabel) {
        label.attributedText = NSMutableAttributedString()
            .completedDatesNormal("First ")
            .completedDatesNormalRed("NO")
            .completedDatesNormal(" received on")
    }
    
    func styleYesReceivedLabel(for label: UILabel) {
        label.attributedText = NSMutableAttributedString()
            .completedDatesNormalGreen("YES")
            .completedDatesNormal(" received on")
    }
    
    func styleYesReceivedDateLabel(for label: UILabel) {
        guard let yesReceivedDate = reason?.completedDate?.stringValue() else { return }
        label.attributedText = NSMutableAttributedString()
            .completedDatesNormalGreen("\(yesReceivedDate)")
    }
    
    func styleNoLogCountLabel(for label: UILabel) {
        guard let noLogCount = reason?.logs.count else { return }
        label.attributedText = NSMutableAttributedString()
            .detailNoLogCountBoldRed("NO")
            .detailNoLogCountBold(" log ")
            .detailNoLogCountBold("(\(noLogCount))")
    }
}
