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
        if yesNeeded.isEmpty {
            presentEmptyTextFieldAlert()
        } else {
            needYesViewModel.saveNewReason(needYesFor: yesNeeded)
            needYesTextField.resignFirstResponder()
            needYesTextField.text?.removeAll()
        }
        return true
    }
    
    func presentEmptyTextFieldAlert() {
        let emptyTextFieldAlertController = UIAlertController(title: "Give A Reason", message: "Please write out the reason for why you need a Yes.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Will do!", style: .cancel)
        emptyTextFieldAlertController.addAction(dismissAction)
        present(emptyTextFieldAlertController, animated: true)
    }
} //: TextFieldDelegate




