//
//  ItemListViewViewModel.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ItemListViewViewModel : ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId : String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete list item
    ///  - Parameter id: Item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("items")
            .document(id)
            .delete()
    }
}
