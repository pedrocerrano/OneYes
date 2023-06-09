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
    @IBOutlet weak var noCountCircleLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var finallyLabel: UILabel!
    @IBOutlet weak var noLogTitleLabel: UILabel!
    @IBOutlet weak var noLogCountLabel: UILabel!
    @IBOutlet weak var noDetailLogListCollectionView: UICollectionView!
    
    
    //MARK: - PROPERTIES
    var noDetailViewModel: NoDetailViewModel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.noButton.layer.cornerRadius = noButton.frame.height / 2
        self.yesButton.layer.cornerRadius = yesButton.frame.height / 2
    }
    
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
        presentDeleteReasonAlertController()
    }
    
    
    //MARK: - FUNCTIONS
    func configureUI() {
        guard let reason = noDetailViewModel.reason else { return }
        reasonStartDateLabel.text = reason.startDate.stringValue()
        reasonTitleLabel.text     = reason.title
        configureLogCountUI()
        
        UIElements.configureCircleLabel(for: noCountCircleLabel, withColor: .label)
        noCountCircleLabel.textColor = .systemBackground
        
        UIElements.configureButton(for: noButton, withColor: UIElements.Colors.oneYesRed)
        UIElements.configureButton(for: yesButton, withColor: UIElements.Colors.oneYesGreen)
        noDetailViewModel.styleFinallyLabel(for: finallyLabel)
        noDetailViewModel.styleNoDetailLogTitleLabel(for: noLogTitleLabel)
    }
    
    func configureLogCountUI() {
        guard let reason = noDetailViewModel.reason else { return }
        noCountCircleLabel.text = "\(reason.logs.count)"
        noLogCountLabel.attributedText = NSMutableAttributedString()
            .detailNoLogCountBold("(\(reason.logs.count))")
    }
    
    func presentNoAlertController() {
        let noAlertController = UIAlertController(title: "NO, really?!?",
                                                  message: "Why? What could you have done differently? Leave a note for yourself.",
                                                  preferredStyle: .alert)
        noAlertController.addTextField { textField in
            textField.placeholder = "Optional Note..."
            textField.autocapitalizationType = .sentences
        }
        
        let dismissAction     = UIAlertAction(title: "Cancel", style: .cancel)
        let confirmNoAction   = UIAlertAction(title: "Really.", style: .default) { _ in
            guard let textField = noAlertController.textFields?.first,
                  let unwrappedTextField = textField.text else { print("Could not handle TextField optionals") ; return }
            if unwrappedTextField.isEmpty {
                self.noDetailViewModel.saveNewLog(logTitle: "Quick No")
            } else {
                self.noDetailViewModel.saveNewLog(logTitle: textField.text ?? "Unable to save Log Title")
            }
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
            self.noDetailViewModel.updateReasonToYes()
        }
        
        yesAlertController.addAction(dismissAction)
        yesAlertController.addAction(confirmYesAction)
        present(yesAlertController, animated: true)
    }
    
    func presentDeleteReasonAlertController() {
        let deleteReasonAlertController = UIAlertController(title: "Delete",
                                                            message: "Are you sure? This cannot be undone.",
                                                            preferredStyle: .alert)
        
        let dismissAction     = UIAlertAction(title: "Cancel", style: .cancel)
        let confirmNoAction   = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.noDetailViewModel.deleteReason()
        }
        
        deleteReasonAlertController.addAction(dismissAction)
        deleteReasonAlertController.addAction(confirmNoAction)
        present(deleteReasonAlertController, animated: true)
    }
    
} //: CLASS


//MARK: - EXT: CollectionView DataSource
extension NoDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noDetailViewModel.reason?.logs.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noDetailLogListCell", for: indexPath) as? NoDetailLogListCollectionViewCell else { return UICollectionViewCell() }
        
        let sortedLogs = noDetailViewModel.reason?.logs.sorted {
            $0.logDate > $1.logDate
        }
        
        if let log = sortedLogs?[indexPath.item] {
            cell.configureUI(withLog: log)
        }
        
        return cell
    }
} //: CV DataSource


//MARK: - EXT: CollectionView Delegate Flow Layout
extension NoDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = noDetailLogListCollectionView.frame.width
        return CGSize(width: width, height: Constants.CVCell.noLogListCellHeight)
    }
} //: CV DelegateFlowLayout


//MARK: - EXT: NoDetailViewModelDelegate
extension NoDetailViewController: NoDetailViewModelDelegate {
    func newLogCreated() {
        self.noDetailViewModel.reloadLogs()
        self.noDetailLogListCollectionView.reloadData()
        self.configureLogCountUI()
    }
    
    func reasonSuccessfullyHandled() {
        self.navigationController?.popViewController(animated: true)
    }
}
