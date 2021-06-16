//
//  ItemView.swift
//  Grocer
//
//  Created by Evan Boerchers on 2021-06-14.
//

import SwiftUI

/**
 View that manages item details
 */
struct ItemView: View {
    
    /**
     Item reference
     */
    @Binding var item: Item
    
    /**
    View body that shows item details
     */
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading) {
                Text("Name").padding()
                Text("Quantity").padding()
                Text("Notes").padding()
            }
            VStack(alignment: .leading) {
                TextField("Item Name", text: self.$item.name)
                    .padding()
                    .background(Color(Theme.textField))
                    .cornerRadius(5.0)
                    
                TextField("Quantity", text: self.$item.quantity)
                    .padding()
                    .background(Color(Theme.textField))
                    .cornerRadius(5.0)
                TextField("Notes", text: self.$item.notes)
                    .padding()
                    .background(Color(Theme.textField))
                    .cornerRadius(5.0)
            }
        }.padding(.top)
        .padding(.trailing)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}


