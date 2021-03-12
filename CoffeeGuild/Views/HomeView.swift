//
//  HomeView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 12/3/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showDetailView : Bool = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
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
                    HStack(spacing: 32.0) {
                        ForEach(0 ..< 3) { item in
                            CardItem()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                }
                
                VStack(spacing: 25.0) {
                    Text("Popular")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(#colorLiteral(red: 0.6588235294, green: 0.3568627451, blue: 0.2352941176, alpha: 1)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 240), spacing: 16)], spacing: 16) {
                        ForEach(0 ..< 6) { item in
                            CardItemSmall()
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
            .navigationBarTitle("Coffee Guild")
            .navigationBarItems(
                trailing:
                    HStack(spacing: 8) {
                        Button(action: {}) {
                            Image("Avatar1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 34, height: 34)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 0)
                        }
                        
                        Button(action: {}) {
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
                    }
            )
        
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
                content
            }
            .tabItem {
                Image(systemName: "heart")
                Text("Favorites")
            }
            
            NavigationView {
                content
            }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Coffees")
            }
            
            NavigationView {
                content
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
    }
}
