//
//  ProfileView.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView
        {
            VStack
            {
                if let user = viewModel.user
                {
                    profile(user: user)
                } else
                {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Your Profile")
        }
        .onAppear
        {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View
    {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color("LightPastelBlue"))
            .frame(width: 125, height: 125)
            .padding()
        //Info about user: Name, Email, Memeber since
        VStack
        {
            HStack
            {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack
            {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack
            {
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        //sign out button
        Button("Log Out")
        {
            viewModel.logout()
        }
        .tint(.red)
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
