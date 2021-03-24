//
//  TabBar.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 22/3/21.
//

import SwiftUI

struct TabBar: View {
    
    @State private var selection: Tab = .home
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(Tab.home)
            
            NavigationView {
                Text("Favorites")
            }
            .tabItem {
                Image(systemName: "heart")
                Text("Favorites")
            }
            .tag(Tab.favorites)
            
            NavigationView {
                CoffeesView()
            }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Coffees")
            }
            .tag(Tab.coffees)
            
            NavigationView {
                SearchView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            .tag(Tab.search)
        }
    }
}

extension TabBar {
    enum Tab {
        case home
        case favorites
        case coffees
        case search
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(UserStore())
            .environmentObject(ProductStore())
            .environmentObject(CartStore())
    }
}
