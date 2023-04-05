//
//  DetailViewController.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - OUTLETS
    
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var logListCollectionView: UICollectionView!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logListCollectionView.dataSource = self
        self.logListCollectionView.delegate   = self
        
        configureButtonUI()
    }
    
    //MARK: - FUNCTIONS
    func configureButtonUI() {
        let noHeight                 = noButton.frame.height
        noButton.layer.cornerRadius  = noHeight/2
        noButton.layer.shadowColor   = Constants.DetailButtonUI.shadowColor
        noButton.layer.shadowOpacity = Constants.DetailButtonUI.shadowOpacity
        noButton.layer.shadowRadius  = Constants.DetailButtonUI.shadowRadius
        noButton.layer.shadowOffset  = Constants.DetailButtonUI.shadowOffset
        noButton.layer.masksToBounds = Constants.DetailButtonUI.masksToBounds
        
        let yesHeight                 = yesButton.frame.height
        yesButton.layer.cornerRadius  = yesHeight/2
        yesButton.layer.shadowColor   = Constants.DetailButtonUI.shadowColor
        yesButton.layer.shadowOpacity = Constants.DetailButtonUI.shadowOpacity
        yesButton.layer.shadowRadius  = Constants.DetailButtonUI.shadowRadius
        yesButton.layer.shadowOffset  = Constants.DetailButtonUI.shadowOffset
        yesButton.layer.masksToBounds = Constants.DetailButtonUI.masksToBounds
    }
    
} //: CLASS



//MARK: - EXT: CollectionView DataSource
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "logListCell", for: indexPath) as? LogListCollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
} //: CV DataSource


//MARK: - EXT: CollectionViewDelegateFlowLayout
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = logListCollectionView.frame.width
        return CGSize(width: width, height: 32)
    }
} //: CV DelegateFlowLayout
