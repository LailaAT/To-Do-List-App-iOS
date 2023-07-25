//
//  LoginView.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView
        {
            VStack
            {
                //Header
                LoginViewHeader(
                    title: "Tasks to do",
                    subttitle: "Do it, check it, earn it",
                    angle: 15,
                    backgroundColor: Color("LightPurple"))
                
                //Login form
            
                Form
                {
                    if !viewModel.errorMessage.isEmpty
                    {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Log In", backgroundColor: Color("LightPastelBlue"))
                    {
                        //attempt to login
                        viewModel.login() //calling method from viewModel object of class LoginViewViewModel
                    }
                }
                .cornerRadius(30)
                .frame(width: 360, height: 219)
                .padding(.bottom, 60)
                .padding(.horizontal, 20)
                .offset(y: -50)
                
                //create account button
                VStack
                {
                    Text("First time using the app?")
                    NavigationLink("Create a new Account", destination: CreateAccountView())
                    .padding(.bottom, 20)
                    .padding(.top, 10)
                }
                .offset(y:-40)
                Spacer()
        }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
