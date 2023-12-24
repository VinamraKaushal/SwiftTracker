//
//  SwiftTrackerItemViewViewModel.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// view model for a single to do list (view each row in items list)
class SwiftTrackerItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: SwiftTrackerItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(itemCopy.id).setData(itemCopy.asDictionary())
    }
}
