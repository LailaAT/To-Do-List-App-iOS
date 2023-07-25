//
//  CreateTaskView.ViewModel.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class CreateTaskViewViewModel: ObservableObject
{
    @Published var title = ""
    @Published var duration = 0
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init()
    {}
    
    func save()
    {
        guard canSave else
        {
            return
        }
        
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else
        {
            return
        }
        
        //create model
        let newId = UUID().uuidString
        let newTask = Task(id: newId,
                           title: title,
                           dueDate: dueDate.timeIntervalSince1970,
                           createdDate: Date().timeIntervalSince1970,
                           isDone: false
        )
        
        //save model to database -> save as a sub-collection of the current user
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newTask.asDictionary())
        
    }
    
    var canSave: Bool
    {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else
        {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else
        //ensruing date isn't older than current date
        //date is set to current day, so subtract 24 hrs (86400)
        //i.e. ensure date is greater than yesterday
        {
            return false
        }
        return true
    }
}
