//
//  SingleTaskView.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//

import SwiftUI

struct SingleTaskView: View {
    let item: Task
    @StateObject var viewModel = SingleTaskViewViewModel()
    
    var body: some View {
        HStack
        {
            VStack(alignment: .leading)
            {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button
            {
                viewModel.toggleIsDone(item: item)
            } label:
            {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color("LightPurple"))
            }
        }
    }
}

struct SingleTaskView_Previews: PreviewProvider {
    static var previews: some View {
        SingleTaskView(item: .init(id: "123",
                                   title: "finish project",
                                   dueDate: Date().timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: true))
    }
}
