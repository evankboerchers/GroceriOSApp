//
//  ListView.swift
//  Grocer
//
//  Created by Evan Boerchers on 2021-06-14.
//

import SwiftUI
import Combine

/**
 View that manages a specific lists items
 */
struct ListView: View {
    
    /**
     The list reference
     */
    @Binding var gList: GList
    
    /**
     Moves list item index
     */
    func moveItem(from source: IndexSet, to destination: Int) {
        self.gList.items.move(fromOffsets: source, toOffset: destination)
    }
    
    /**
     Removes list item from list
     */
    func deleteItem(at offsets: IndexSet) {
        self.gList.items.remove(atOffsets: offsets)
    }
    
    /**
     Adds generic item to list
     */
    func addItem() {
        self.gList.items.append(Item(name: "New Item", quantity: "", notes: ""))
    }
    
    /**
     View body showing list items and navbar tools
     */
    var body: some View {
        VStack {
            List {
                ForEach(self.gList.items.indices, id: \.self) {
                    index in
                    NavigationLink(destination: ItemView(item: self.$gList.items[index])){
                        HStack{
                            VStack{
                                Text(self.gList.items[index].name)
                            }
                            VStack {
                                Text(self.gList.items[index].quantity).fontWeight(.light)
                                    .foregroundColor(Color(Theme.textSecondary))
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                        }
                    }
                }.onMove(perform: self.moveItem)
                .onDelete(perform: self.deleteItem)
            }
        }.navigationTitle(self.gList.name)
        .navigationBarItems(trailing: HStack {
            Button(action: self.addItem
            ) {
                Text("New").foregroundColor(Color(Theme.toolbarButton))
            }
            EditButton().foregroundColor(Color(Theme.toolbarButton))
        })
    }
}

