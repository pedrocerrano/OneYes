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
    
    
    //MARK: - CRUD FUNCTIONS
    func saveToFirestore(title: String, logs: [Log]) {
        let uuid = UUID().uuidString
        let affirmation = Affirmation(title: title, logs: logs, affirmationUUID: uuid)
        guard let deviceCollectionType = Affirmation.deviceCollectionType else { return }
        ref.collection(deviceCollectionType).document(affirmation.affirmationUUID).setData(affirmation.affirmationDictionaryRepresentation)
    }
    
    func loadFromFirestore(completion: @escaping (Result<[Affirmation], FirebaseError>) -> Void) {
        ref.collection(Affirmation.AffirmationKey.collectionType).getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.firebaseError(error)))
                return
            }
            
            guard let data = snapshot?.documents else { completion(.failure(.noDataFound)) ; return }
            let affirmationDictArray = data.compactMap { $0.data() }
            let affirmations = affirmationDictArray.compactMap { Affirmation(fromAffirmationDictionary: $0) }
            completion(.success(affirmations))
        }
    }
    
    func deleteFromFirestore(from affirmation: Affirmation) {
        ref.collection(Affirmation.AffirmationKey.collectionType).document(affirmation.affirmationUUID).delete()
    }
    
}
