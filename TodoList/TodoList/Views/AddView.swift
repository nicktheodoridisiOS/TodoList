//
//  AddView.swift
//  TodoList
//
//  Created by Nick Theodoridis on 19/5/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    //Task Name
    @State var taskname: String = ""
    
    //Task Description
    @State var tasknote: String = ""
    
    //Task Date
    @State var taskdeadline =  Date()
    
    
    @State var taskisActive = false
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // MARK: -CREATE TAGS FOREACH TASKS
    
    var body: some View {
        Form{
            Section(header: Text("ABOUT TASK")){
                TextField("Add name",text: $taskname)
                TextField("Add note",text: $tasknote)
                DatePicker("Due to",selection: $taskdeadline,displayedComponents: [.date])

            }
        
        
        Section(header: Text("ACTIONS")){
            Toggle("Remind Me", isOn: $taskisActive)
                .toggleStyle(SwitchToggleStyle(tint: .accentColor))
            Button("Save" , action: saveButtonPressed)
        }

    }
        
        .navigationTitle("Add Task")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    

    func saveButtonPressed(){
        if textIsApropriate(){
            listViewModel.addItem(title: taskname ,description: tasknote)
            presentationMode.wrappedValue.dismiss() //Follow the app's navigation
        }
    }
    
    func textIsApropriate () -> Bool{
        if taskname.count < 3{
            alertTitle = "Task name must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
