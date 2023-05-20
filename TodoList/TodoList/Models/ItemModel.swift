//
//  ItemModel.swift
//  TodoList
//
//  Created by Nick Theodoridis on 19/5/23.
//

import Foundation

struct ItemModel: Identifiable{
    let id:String
    let title: String
    let description: String
    let isCompleted: Bool
    
    init(id:String = UUID().uuidString ,title: String, description: String, isCompleted: Bool) {
        self.id  = UUID().uuidString
        self.title =  title
        self.description = description
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id:id,title: title, description: description, isCompleted: !isCompleted)
    }
}
