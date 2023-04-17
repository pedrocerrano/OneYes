//
//  OnboardingViewController.swift
//  OneYes
//
//  Created by iMac Pro on 4/13/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var onboardingQuoteAndNeedContainerView: UIView!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    //MARK: - FUNCTIONS
    func configureUI() {
        view.layer.cornerRadius = Constants.HomeScreenUI.cornerRadius
        UIElements.configureView(for: onboardingQuoteAndNeedContainerView)
    }

}
