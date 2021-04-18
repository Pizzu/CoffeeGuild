//
//  SideBar.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 22/3/21.
//

import SwiftUI

struct SideBar: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: HomeView()) {
                    Label("Home", systemImage: "house")
                }
                NavigationLink(destination: FavoriteView()) {
                    Label("Favorites", systemImage: "heart")
                }
                
                NavigationLink(destination: ShopView()) {
                    Label("Shops", systemImage: "map")
                }
                
                NavigationLink(destination: CoffeesView()) {
                    Label("Coffees", systemImage: "book.closed")
                }
                NavigationLink(destination: SearchView()) {
                    Label("Search", systemImage: "magnifyingglass")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Sidebar")
            
            HomeView()
        }
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
            .environmentObject(UserStore())
            .environmentObject(ProductStore())
    }
}
