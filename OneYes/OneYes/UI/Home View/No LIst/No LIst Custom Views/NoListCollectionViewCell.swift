//
//  NoListCollectionViewCell.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class NoListCollectionViewCell: UICollectionViewCell {
    
    //MARK: - OUTLETS
    @IBOutlet weak var noListTitleLabel: UILabel!
    @IBOutlet weak var noListStartDateLabel: UILabel!
    @IBOutlet weak var noListLogCountLabel: UILabel!
    
    
    //MARK: - FUNCTIONS
    func configureUI(withAffirmation affirmation: Affirmation) {
        noListTitleLabel.text     = affirmation.title
        noListStartDateLabel.text = affirmation.startDate.stringValue()
        noListLogCountLabel.text  = "\(affirmation.logs.count)"
    }
    
}
