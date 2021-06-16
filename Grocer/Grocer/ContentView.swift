//
//  ContentView.swift
//  Grocer
//
//  Created by Evan Boerchers on 2021-06-10.
//

import SwiftUI
import Combine

/**
 Main view, manages user lists
 */
struct ContentView: View {
    
    /**
     Main datastore object for all lists
     */
    @ObservedObject var gListStore = GListStore()
    
    /**
     Toggles popup
     */
    @State private var showingNewModal = false
    
    /**
     New list name state
     */
    @State var newListName : String  = ""
    
    init() {
        populateData(gListStore: gListStore)
        Theme.navigationBarColors()
    }
    
    /**
     Appends new list to store object
     */
    func addNewList() {
        gListStore.lists.append(GList(name: newListName))
        showingNewModal = false
    }
    
    /**
     Moves list index within store object
     */
    func moveList(from source: IndexSet, to destination: Int) {
        gListStore.lists.move(fromOffsets: source, toOffset: destination)
    }
    
    /**
     Deletes list from store object
     */
    func deleteList(at offsets: IndexSet) {
        gListStore.lists.remove(atOffsets: offsets)
    }
    
    /**
     View body, shows all lists and navbar tools
     */
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(self.gListStore.lists.indices, id: \.self) {
                        index in
                        NavigationLink(destination: ListView(gList: self.$gListStore.lists[index])){
                            VStack{
                                Text(self.gListStore.lists[index].name)
                            }
                            VStack {
                                Text(self.gListStore.lists[index].date).fontWeight(.light)
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
    
    /**
     Popup form for creating new list. Present when showModal = True
     */
    var newModal: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("New List").padding()
                    .font(.title2)
                VStack{
                    TextField("Enter List Name", text: self.$newListName)
                        .padding(15)
                        .background(Color(Theme.textField))
                        .cornerRadius(5.0)
                }.padding(.leading)
                .padding(.trailing)
                HStack{
                    Button(action: self.addNewList
                    ) {
                        Text("Create")
                    }.padding()
                    Button(action: {
                        self.showingNewModal = false
                        self.newListName = ""
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

/**
 Content preview
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

