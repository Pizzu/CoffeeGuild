//
//  ProfileView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 13/3/21.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userStore : UserStore
    
    
//    init() {
//        UITableView.appearance().backgroundColor = .white
//    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Important tasks")) {
                    NavigationLink( destination: Text("Destination")) {
                        Text("Row 1")
                    }
                    Text("Row 2")
                    Text("Row 3")
                }

                Section(header: Text("Other tasks")) {
                    Text("Row 1")
                    Text("Row 2")
                    Text("Row 3")
                }
                
                Text("Logout")
                    .bold()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.userStore.logout()
                        }
                        
                    }
            }
            
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Hello, \(self.userStore.currentUser?.username ?? "")")
            .navigationBarItems(
                trailing:
                    Image(systemName: "xmark")
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            )
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserStore())
    }
}
