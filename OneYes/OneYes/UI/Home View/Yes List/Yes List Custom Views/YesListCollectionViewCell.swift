//
//  YesListCollectionViewCell.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class YesListCollectionViewCell: UICollectionViewCell {
    
    //MARK: - OUTLETS
    @IBOutlet weak var yesListReasonLabel: UILabel!
    @IBOutlet weak var yesCompletedDateLabel: UILabel!
    @IBOutlet weak var yesListNoLogCountLabel: UILabel!

    
    //MARK: - FUNCTIONS
    func configureUI(withReason reason: Reason) {
        yesListReasonLabel.text = reason.title
        yesCompletedDateLabel.text = reason.completedDate?.stringValue()
        yesListNoLogCountLabel.text = "\(reason.logs.count)"
    }
}
