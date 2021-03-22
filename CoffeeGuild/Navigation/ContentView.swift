//
//  ContentView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 11/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var userStore : UserStore
    
    func getUser() {
        self.userStore.getCurrentUser()
    }
    
    var body: some View {
        Group {
            if self.userStore.isLogged {
                if horizontalSizeClass == .compact {
                    TabBar()
                } else {
                    SideBar()
                }
            } else {
                AuthView()
            }
        }
        .onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserStore())
    }
}
