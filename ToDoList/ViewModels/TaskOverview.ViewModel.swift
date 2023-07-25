//
//  TaskOverview.ViewModel.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//
import FirebaseFirestore
import Foundation
class TaskOverviewViewModel: ObservableObject
{
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String)
    {
        self.userId = userId
    }
    
    
    /// Delete task
    /// - Parameter id: item id to delete
    func delete(id: String)
    {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
