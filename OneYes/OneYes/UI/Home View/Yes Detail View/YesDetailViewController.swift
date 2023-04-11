//
//  YesDetailViewController.swift
//  OneYes
//
//  Created by iMac Pro on 4/6/23.
//

import UIKit

class YesDetailViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var completedButton: UIButton!
    @IBOutlet weak var noLogCountLabel: UILabel!
    @IBOutlet weak var completedCollectionView: UICollectionView!
    
    
    //MARK: - PROPERTIES
    var yesDetailViewModel: YesDetailViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.completedCollectionView.dataSource = self
        self.completedCollectionView.delegate   = self

        configureUI()
    }
    
    //MARK: - IB ACTIONS
    
    
    
    //MARK: - FUNCTIONS
    func configureUI() {
        UIElements.configureButton(for: completedButton)
    }
    
} //: CLASS


//MARK: - EXT: CollectionView DataSource
extension YesDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yesDetailViewModel.reason?.logs.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yesDetailLogListCell", for: indexPath) as? YesDetailLogListCollectionViewCell else { return UICollectionViewCell() }
        
        let sortedLogs = yesDetailViewModel.reason?.logs.sorted {
            $0.logDate > $1.logDate
        }
        
        if let log = sortedLogs?[indexPath.item] {
            cell.configureUI(withLog: log)
        }
        
        return cell
    }
} //: CV DataSource


//MARK: - EXT: CollectionViewDelegateFlowLayout
extension YesDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = completedCollectionView.frame.width
        return CGSize(width: width, height: Constants.CVCell.noLogListCellHeight)
    }
} //: CV DelegateFlowLayout
