//
//  LoginView.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import SwiftUI

struct LoginView: View {

    @State var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title: "The Doers", 
                           subtitle: "Your things to do",
                           angle: -10,
                           background: .teal)

                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                // Login form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .frame(height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .frame(height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
                    TDButton(title: "Log in") {
                        viewModel.login()
                    }
                    .offset(y:10)
                }
                .scrollContentBackground(.hidden)
                .lineSpacing(15)
                .padding(.trailing, 10)
                
                //Create account
                VStack{
                    Text("Join the doers")
                        .foregroundStyle(.gray)
                        .fontWeight(.bold)
                    
                    NavigationLink("Create account", destination: RegisterView())
                }
                .frame(width: UIScreen.main.bounds.width + 10, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    LoginView()
}
