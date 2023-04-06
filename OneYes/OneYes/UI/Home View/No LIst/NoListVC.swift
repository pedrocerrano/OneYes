//
//  NoListVC.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class NoListVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var noListCollectionView: UICollectionView!
    @IBOutlet weak var noListTitleLabel: UILabel!
    @IBOutlet weak var noListStartDateLabel: UILabel!
    @IBOutlet weak var noListLogCountLabel: UILabel!
    
    
    //MARK: - PROPERTIES
    var noListViewModel: NoListViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        noListCollectionView.dataSource = self
        noListCollectionView.delegate   = self
        noListViewModel = NoListViewModel(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noListViewModel.loadAffirmations()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? DetailViewController else { return }
        if segue.identifier == "toDetailViewController" {
            guard let index = noListCollectionView.indexPathsForSelectedItems?.first else { print("Issue with Segue to Detail VC") ; return }
            let affirmation = noListViewModel.affirmations[index.item]
            destinationVC.detailViewModel = DetailViewModel(affirmation: affirmation)
        }
    }
} //: CLASS


//MARK: - EXT: CollectionView DataSource
extension NoListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noListViewModel.affirmations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noListCell", for: indexPath) as? NoListCollectionViewCell else { return UICollectionViewCell() }
        
        let sortedAffirmations = noListViewModel.affirmations.sorted {
            $0.startDate > $1.startDate
        }
        
        let affirmation = sortedAffirmations[indexPath.item]
        cell.configureUI(withAffirmation: affirmation)
        
        return cell
    }
} //: CV DataSource


//MARK: - EXT: CollectionViewDelegateFlowLayout
extension NoListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = noListCollectionView.frame.width
        return CGSize(width: width, height: Constants.CVCell.cellHeight)
    }
} //: CV DelegateFlowLayout


//MARK: - NoListViewModelDelegate
extension NoListVC: NoListViewModelDelegate {
    func dataLoadedSuccessfully() {
        noListCollectionView.reloadData()
    }
} //: NoListViewModelDelegate

