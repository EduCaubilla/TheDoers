//
//  ItemListView.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import FirebaseFirestore
import SwiftUI

struct ItemListView: View {
    
    @StateObject var viewModel : ItemListViewViewModel
    @FirestoreQuery var items: [ListItem]
    
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/items"
        )
        self._viewModel = StateObject(wrappedValue: ItemListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                                }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("Doers List")
            .toolbar{
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.linearGradient(colors: [.blue, .teal], startPoint: .top, endPoint: .bottom))
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented:
                                $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ItemListView(userId: "5c7JDhSAhaRjspONCj6Taq1t3T03")
}
