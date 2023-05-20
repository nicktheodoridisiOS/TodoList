//
//  ListRowView.swift
//  TodoList
//
//  Created by Nick Theodoridis on 19/5/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item:ItemModel
    
    var body: some View {
        HStack(spacing: 15){
            if(item.isCompleted){
                activeCircleSymbol()
                VStack(alignment: .leading){
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(item.description)
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                }
                
            }
            else{
                inactiveCircleSymbol()
                VStack(alignment: .leading){
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    Text(item.description)
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                
                        
            }
           
            Spacer()
            Image(systemName: "info.circle")
                .foregroundColor(.accentColor)
                .padding()
                            
        }
    }
}

struct activeCircleSymbol: View{
    var body: some View{
        ZStack{
            Circle()
                .stroke(Color.accentColor,style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .miter))
                .frame(width: 20, height: 20)
            
            Circle()
                .foregroundColor(.accentColor)
                .frame(width: 16, height: 16)
        }
        
    }
}

struct inactiveCircleSymbol: View{
    var body: some View{
        Circle()
            .stroke(Color.accentColor,style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .miter))
            .frame(width: 20, height: 20)

    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1  = ItemModel(title: "First Item", description: "This is a desc", isCompleted: false)
    static var item2  = ItemModel(title: "Second Item", description: "This is a desc", isCompleted: true)
    
    

    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
