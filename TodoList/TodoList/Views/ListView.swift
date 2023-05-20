//
//  ListView.swift
//  TodoList
//
//  Created by Nick Theodoridis on 19/5/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel:  ListViewModel
    
    var body: some View {
        List{
            ForEach(listViewModel.items){ item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .navigationTitle("Today")
        .navigationBarItems(
            leading:EditButton() ,
            trailing:
                NavigationLink("Add Task",destination: AddView())
        )
        
        
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
