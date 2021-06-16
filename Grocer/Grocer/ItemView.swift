//
//  ItemView.swift
//  Grocer
//
//  Created by Evan Boerchers on 2021-06-14.
//

import SwiftUI


struct ItemView: View {
    
    @State var item: Item
    
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

struct ItemView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView{
            ItemView(item: Item.example)
        }
        
    }
}
