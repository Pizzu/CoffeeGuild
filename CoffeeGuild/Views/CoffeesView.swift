//
//  CoffeesView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 22/3/21.
//

import SwiftUI

struct CoffeesView: View {
    
    // Global State
    @EnvironmentObject var productStore : ProductStore
    
    //Local State
    @State private var showCartAlert : Bool = false
    
    var productCategories : [String : [Product]] {
        Dictionary(grouping: productStore.products, by: {$0.category.rawValue})
    }
    
    var body: some View {
        ZStack {
            content
            
            if self.showCartAlert {
                AddToCartAlert()
                    .disabled(showCartAlert)
            }
        }
        .navigationBarTitle("Our Menu")
    }
    
    var content : some View {
        ScrollView {
            ForEach(self.productCategories.keys.sorted(by: >), id: \.self) { key in
                VStack {
                    Text(key)
                        .font(.headline)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15.0) {
                            ForEach(self.productCategories[key] ?? [], id: \.self) { product in
                                NavigationLink(destination: CardItemDetail(product: product)) {
                                    CardItem(product: product, showCartAlert: self.$showCartAlert)
                                }
                                .isDetailLink(true)
                                .accentColor(.primary)
                                .buttonStyle(NavLinkBtn())
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .padding(.bottom, 40)
                    }
                }
            }
        }
    }
}

struct CoffeesView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeesView()
            .environmentObject(ProductStore())
    }
}
