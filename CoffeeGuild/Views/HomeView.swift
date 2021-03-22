//
//  HomeView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 12/3/21.
//

import SwiftUI

struct HomeView: View {
    
    @Namespace var namespace
    
    //Global State
    @EnvironmentObject var productStore: ProductStore
    
    //Local State
    @State private var showProfileView : Bool = false
    @State private var showCartView : Bool = false
    @State private var selectedProduct : Product? = nil
    @State private var selectedTab : String = Product.ProductCategory.hotCoffee.rawValue
    
    var productCategories : [String : [Product]] {
        Dictionary(grouping: productStore.products, by: {$0.category.rawValue})
    }

    var body: some View {
        ZStack {
            content
        }
        
    }
    
    var content : some View {
            ScrollView(showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    tabItems
                }

                ScrollView(.horizontal, showsIndicators: false) {
                   cardItems
                }
                
                smallCardItems
                
                
            }
            .navigationBarTitle("Coffee Guild")
            .navigationBarItems(
                trailing: barItemsButtons
                   
            )
            
        
    }
    
    var barItemsButtons : some View {
        HStack(spacing: 8) {
            Button(action: {
                self.showProfileView = true
            }) {
                Image("Avatar1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 34, height: 34)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0.0, y: 0)
            }
            .sheet(isPresented: self.$showProfileView, content: {
               ProfileView()
            })
            
            Button(action: {
                self.showCartView = true
            }) {
                VStack {
                    Image(systemName: "bag")
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        .frame(width: 34, height: 34)
                }
                
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0.0, y: 0)
            }
            .sheet(isPresented: self.$showCartView, content: {
                CartView()
            })
        }
    }
    
    var tabItems : some View {
        HStack(spacing: 20.0) {
            ForEach(self.productCategories.keys.sorted(by: >), id: \.self) { tab in
                Text(tab)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                    .opacity(self.selectedTab == tab ? 1 : 0.6)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 16)
                    .background(
                        ZStack {
                            if selectedTab == tab {
                                Rectangle()
                                    .fill(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                                    .frame(height: 4)
                                    .clipShape(Capsule())
                                    .offset(y: 14)
                                    .matchedGeometryEffect(id: "tab", in: namespace)
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.selectedTab = tab
                        }
                    }
            }
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
    
    
    var cardItems : some View {
        HStack(spacing: 15.0) {
            ForEach(self.productCategories[self.selectedTab]!, id: \.self) { product in
                GeometryReader { geometry in
                    NavigationLink(destination: CardItemDetail(product: product)) {
                        CardItem(product: product)
                            .scaleEffect(geometry.frame(in: .global).minX < UIScreen.main.bounds.width - 175 ? 1 : 0.9 )
                            .animation(.spring(response: 0.4, dampingFraction: 0.6))
                    }
                    .isDetailLink(true)
                    .accentColor(.primary)
                    .buttonStyle(NavLinkBtn())
                    
                }
                .frame(width: 240, height: 350)
            }
        }
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 40)
    }
    
    var smallCardItems : some View {
        VStack(spacing: 25.0) {
            Text("Popular")
                .font(.title2)
                .bold()
                .foregroundColor(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 340), spacing: 16)], spacing: 16) {
                ForEach(self.productStore.products.indices, id: \.self) { index in
                    NavigationLink(destination: CardItemDetail(product: self.productStore.products[index])) {
                        CardItemSmall(product: self.productStore.products[index])
                    }
                    .isDetailLink(true)
                    .accentColor(.primary)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserStore())
            .environmentObject(ProductStore())
    }
}
