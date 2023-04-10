//
//  NoDetailViewController.swift
//  OneYes
//
//  Created by iMac Pro on 4/4/23.
//

import UIKit

class NoDetailViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var reasonStartDateLabel: UILabel!
    @IBOutlet weak var reasonTitleLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noLogCountLabel: UILabel!
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
    
    //MARK: - IB ACTIONS
    @IBAction func noButtonTapped(_ sender: Any) {
        presentNoAlertController()
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        presentYesAlertController()
    }
    
    @IBAction func deleteReasonButtonTapped(_ sender: Any) {
        
    }
    
    
    //MARK: - FUNCTIONS
    func configureUI() {
        guard let reason = noDetailViewModel.reason else { return }
        reasonTitleLabel.text     = reason.title
        reasonStartDateLabel.text = reason.startDate.stringValue()
        noLogCountLabel.text      = "(\(reason.logs.count))"
        
        UIElements.configureButton(for: noButton)
        UIElements.configureButton(for: yesButton)
    }
    
    func presentNoAlertController() {
        let noAlertController = UIAlertController(title: "NO, really?!?",
                                                  message: "Why? What could you have done differently? Leave a note for yourself.",
                                                  preferredStyle: .alert)
        noAlertController.addTextField { textField in
            textField.placeholder = "Optional Note..."
        }
        
        let dismissAction     = UIAlertAction(title: "Cancel", style: .cancel)
        let confirmNoAction   = UIAlertAction(title: "Really.", style: .default) { _ in
            guard let textField = noAlertController.textFields?.first else { return }
            self.noDetailViewModel.saveNewLog(logTitle: textField.text ?? "Quick No")
        }
        
        noAlertController.addAction(dismissAction)
        noAlertController.addAction(confirmNoAction)
        present(noAlertController, animated: true)
    }
    
    func presentYesAlertController() {
        let yesAlertController = UIAlertController(title: "YES, really?!",
                                                   message: .none,
                                                   preferredStyle: .alert)
        let dismissAction      = UIAlertAction(title: "Cancel", style: .cancel)
        let confirmYesAction   = UIAlertAction(title: "REALLY!", style: .default) { _ in
            #warning("YES ALERT: Configure Yes button to toggle isCompleted and to add a completedDate")
            print("Yes Button Confirmed")
        }
        
        yesAlertController.addAction(dismissAction)
        yesAlertController.addAction(confirmYesAction)
        present(yesAlertController, animated: true)
    }
    
} //: CLASS


//MARK: - EXT: CollectionView DataSource
extension NoDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noDetailViewModel.reason?.logs.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noDetailLogListCell", for: indexPath) as? NoDetailLogListCollectionViewCell else { return UICollectionViewCell() }
        
        if let log = noDetailViewModel.reason?.logs[indexPath.item] {
            cell.configureUI(withLog: log)
        }
        
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
