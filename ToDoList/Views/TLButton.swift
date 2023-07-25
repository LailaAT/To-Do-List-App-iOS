//
//  TLButton.swift
//  ToDoList
//
//  Created by Laila Tantavy on 04/07/2023.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    var body: some View {
        Button
        {
            //Action
            action()
        } label:
        {
            ZStack
            {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                    .frame(width: 320, height: 35)
                    .padding(.top, 5)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}


struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Log In", backgroundColor: Color("LightPastelBlue")) {
            //action
        }
    }
}
