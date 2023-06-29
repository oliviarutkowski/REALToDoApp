//
//  ContentView.swift
//  REALToDoApp
//
//  Created by Scholar on 6/27/23.
//
//I have a big error that I can't figure out how to fix :(
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    var toDoItems: FetchedResults<ToDo>
    @State private var showNewTask = false
    var body: some View {
        VStack{
            
            
            HStack{
                
                Text("To Do List!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Button(action:   {
                    self.showNewTask = true
                }) {
                    Text("+")
                }
                
                
            }
            Spacer()
             
            List {
                ForEach (toDoItems) { toDoItem in
                    if toDoItem.isImportant == true {
                        Text("‼️" + (toDoItem.title ?? "No title"))
                    } else {
                                        Text(toDoItem.title ?? "No title")
                    }
                    
                    }
                }
       
            }
        
            .listStyle(.plain)
            
        if showNewTask {
           NewToDo(showNewTask: $showNewTask, title: "", isImportant: false)
     
        }
            
        }
   
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
           ContentView()
           // ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }


