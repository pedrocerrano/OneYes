//
//  NoDetailLogListCollectionViewCell.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class NoDetailLogListCollectionViewCell: UICollectionViewCell {
    
    //MARK: - OUTLETS
    @IBOutlet weak var noLogTitleLabel: UILabel!
    @IBOutlet weak var noLogDateLabel: UILabel!
      
    
    //MARK: - FUNCTIONS
    func configureUI(withLog log: Log) {
        noLogTitleLabel.text = log.logTitle
        noLogDateLabel.text  = log.logDate.stringValue()
    }
    
}
