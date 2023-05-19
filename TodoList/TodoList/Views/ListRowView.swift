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
        HStack{
            if(item.isCompleted){
                activeCircleSymbol()
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            else{
                    inActiveCircleSymbol()
                    Text(item.title)
                        .font(.headline)
                        
            }
           
            Spacer()
                            
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

struct inActiveCircleSymbol: View{
    var body: some View{
        Circle()
            .stroke(Color.accentColor,style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .miter))
            .frame(width: 20, height: 20)

    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1  = ItemModel(title: "First Item", isCompleted: false)
    static var item2  = ItemModel(title: "Second Item", isCompleted: true)
    
    

    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
