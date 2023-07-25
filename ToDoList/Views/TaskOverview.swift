//
//  TaskOverview.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TaskOverview: View {
    @StateObject var viewModel: TaskOverviewViewModel
    @FirestoreQuery var items: [Task]
    
    private let userId: String
    init(userId: String)
    {
        self.userId = userId
        //users/<id>/todos/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(
            wrappedValue: TaskOverviewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView
        {
            VStack
            {
                List(items)
                { item in
                    SingleTaskView(item: item)
                        .swipeActions
                        {
                            Button("Delete")
                            {
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Tasks to Do!")
            .toolbar
            {
                Button
                {
                    //Action
                    viewModel.showingNewItemView = true
                } label:
                {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView)
            {
                CreateTaskView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct TaskOverview_Previews: PreviewProvider {
    static var previews: some View {
        TaskOverview(userId: "KOUEhHInQpQuReQLNTKNwRp8FR93")
    }
}
