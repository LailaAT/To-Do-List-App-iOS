//
//  MainView.ViewModel.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//
import FirebaseAuth
import Foundation
class MainViewViewModel: ObservableObject
{
    @Published var currentUserId: String = ""
    //whenever the user signs in or signs out this published will be triggered
    //this updates the view
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init()
    {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async
            {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool
    {
        return Auth.auth().currentUser != nil
    }
}
