//
//  OnboardingQuoteAndNeedViewController.swift
//  OneYes
//
//  Created by iMac Pro on 4/13/23.
//

import UIKit

class OnboardingQuoteAndNeedViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var motivationalQuoteLabel: UILabel!
    @IBOutlet weak var reasonTitleTextField: UITextField!
    
    //MARK: - PROPERTIES
    var onboardingQuoteAndNeedViewModel: OnboardingQuoteAndNeedViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        reasonTitleTextField.delegate   = self
        onboardingQuoteAndNeedViewModel = OnboardingQuoteAndNeedViewModel()
        configureQuote()
    }
    
    //MARK: - FUNCTIONS
    func configureQuote() {
        QuoteData.loadRandomQuote(for: motivationalQuoteLabel)
    }
} //: CLASS


//MARK: - TextFieldDelegate
extension OnboardingQuoteAndNeedViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let yesNeeded = reasonTitleTextField.text else { return false }
        if yesNeeded.isEmpty {
            presentEmptyTextFieldAlert()
        } else {
            onboardingQuoteAndNeedViewModel.saveNewReason(needYesFor: yesNeeded)
            reasonTitleTextField.resignFirstResponder()
            reasonTitleTextField.text?.removeAll()
        }
        return true
    }
    
    func presentEmptyTextFieldAlert() {
        let emptyTextFieldAlertController = UIAlertController(title: "Give A Reason", message: "Please write out the reason for why you need a Yes.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Will do!", style: .cancel)
        emptyTextFieldAlertController.addAction(dismissAction)
        present(emptyTextFieldAlertController, animated: true)
    }
}
