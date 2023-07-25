//
//  CreateAccountView.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//

import SwiftUI

struct CreateAccountView: View {
    @State var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack
        {
            //Header
            LoginViewHeader(title: "Register", subttitle: "Start organizing your to do's!", angle: -15, backgroundColor: Color("PastelGreen"))
            
            Form
            {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Register Now", backgroundColor: Color("LightPastelBlue"))
                {
                    //attempt to register new account
                    viewModel.register()
                }
            }
            .cornerRadius(30)
            .frame(width: 370, height: 260)
            .padding(.bottom, 80)
            .padding(.horizontal, 20)
            .offset(y: -50)
            
            Spacer()
        }
    }
    
    struct CreateAccountView_Previews: PreviewProvider {
        static var previews: some View {
            CreateAccountView()
        }
    }
}
