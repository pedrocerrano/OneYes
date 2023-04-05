//
//  HomeViewController.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var QOTDContainerView: UIView!
    @IBOutlet weak var noListContainerView: UIView!
    @IBOutlet weak var yesListContainerView: UIView!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    
    func configureUI() {
        QOTDContainerView.layer.cornerRadius  = Constants.HomeScreenUI.cornerRadius
        QOTDContainerView.layer.shadowColor   = Constants.HomeScreenUI.shadowColor
        QOTDContainerView.layer.shadowOpacity = Constants.HomeScreenUI.shadowOpacity
        QOTDContainerView.layer.shadowRadius  = Constants.HomeScreenUI.shadowRadius
        QOTDContainerView.layer.shadowOffset  = Constants.HomeScreenUI.shadowOffset
        QOTDContainerView.layer.masksToBounds = Constants.HomeScreenUI.masksToBounds
        
        noListContainerView.layer.cornerRadius  = Constants.HomeScreenUI.cornerRadius
        noListContainerView.layer.shadowColor   = Constants.HomeScreenUI.shadowColor
        noListContainerView.layer.shadowOpacity = Constants.HomeScreenUI.shadowOpacity
        noListContainerView.layer.shadowRadius  = Constants.HomeScreenUI.shadowRadius
        noListContainerView.layer.shadowOffset  = Constants.HomeScreenUI.shadowOffset
        noListContainerView.layer.masksToBounds = Constants.HomeScreenUI.masksToBounds
        
        yesListContainerView.layer.cornerRadius  = Constants.HomeScreenUI.cornerRadius
        yesListContainerView.layer.shadowColor   = Constants.HomeScreenUI.shadowColor
        yesListContainerView.layer.shadowOpacity = Constants.HomeScreenUI.shadowOpacity
        yesListContainerView.layer.shadowRadius  = Constants.HomeScreenUI.shadowRadius
        yesListContainerView.layer.shadowOffset  = Constants.HomeScreenUI.shadowOffset
        yesListContainerView.layer.masksToBounds = Constants.HomeScreenUI.masksToBounds
    }
}
