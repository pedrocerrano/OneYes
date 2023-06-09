//
//  NoListVC.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class NoListVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var noListLeadingHeaderLabel: UILabel!
    @IBOutlet weak var noListTrailingHeaderLabel: UILabel!
    @IBOutlet weak var noListCollectionView: UICollectionView!
    
    
    //MARK: - PROPERTIES
    var noListViewModel: NoListViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        noListCollectionView.dataSource = self
        noListCollectionView.delegate   = self
        noListViewModel = NoListViewModel(delegate: self)
        setupNotifications()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noListViewModel.loadReasons()
    }
    
    
    //MARK: - FUNCTIONS
    func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(newReasonCreated), name: Constants.Notifications.newReasonCreated, object: nil)
    }
    
    @objc func newReasonCreated() {
        noListViewModel.loadReasons()
    }
    
    func configureUI() {
        view.layer.cornerRadius = Constants.HomeScreenUI.cornerRadius
        noListViewModel.styleNoListLeadingHeaderLabel(for: noListLeadingHeaderLabel)
        noListViewModel.styleNoListTrailingHeaderLabel(for: noListTrailingHeaderLabel)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? NoDetailViewController else { return }
        if segue.identifier == "toDetailViewController" {
            guard let index = noListCollectionView.indexPathsForSelectedItems?.first else { print("Issue with Segue to Detail VC") ; return }
            let reason      = noListViewModel.reasons[index.item]
            destinationVC.noDetailViewModel = NoDetailViewModel(reason: reason, delegate: destinationVC.self)
        }
    }
} //: CLASS


//MARK: - EXT: CollectionView DataSource
extension NoListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noListViewModel.reasons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noListCell", for: indexPath) as? NoListCollectionViewCell else { return UICollectionViewCell() }
        
        let reason = noListViewModel.reasons[indexPath.item]
        cell.configureUI(withReason: reason)
        
        return cell
    }
} //: CV DataSource


//MARK: - EXT: CollectionViewDelegateFlowLayout
extension NoListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = noListCollectionView.frame.width
        return CGSize(width: width, height: Constants.CVCell.reasonListsCellHeight)
    }
} //: CV DelegateFlowLayout


//MARK: - NoListViewModelDelegate
extension NoListVC: NoListViewModelDelegate {
    func dataLoadedSuccessfully() {
        noListCollectionView.reloadData()
    }
} //: NoListViewModelDelegate

