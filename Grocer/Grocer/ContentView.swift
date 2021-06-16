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
    
    @State private var showingNewModal = false
    
    @State var newListName : String  = ""
    
    init() {
        populateData(gListStore: gListStore)
        Theme.navigationBarColors()
    }
    
    func addNewList() {
        gListStore.lists.append(GList(name: newListName))
        showingNewModal = false
    }
    
    func moveList(from source: IndexSet, to destination: Int) {
        gListStore.lists.move(fromOffsets: source, toOffset: destination)
    }
    
    func deleteList(at offsets: IndexSet) {
        gListStore.lists.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                List {
                    ForEach(self.gListStore.lists) {
                        list in
                        NavigationLink(destination: ListView(gList: list)){
                            VStack{
                                Text(list.name)
                            }
                            VStack {
                                Text(list.date).fontWeight(.light)
                                    .foregroundColor(Color(Theme.textSecondary))
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                        }
                    }.onMove(perform: self.moveList)
                    .onDelete(perform: self.deleteList)
                  
                }.listStyle(GroupedListStyle())
                if $showingNewModal.wrappedValue {
                    newModal
                }
            }
            .navigationBarTitle("My Lists")
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    self.showingNewModal = true
                }) {
                    Text("New").foregroundColor(Color(Theme.toolbarButton))
                }
                EditButton().foregroundColor(Color(Theme.toolbarButton))
            })
        }
    }
    
    var newModal: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("New List").padding()
                    .font(.title2)
                TextField("Enter List Name", text: self.$newListName).padding()
                HStack{
                    Button(action: self.addNewList
                    ) {
                        Text("Create")
                    }.padding()
                    Button(action: {
                        self.showingNewModal = false
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

