//
//  LoginView.swift
//  ToDoList
//
//  Created by dani prayogi on 26/08/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var pwd = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done",
                    angle: 15,
                    background: .blue)
                
                Form{
                    TextField("Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $pwd)
                        .textFieldStyle(DefaultTextFieldStyle())

                    Button{

                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)

                            Text("Login")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    .padding()
                }
                .offset(y: -50)

                VStack {
                    Text("New around here?")
                    NavigationLink("Creating An Acccount", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
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
