//
//  CardListSmall.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 24/3/21.
//

import SwiftUI

struct CardListSmall: View {
    
    var products : [Product]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 340), spacing: 16)], spacing: 16) {
            ForEach(self.products, id: \.self) { product in
                NavigationLink(destination: CardItemDetail(product: product)) {
                    CardItemSmall(product: product)
                }
                .isDetailLink(true)
                .accentColor(.primary)
            }
        }
    }
}

struct CardListSmall_Previews: PreviewProvider {
    static var previews: some View {
        CardListSmall(products: allProducts)
    }
}
