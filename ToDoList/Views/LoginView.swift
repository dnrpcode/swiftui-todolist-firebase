//
//  LoginView.swift
//  ToDoList
//
//  Created by dani prayogi on 26/08/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "lock.shield")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                TextField("Username", text:$viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                TLButton(title: "Login", background: .blue) {
                    viewModel.login()
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Creating An Acccount", destination: RegisterView())
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
