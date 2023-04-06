//
//  QuoteAndNeedYesVC.swift
//  OneYes
//
//  Created by iMac Pro on 3/29/23.
//

import UIKit

class QuoteAndNeedYesVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var needYesTextField: UITextField!
    
    
    //MARK: - PROPERTIES
    var needYesViewModel: NeedYesViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        needYesTextField.delegate = self
    }
} //: CLASS


//MARK: - TextFieldDelegate
extension QuoteAndNeedYesVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let yesNeeded = needYesTextField.text else { return false }
        needYesViewModel.save(needYesFor: yesNeeded)
        needYesTextField.resignFirstResponder()
        needYesTextField.text?.removeAll()

        return true
    }
} //: TextFieldDelegate


