//
//  HomeView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 12/3/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showDetailView : Bool = false
    @State private var showProfileView : Bool = false
    @State private var showCartView : Bool = false
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
                    HStack(spacing: 20.0) {
                        Text("Hot Coffee")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                        
                        Text("Cold Coffee")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.5647058824, blue: 0.4156862745, alpha: 1)))
                        
                        Text("Cappuccino")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.5647058824, blue: 0.4156862745, alpha: 1)))
                        
                        Text("Chocolate")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.5647058824, blue: 0.4156862745, alpha: 1)))
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15.0) {
                        ForEach(0 ..< 4) { item in
                            GeometryReader { geometry in
                                CardItem()
                                    .scaleEffect(geometry.frame(in: .global).minX < UIScreen.main.bounds.width - 175 ? 1 : 0.9 )
                                    .animation(.spring(response: 0.4, dampingFraction: 0.6))
                            }
                            .frame(width: 240, height: 350)
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
                        .foregroundColor(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 340), spacing: 16)], spacing: 16) {
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
