//
//  TLButton.swift
//  ToDoList
//
//  Created by dani prayogi on 27/08/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            Text(title)
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(background)
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Title", background: .green){
            // Action
        }
    }
}
