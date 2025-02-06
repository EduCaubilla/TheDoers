//
//  ItemViewViewModel.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ItemViewViewModel : ObservableObject {
    
    func toggleIsDone(item: ListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("items")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
