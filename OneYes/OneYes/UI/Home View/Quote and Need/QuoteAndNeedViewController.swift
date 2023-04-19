//
//  QuoteAndNeedViewController.swift
//  OneYes
//
//  Created by iMac Pro on 3/29/23.
//

import UIKit

class QuoteAndNeedViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var motivationalQuoteLabel: UILabel!
    @IBOutlet weak var reasonTitleTextField: UITextField!
    
    
    //MARK: - PROPERTIES
    var quoteAndNeedViewModel: QuoteAndNeedViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        reasonTitleTextField.delegate = self
        quoteAndNeedViewModel = QuoteAndNeedViewModel()
        configureUI()
    }
    
    //MARK: - FUNCTIONS
    func configureUI() {
        view.layer.cornerRadius = Constants.HomeScreenUI.cornerRadius
        QuoteData.loadRandomQuote(for: motivationalQuoteLabel)
    }
} //: CLASS


//MARK: - TextFieldDelegate
extension QuoteAndNeedViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let yesNeeded = reasonTitleTextField.text else { return false }
        if yesNeeded.isEmpty {
            presentEmptyTextFieldAlert()
        } else {
            quoteAndNeedViewModel.saveNewReason(needYesFor: yesNeeded)
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
} //: TextFieldDelegate




