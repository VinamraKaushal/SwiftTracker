//
//  SwiftTrackerViewViewModel.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import FirebaseFirestore
import Foundation

///ViewModel for list of items view
///primary tab
class SwiftTrackerViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    ///delete to do list item
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
