//
//  FavoriteView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 8/4/21.
//

import SwiftUI

struct FavoriteView: View {
    
    //Global State
    @EnvironmentObject var productStore : ProductStore
    @EnvironmentObject var cartStore: CartStore
    
    var body: some View {
        ZStack {
            content
                .disabled(self.cartStore.showCartAlert)
            
            if self.cartStore.showCartAlert {
                AddToCartAlert()
            }
        }
        .onDisappear {
            self.productStore.detachListener()
        }
        
       
    }
    
    var content : some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                ForEach(self.productStore.favoriteProducts, id: \.self) { product in
                    FavoriteItem(product: product)
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("Favorites")
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(ProductStore())
            .environmentObject(CartStore())
    }
}
