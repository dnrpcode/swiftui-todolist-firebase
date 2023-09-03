//
//  NewItemView.swift
//  ToDoList
//
//  Created by dani prayogi on 26/08/23.
//

import SwiftUI

struct UpdateTodoItemView: View {
    @StateObject var viewModel: UpdateTodoViewViewModel
    @Binding var newItemPresented: Bool
    
    init(newItemPresented: Binding<Bool>, selectedItem: ToDoListItem?) {
        _newItemPresented = newItemPresented
        self._viewModel = StateObject(wrappedValue: UpdateTodoViewViewModel(data: selectedItem))
    }
    
    var body: some View {
        VStack{
            Text(viewModel.titleHeader)
                .font(.system(size: 32))
                .bold()
                .padding(.top, 20)
            
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: .blue){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }.padding()
                
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all field and select due date that is today or newer.")
                )
            }
        }
    }
}

struct UpdateTodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyItem = ToDoListItem(id: "12345678", title: "halo", dueDate: 12345678, createdDate: 12345678, isDone: false)
        let newItemPresented = Binding.constant(false)
        
        return UpdateTodoItemView(
            newItemPresented: newItemPresented,
            selectedItem: dummyItem
        )
    }
}

