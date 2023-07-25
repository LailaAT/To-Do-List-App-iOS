//
//  CreateTaskView.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//

import SwiftUI

struct CreateTaskView: View {
    @StateObject var viewModel = CreateTaskViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack
        {
            Text("New Task")
                .font(.system(size: 32))
                .bold()
                .padding(.top)
            
            Form
            {
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Duration of task
                
                
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //button to save
                TLButton(title: "Save", backgroundColor: Color("PastelGreen"))
                {
                    if viewModel.canSave
                    {
                        viewModel.save()
                        newItemPresented = false
                    } else
                    {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert)
            {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select a due date for today or past that")
                    )
            }
        }
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView(newItemPresented: Binding(get:
                                                    {
            return true
        }, set:
                                                    {
            _ in
        }))
    }
}
