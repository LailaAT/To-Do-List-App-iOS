//
//  LoginView.ViewModel.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//
import FirebaseAuth
import Foundation
class LoginViewViewModel: ObservableObject
{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = "" 
    
    init()
    {}
    
    func login()
    {
       guard validate() else
        {
           return
       }
        //Trying to login
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool
    {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else
        {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        //email@foo.com -> email structure
        guard email.contains("@") && email.contains(".") else
        {
            errorMessage = "Please enter valid email"
            return false
        }
        return true
    }
}
