//
//  ItemModel.swift
//  TodoList
//
//  Created by Nick Theodoridis on 19/5/23.
//

import Foundation

struct ItemModel: Identifiable{
    let id:String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
