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
    @EnvironmentObject var cartStore : CartStore
    
    //State
    @State private var searchField : String = ""
    @State private var isEditing : Bool = false

    var filteredProducts : [Product]  {
        self.productStore.products.filter { product in
            if searchField != "" {
                return product.title.contains(searchField)
            }
            return true
        }
    }
    
    var body: some View {
        ZStack {
            content
                .disabled(cartStore.showCartAlert)
            
            if self.cartStore.showCartAlert {
                AddToCartAlert()
            }
        }
    }
    
    
    var content : some View {
        ScrollView {
            SearchBar("Search...", text: $searchField, isEditing: $isEditing)
                .showsCancelButton(isEditing)
                .onCancel {
                    if self.filteredProducts.isEmpty {
                        self.searchField = ""
                    }
                }
                .padding(.horizontal)
            
            CardListSmall(products: self.filteredProducts)
                .padding(.horizontal)
        }
        .navigationBarTitle("Search Products")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ProductStore())
            .environmentObject(CartStore())
    }
}
