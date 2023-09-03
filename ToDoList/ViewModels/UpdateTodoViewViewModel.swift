//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by dani prayogi on 26/08/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class UpdateTodoViewViewModel: ObservableObject {
    @Published var titleHeader = "Add Todo"
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var newId = UUID().uuidString
    @Published var createdDate = Date().timeIntervalSince1970
    
    init(data: ToDoListItem?) {
        if let data = data {
            self.titleHeader = "Edit Todo"
            self.newId = data.id
            self.title = data.title
            self.dueDate = Date(timeIntervalSince1970: data.dueDate)
            self.createdDate = data.createdDate
        }
    }
    
    func save(){
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: createdDate,
            isDone: false)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-864000) else {
            return false
        }
        
        return true
    }
}
