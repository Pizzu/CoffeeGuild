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
    @State private var showCartAlert : Bool = false

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
                .disabled(showCartAlert)
            
            if self.showCartAlert {
                AddToCartAlert()
            }
        }
    }
    
    
    var content : some View {
        ScrollView {
            CardListSmall(products: self.filteredProducts, showCartAlert: self.$showCartAlert)
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
