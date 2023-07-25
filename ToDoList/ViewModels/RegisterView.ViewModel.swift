//
//  CreateAccountView.ViewModel.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation
class RegisterViewViewModel: ObservableObject
{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register()
    {
        guard validate() else
        {
            return
        }
        
        //creating user after validating
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else
            {
                return
            }
            
            self?.insertUserRecord(id: userId) //passing on id to method to insert a new record for newly created user
        }
    }
    
    private func insertUserRecord(id: String) //inserts a user record in the database
    {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool
    {
        //ensuring none of the fields are empty
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else
        {
            return false
        }
         
        //ensuring proper email format is entered
        guard email.contains("@") && email.contains(".") else
        {
            return false
        }
        
        //ensuring password length is at least 6 (for strength & security)
        guard password.count >= 6 else
        {
            return false
        }
        return true
    }
}
