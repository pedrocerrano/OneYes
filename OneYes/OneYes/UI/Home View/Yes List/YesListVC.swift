//
//  YesListVC.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class YesListVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var yesListCollectionView: UICollectionView!
    @IBOutlet weak var yesListHeaderLabel: UILabel!
    
    
    //MARK: - PROPERTIES
    var yesListViewModel: YesListViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.yesListCollectionView.dataSource = self
        self.yesListCollectionView.delegate   = self
        yesListViewModel = YesListViewModel(delegate: self)
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        yesListViewModel.loadYesReasons()
    }
    
    //MARK: - FUNCTIONS
    func configureUI() {
        yesListViewModel.styleYesListHeaderLabel(for: yesListHeaderLabel)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? YesDetailViewController else { return }
        if segue.identifier == "toYesDetailViewController" {
            guard let index = yesListCollectionView.indexPathsForSelectedItems?.first else { print("Issue with Segue to YesDetailViewController") ; return }
            let completedReason = yesListViewModel.reasons[index.item]
            destinationVC.yesDetailViewModel = YesDetailViewModel(reason: completedReason, delegate: destinationVC.self)
        }
    }
} //: CLASS


//MARK: - EXT: CollectionView DataSource
extension YesListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yesListViewModel.reasons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yesListCell", for: indexPath) as? YesListCollectionViewCell else { return UICollectionViewCell() }
        
        let reason = yesListViewModel.reasons[indexPath.item]
        cell.configureUI(withReason: reason)
        
        return cell
    }
} //: CV DataSource


//MARK: - EXT: CollectionViewDelegateFlowLayout
extension YesListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = yesListCollectionView.frame.width
        return CGSize(width: width, height: Constants.CVCell.reasonListsCellHeight)
    }
} //: CV DelegateFlowLayout


//MARK: - EXT: YesListViewModelDelegate
extension YesListVC: YesListViewModelDelegate {
    func reasonsSuccessfullyLoaded() {
        yesListCollectionView.reloadData()
    }
}
