//
//  ListView.swift
//  Grocer
//
//  Created by Evan Boerchers on 2021-06-14.
//

import SwiftUI
import Combine


struct ListView: View {
    
    @State var gList: GList
    
    func moveItem(from source: IndexSet, to destination: Int) {
        gList.items.move(fromOffsets: source, toOffset: destination)
    }
    
    func deleteItem(at offsets: IndexSet) {
        gList.items.remove(atOffsets: offsets)
    }
    
    func addItem() {
        gList.items.append(Item(name: "New Item", quantity: "", notes: ""))
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(self.gList.items) {
                    item in
                    NavigationLink(destination: ItemView(item: item)){
                        HStack{
                            VStack{
                                Text(item.name)
                            }
                            VStack {
                                Text(item.quantity).fontWeight(.light)
                                    .foregroundColor(Color(Theme.textSecondary))
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                        }
                    }
                }.onMove(perform: self.moveItem)
                .onDelete(perform: self.deleteItem)
            }
        }.navigationTitle(gList.name)
        .navigationBarItems(trailing: HStack {
            Button(action: self.addItem
            ) {
                Text("New").foregroundColor(Color(Theme.toolbarButton))
            }
            EditButton().foregroundColor(Color(Theme.toolbarButton))
        })
    }
}

struct ListView_Previews: PreviewProvider {
    
    static var example = GList(name: "Safeway List")
    
    static var previews: some View {
        NavigationView {
            ListView(gList: example)
        }
    }
}
