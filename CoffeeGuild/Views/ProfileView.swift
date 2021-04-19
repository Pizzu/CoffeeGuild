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
                Section(header: Text("Account")) {
                    NavigationLink( destination: UserDetailView()) {
                        Text("Personal Info")
                    }
                    Text("Orders")
                    Text("Row 3")
                }

                Section(header: Text("Privacy")) {
                    Text("Row 1")
                    Text("Row 2")
                    Text("Row 3")
                }
                
                Section(header: Text("Disconect")) {
                    Text("Logout")
                        .bold()
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.userStore.logout()
                            }
                            
                        }
                }
            }
            
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Hello, \(self.userStore.currentUser?.username ?? "")")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserStore())
    }
}
