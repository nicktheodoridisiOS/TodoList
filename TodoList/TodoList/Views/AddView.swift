//
//  AddView.swift
//  TodoList
//
//  Created by Nick Theodoridis on 19/5/23.
//

import SwiftUI

struct AddView: View {
    @State var taskname: String = ""
    @State var tasknote: String = ""
    @State var taskdeadline =  Date()
    @State var taskisActive = false
    var body: some View {
        Form{
            Section(header: Text("ABOUT TASK")){
                TextField("Add name",text: $taskname)
                TextField("Add note",text: $tasknote)
                DatePicker("Due to",selection: $taskdeadline,displayedComponents: .date)
            }
            
            Section(header: Text("ACTIONS")){
                Toggle("Remind Me", isOn: $taskisActive)
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
            }
            
            Button(action: {
                
            }, label:  {
                Text("Save")
                    
            })
        }
        .navigationTitle("Add Task")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
