//
//  DetailViewController.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var affirmationTitleLabel: UILabel!
    @IBOutlet weak var affirmationStartDateLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var logListCollectionView: UICollectionView!
    
    
    //MARK: - PROPERTIES
    var detailViewModel: DetailViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logListCollectionView.dataSource = self
        self.logListCollectionView.delegate   = self
        
        configureUI()
    }
    
    //MARK: - FUNCTIONS
    func configureUI() {
        guard let affirmation = detailViewModel.affirmation else { return }
        affirmationTitleLabel.text     = affirmation.title
        affirmationStartDateLabel.text = affirmation.startDate.stringValue()
        
        UIElements.configureButton(for: noButton)
        UIElements.configureButton(for: yesButton)
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
