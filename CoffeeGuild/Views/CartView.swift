//
//  CartView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 13/3/21.
//

import SwiftUI

struct CartView: View {
    
    //Global State
    @EnvironmentObject var productStore: ProductStore
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20.0) {
                    ForEach(self.productStore.products.indices, id: \.self) { index in
                        if index <= 5 {
                            CardItemSmall(product: self.productStore.products[index], showCartAlert: .constant(false))
                        } 
                    }
                }
                .padding(.horizontal)
                
            }
            .navigationBarTitle("Cart")
            .navigationBarItems(
                trailing:
                    Image(systemName: "xmark")
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            )
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ProductStore())
    }
}
