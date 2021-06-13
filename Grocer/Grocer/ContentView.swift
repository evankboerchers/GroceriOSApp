//
//  ContentView.swift
//  Grocer
//
//  Created by Evan Boerchers on 2021-06-10.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var gListStore = GListStore()
    
    @State private var showingModal = false
    
    @State var newListName : String  = ""
    
    func addNewList() {
        gListStore.lists.append(GList(id: String(gListStore.lists.count + 1), name: newListName))
        showingModal = false
    }
    
    var modal: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                Text("New List").padding()
                TextField("Enter List Name", text: self.$newListName).padding()
                HStack{
                    Button(action: self.addNewList
                    ) {
                        Text("Create")
                    }.padding()
                    Button(action: {
                        self.showingModal = false
                    }) {
                        Text("Close")
                    }.padding()
                }
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(20).shadow(radius:20)
        }
        
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    List(self.gListStore.lists) { list in Text(list.name)
                    }
                }
                if $showingModal.wrappedValue {
                    modal
                }
                
            }
            .navigationBarTitle("My Lists")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showingModal = true
                    }) {
                        Text("New")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

