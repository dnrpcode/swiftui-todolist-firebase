//
//  RegisterView.swift
//  ToDoList
//
//  Created by dani prayogi on 26/08/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start Organizing todos", angle: -15, background: .pink)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
