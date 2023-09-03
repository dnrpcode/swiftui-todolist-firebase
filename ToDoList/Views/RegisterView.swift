//
//  RegisterView.swift
//  ToDoList
//
//  Created by dani prayogi on 26/08/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "lock.shield")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                TextField("Fullname", text: $viewModel.name)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                
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

                TLButton(title: "Register", background: .blue) {
                    viewModel.register()
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Text("Already have an account?")
                    NavigationLink("Login", destination: LoginView())
                }
                
            }
            .padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
