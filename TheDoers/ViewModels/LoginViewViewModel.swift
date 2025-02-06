//
//  LoginViewViewModel.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        guard validate() else{
            return
        }
        
        //Log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        //Check email and password are filled and correct
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            
            errorMessage = "Plase fill in all fields"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Enter valid email"
            return false
        }
        
        return true
    }
}
