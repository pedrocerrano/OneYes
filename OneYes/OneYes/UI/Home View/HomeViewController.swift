//
//  HomeViewController.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var quoteAndNeedContainerView: UIView!
    @IBOutlet weak var noListContainerView: UIView!
    @IBOutlet weak var yesListContainerView: UIView!
    
    
    //MARK: - PROPERTIES
    var confettiView: ConfettiView?
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        createConfettiView()
        setupConfettiNotification()
    }
    
    //MARK: - FUNCTIONS
    func configureUI() {
        UIElements.configureView(for: quoteAndNeedContainerView)
        UIElements.configureView(for: noListContainerView)
        UIElements.configureView(for: yesListContainerView)
    }
    
    func createConfettiView() {
        let confettiView           = ConfettiView(frame: self.view.bounds)
        confettiView.clipsToBounds = true
        self.confettiView          = confettiView
        self.view.addSubview(confettiView)
    }
    
    func setupConfettiNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(celebrateYes), name: Constants.Notifications.celebrateYes, object: nil)
    }
    
    @objc func celebrateYes() {
        confettiView?.startAnimating()
    }
}
