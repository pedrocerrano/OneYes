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
    
    //MARK: - FUNCTIONS
    func configureUI() {
        UIElements.configureView(for: QOTDContainerView)
        UIElements.configureView(for: noListContainerView)
        UIElements.configureView(for: yesListContainerView)
    }
}
