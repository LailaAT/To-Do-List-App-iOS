//
//  LoginViewHeader.swift
//  ToDoList
//
//  Created by Laila Tantavy on 20/06/2023.
//

import SwiftUI

struct LoginViewHeader: View {
    let title: String //tasks to do
    let subttitle: String//do it, check it, earn it
    let angle: Double //rotation angle
    let backgroundColor: Color
    
    var body: some View {
        ZStack
        {
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 500)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack
            {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subttitle)
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    .bold()
            }
            .padding(.top, 90)
        }
        .frame(width: UIScreen.main.bounds.width,
               height: 350)
        .offset(y: -150)
    }
}

struct LoginViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewHeader(title:"title", subttitle: "subtitle", angle: 15, backgroundColor: Color("LightPurple"))
    }
}
