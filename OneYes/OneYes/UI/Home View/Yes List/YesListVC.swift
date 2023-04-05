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

    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.yesListCollectionView.dataSource = self
        self.yesListCollectionView.delegate   = self

    }
    

    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
} //: CLASS


//MARK: - EXT: CollectionView DataSource
extension YesListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yesListCell", for: indexPath) as? YesListCollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
} //: CV DataSource


//MARK: - EXT: CollectionViewDelegateFlowLayout
extension YesListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = yesListCollectionView.frame.width
        return CGSize(width: width, height: Constants.CVCell.cellHeight)
    }
} //: CV DelegateFlowLayout
