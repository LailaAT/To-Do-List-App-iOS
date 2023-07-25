//
//  SingleTaskView.ViewModel.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
/// ViewModel for single to do list item view (one row in items list)

class SingleTaskViewViewModel: ObservableObject
{
    init() {}
    
    func toggleIsDone(item: Task)
    {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else
        {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }

}
