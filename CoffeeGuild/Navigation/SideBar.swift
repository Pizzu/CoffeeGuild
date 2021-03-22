//
//  SideBar.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 22/3/21.
//

import SwiftUI

struct SideBar: View {
    
    @State private var selection: Tab? = .home
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: HomeView(), tag: Tab.home, selection: $selection) {
                    Label("Courses", systemImage: "house")
                }
                NavigationLink(destination: HomeView(), tag: Tab.favorites, selection: $selection) {
                    Label("Favorites", systemImage: "heart")
                }
                NavigationLink(destination: CoffeesView(), tag: Tab.coffees, selection: $selection) {
                    Label("Coffees", systemImage: "book.closed")
                }
                NavigationLink(destination: HomeView(), tag: Tab.search, selection: $selection) {
                    Label("Search", systemImage: "magnifyingglass")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Sidebar")
            
            HomeView()
        }
    }
}

extension SideBar {
    enum Tab {
        case home
        case favorites
        case coffees
        case search
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
            .environmentObject(UserStore())
            .environmentObject(ProductStore())
    }
}
