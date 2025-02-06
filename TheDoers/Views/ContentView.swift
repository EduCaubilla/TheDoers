//
//  ContentView.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //Signed In
            accountView()
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    func accountView() -> some View {
        TabView{
            ItemListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label( "Home", systemImage: "house.circle" )
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
