//
//  FirebaseService.swift
//  OneYes
//
//  Created by iMac Pro on 4/3/23.
//

import Foundation
import FirebaseFirestore

enum FirebaseError: Error {
    case firebaseError(Error)
    case unableToDecode
    case noDataFound
}

struct FirebaseService {
    
    //MARK: - PROPERTIES
    let ref = Firestore.firestore()
    let deviceCollectionType = Constants.Firebase.deviceCollectionType
    
    //MARK: - CRUD FUNCTIONS
    func saveToFirestore(title: String, logs: [Log]) {
        let uuid   = UUID().uuidString
        let reason = Reason(title: title, logs: logs, reasonUUID: uuid)
        guard let deviceCollectionType else { return }
        ref.collection(deviceCollectionType).document(reason.reasonUUID).setData(reason.reasonDictionaryRepresentation)
    }
    
    func loadFromFirestore(completion: @escaping (Result<[Reason], FirebaseError>) -> Void) {
        guard let deviceCollectionType else { return }
        ref.collection(deviceCollectionType).getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.firebaseError(error)))
                return
            }
            
            guard let data = snapshot?.documents else { completion(.failure(.noDataFound)) ; return }
            let reasonDictArray = data.compactMap { $0.data() }
            let reasons = reasonDictArray.compactMap { Reason(fromReasonDictionary: $0) }
            completion(.success(reasons))
        }
    }
    
    func deleteFromFirestore(from reason: Reason) {
        guard let deviceCollectionType else { return }
        ref.collection(deviceCollectionType).document(reason.reasonUUID).delete()
    }
    
}
