//
//  DataSource.swift
//  Grocer
//
//  Created by Evan Boerchers on 2021-06-12.
//

import Foundation
import Combine

func formatDate(date: Date) -> String {
    let df = DateFormatter()
    df.dateFormat = "MMMM-d y"
    return df.string(from: date)
}

struct GList: Identifiable {
    var id = UUID()
    var name: String
    var date = formatDate(date: Date())
    var items = [Item]()
    
    static var example = GList(name: "Safeway List")
}

class GListStore : ObservableObject {
    @Published var lists = [GList]()
}

struct Item : Identifiable {
    var id = UUID()
    var name: String
    var quantity: String
    var notes: String
    
    static var example = Item(name: "Apples", quantity: "20", notes: "")
}

func populateData(gListStore: GListStore) {
    
    var list1 = GList(name: "Safeway")
    var list2 = GList(name: "Canadian Tire Parts")
    
    list1.items.append(Item(name: "Apples", quantity: "10", notes: ""))
    list1.items.append(Item(name: "Tuna", quantity: "5 cans", notes: "" ))
    list1.items.append(Item(name: "Frosted Flakes", quantity: "1 Box", notes: ""))
    list1.items.append(Item(name: "Bananas", quantity: "", notes: ""))
    
    list2.items.append(Item(name: "M10 Screws", quantity: "20", notes: ""))
    list2.items.append(Item(name: "Socket Set", quantity: "", notes: ""))

    gListStore.lists.append(list1)
    gListStore.lists.append(list2)
    
}
