//
//  ContentView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 11/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userStore : UserStore
    
    func getUser() {
        self.userStore.getCurrentUser()
    }
    
    var body: some View {
        Group {
            if self.userStore.isLogged {
                HomeView()
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
