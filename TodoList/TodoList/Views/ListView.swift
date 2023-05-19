//
//  ListView.swift
//  TodoList
//
//  Created by Nick Theodoridis on 19/5/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first item", isCompleted: false),
        ItemModel(title: "This is the second item", isCompleted: true),
        ItemModel(title: "This is the third item", isCompleted: false)
    ]
    
    var body: some View {
        List{
            ForEach(items){ item in
                //ListRowView(title: item)
                ListRowView(item: item)
            }
        }
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading:EditButton() ,
            trailing:
                NavigationLink("Add",destination: AddView())
        )
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        
    }
}
