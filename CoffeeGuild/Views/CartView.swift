//
//  CartView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 13/3/21.
//

import SwiftUI

struct CartView: View {
    
    //Global State
    @EnvironmentObject var cartStore: CartStore
    
    var cartDict : [String : [Product]] {
        Dictionary(grouping: cartStore.cart, by: {$0.id})
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(self.cartDict.keys.sorted(), id: \.self) { key in
                        if let products = self.cartDict[key] {
                            if products.count > 0 {
                                CartItem(product: products.first!, numberOfItems: products.count)
                            }
                        }
                    }
                }
                .listStyle(InsetListStyle())
                .navigationBarTitle("Cart")
                .navigationBarItems(
                    trailing:
                        Text("\(self.cartStore.totalPrice)")
            )
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartStore())
    }
}
