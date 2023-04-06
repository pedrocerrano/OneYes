//
//  NoDetailViewController.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class NoDetailViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var affirmationTitleLabel: UILabel!
    @IBOutlet weak var affirmationStartDateLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noDetailLogListCollectionView: UICollectionView!
    
    
    //MARK: - PROPERTIES
    var noDetailViewModel: NoDetailViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noDetailLogListCollectionView.dataSource = self
        self.noDetailLogListCollectionView.delegate   = self
        
        configureUI()
    }
    
    //MARK: - FUNCTIONS
    func configureUI() {
        guard let affirmation = noDetailViewModel.affirmation else { return }
        affirmationTitleLabel.text     = affirmation.title
        affirmationStartDateLabel.text = affirmation.startDate.stringValue()
        
        UIElements.configureButton(for: noButton)
        UIElements.configureButton(for: yesButton)
    }
    
} //: CLASS


//MARK: - EXT: CollectionView DataSource
extension NoDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noDetailLogListCell", for: indexPath) as? NoDetailLogListCollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
} //: CV DataSource


//MARK: - EXT: CollectionViewDelegateFlowLayout
extension NoDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = noDetailLogListCollectionView.frame.width
        return CGSize(width: width, height: 32)
    }
} //: CV DelegateFlowLayout
