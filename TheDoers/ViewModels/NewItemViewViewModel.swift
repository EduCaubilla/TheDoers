//
//  NewItemViewViewModel.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    init() { }
    
    func save() {
        guard canSave else {
            return
        }
        // Get current userId
        guard let uid = Auth.auth().currentUser?.uid else {
            // Alert with message as user is not found and close session
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        print(newItem);
        
        // Save model to db with userId
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("items")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
