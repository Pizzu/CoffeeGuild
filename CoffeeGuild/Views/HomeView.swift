//
//  HomeView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 12/3/21.
//

import SwiftUI

var tabs = ["Hot Coffee", "Cold Coffee", "Cappuccino", "Chocolate"]

struct HomeView: View {
    
    //Global State
    @EnvironmentObject var productStore: ProductStore
    
    //Local State
    @State private var showDetailView : Bool = false
    @State private var showProfileView : Bool = false
    @State private var showCartView : Bool = false
    @State var selectedTab = tabs[0]
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Namespace var namespace
    
    
    var body: some View {
        ZStack {
            if horizontalSizeClass == .compact {
                tabBar
            } else {
                sideBar
            }
            fullContent
                .background(VisualEffectBlur(blurStyle: .systemMaterial).ignoresSafeArea())
        }
        
    }
    
    var content : some View {
            ScrollView {
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
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 0)
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
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 0)
            }
            .sheet(isPresented: self.$showCartView, content: {
                CartView()
            })
        }
    }
    
    var tabItems : some View {
        HStack(spacing: 20.0) {
            ForEach(tabs, id: \.self) { tab in
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
            ForEach(self.productStore.products.indices, id: \.self) { index in
                GeometryReader { geometry in
                    CardItem(product: self.productStore.products[index])
                        .scaleEffect(geometry.frame(in: .global).minX < UIScreen.main.bounds.width - 175 ? 1 : 0.9 )
                        .animation(.spring(response: 0.4, dampingFraction: 0.6))
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                self.showDetailView = true
                            }
                    }
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
                    CardItemSmall(product: self.productStore.products[index])
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                self.showDetailView = true
                            }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    var fullContent : some View {
        if self.showDetailView  {
            ZStack(alignment: .topLeading) {
                CardItemDetail()
                
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .padding()
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            self.showDetailView = false
                        }
                    }
            }
            .transition(.move(edge: .trailing))
            .zIndex(1)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
        }
    }
    
    var tabBar : some View {
        TabView {
            NavigationView {
                content
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView {
                Text("Favorites")
            }
            .tabItem {
                Image(systemName: "heart")
                Text("Favorites")
            }
            
            NavigationView {
                Text("Coffees")
            }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Coffees")
            }
            
            NavigationView {
                Text("Search")
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
        .accentColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
    }
    
    var sideBar : some View {
        NavigationView {
            List {
                NavigationLink(destination: content) {
                    Label("Courses", systemImage: "house")
                }
                NavigationLink(destination: content) {
                    Label("Favorites", systemImage: "heart")
                }
                Label("Coffees", systemImage: "book.closed")
                Label("Search", systemImage: "magnifyingglass")
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Sidebar")
            .accentColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
            
            content
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserStore())
            .environmentObject(ProductStore())
    }
}
