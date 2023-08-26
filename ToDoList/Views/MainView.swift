//
//  ContentView.swift
//  ToDoList
//
//  Created by dani prayogi on 26/08/23.
//

import SwiftUI


struct MainView: View {
    var body: some View {
        NavigationView{
            LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
