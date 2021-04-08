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
    
    private func fetchFavorites() {
        self.productStore.fetchFavoriteProducts()
    }
    
    var body: some View {
        VStack {
            ForEach(self.productStore.favoriteProducts) { item in
                Text(item.title)
            }
        }
        .onAppear(perform: fetchFavorites)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(ProductStore())
    }
}
