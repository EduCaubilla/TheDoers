//
//  ProfileView.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    setProfile(user: user)
                } else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func setProfile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(
                .linearGradient(colors: [.blue,.teal], startPoint: .top, endPoint: .bottom))
            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.vertical, 25)
        
        // User info: Name, Email
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(.top, 10)
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(.top, 10)
            HStack{
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(.top, 10)
        }
        .padding()
        
        //Sign out
        Button{
            viewModel.logOut()
        } label: {
            Text("Log out")
                .fontWeight(.light)
                .frame(width: 250, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundStyle(.red)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.red, lineWidth: 1)
                )
        }
        .offset(y: 50)
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
