//
//  SearchView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 22/3/21.
//

import SwiftUI
import SwiftUIX

struct SearchView: View {
    
    //Global State
    @EnvironmentObject var productStore: ProductStore
    
    //State
    @State private var searchField : String = ""
    
    var filteredProducts : [Product]  {
        self.productStore.products.filter { product in
            if searchField != "" {
                return product.title.contains(searchField)
            }
            return true
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 340), spacing: 16)], spacing: 16) {
                ForEach(self.filteredProducts, id: \.self) { product in
                    NavigationLink(destination: CardItemDetail(product: product)) {
                        CardItemSmall(product: product)
                    }
                    .isDetailLink(true)
                    .accentColor(.primary)
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("Search Products")
        .navigationSearchBar {
            SearchBar("Search...", text: $searchField)
                .onCancel {
                    if self.filteredProducts.isEmpty {
                        self.searchField = ""
                    }
                }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ProductStore())
    }
}
