//
//  ListViewModel.swift
//  TodoList
//
//  Created by Nick Theodoridis on 20/5/23.
//

//CRUD FUNC
//CREATE
//READ
//UPDATE
//DELETE

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "This is the first item",description: "This is a desc", isCompleted: false),
            ItemModel(title: "This is the second item",description: "This is a desc", isCompleted: true),
            ItemModel(title: "This is the third item", description: "This is a desc",isCompleted: false)
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from:IndexSet ,to: Int){
        items.move(fromOffsets: from, toOffset: to)
        
    }
    
    func addItem(title: String , description:String){
        let newItem = ItemModel(title: title,description: description, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
            
        }
        
    }
}
