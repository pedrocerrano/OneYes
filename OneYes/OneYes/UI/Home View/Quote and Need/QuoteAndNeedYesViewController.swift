//
//  QuoteAndNeedYesVC.swift
//  OneYes
//
//  Created by iMac Pro on 3/29/23.
//

import UIKit

class QuoteAndNeedYesViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var needYesTextField: UITextField!
    @IBOutlet weak var dailyQuoteLabel: UILabel!
    
    
    //MARK: - PROPERTIES
    var needYesViewModel: QuoteAndNeedYesViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        needYesTextField.delegate = self
        needYesViewModel = QuoteAndNeedYesViewModel()
        configureQuote()
    }
    
    //MARK: - FUNCTIONS
    func configureQuote() {
        needYesViewModel.loadRandomQuote(with: dailyQuoteLabel)
    }
} //: CLASS


//MARK: - TextFieldDelegate
extension QuoteAndNeedYesViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let yesNeeded = needYesTextField.text else { return false }
        needYesViewModel.saveNewReason(needYesFor: yesNeeded)
        needYesTextField.resignFirstResponder()
        needYesTextField.text?.removeAll()
        return true
    }
} //: TextFieldDelegate



