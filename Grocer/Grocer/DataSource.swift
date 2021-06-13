//
//  DataSource.swift
//  Grocer
//
//  Created by Evan Boerchers on 2021-06-12.
//

import Foundation
import Combine

struct GList : Identifiable {
    var id: String
    var name: String
}

class GListStore : ObservableObject {
    @Published var lists = [GList]()
}

struct GItemStore : Identifiable {
    var id: String
}
