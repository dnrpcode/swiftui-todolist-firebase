//
//  ToDoListView.swift
//  ToDoList
//
//  Created by dani prayogi on 26/08/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                            Button("Edit") {
                                viewModel.selectedItem = item
                                viewModel.showingNewItemView = true
                            }
                            .tint(.blue)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, onDismiss: {
                viewModel.selectedItem = nil
            }) {
                UpdateTodoItemView(
                    newItemPresented: $viewModel.showingNewItemView,
                    selectedItem: viewModel.selectedItem
                )
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "JMv4RKW2hxMXNEGCqNF5B2XQUtJ3")
    }
}
