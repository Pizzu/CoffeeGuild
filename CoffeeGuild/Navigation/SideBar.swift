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
                    Label("Courses", systemImage: "house")
                }
                NavigationLink(destination: HomeView()) {
                    Label("Favorites", systemImage: "heart")
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
