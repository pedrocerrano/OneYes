//
//  NeedYesViewModel.swift
//  OneYes
//
//  Created by iMac Pro on 4/5/23.
//

import UIKit

struct QuoteAndNeedYesViewModel {
    
    //MARK: - PROPERTIES
    var reason: Reason?
    let service: FirebaseService
    var quotesData: [Quote] = QuoteDataService.load("quotesData.json")
        
    init(reason: Reason? = nil, service: FirebaseService = FirebaseService()) {
        self.reason   = reason
        self.service  = service
    }
    
    //MARK: - FUNCTIONS
    func saveNewReason(needYesFor reasonTitle: String, logs: [Log] = []) {
        service.saveNewReasonToFirestore(title: reasonTitle, logs: logs) {
            NotificationCenter.default.post(name: Constants.Notifications.newReasonCreated, object: nil)
        }
    }
    
    func loadRandomQuote(with quoteString: UILabel) {
        let index = Int.random(in: 0..<quotesData.count)
        let quote = quotesData[index].quote
        let author = quotesData[index].author
        quoteString.text = "\"\(quote)\" -\(author)"
        quoteString.attributedText = NSMutableAttributedString()
            .italics("\"\(quote)\"")
            .bold(" -\(author)") 
    }
}
