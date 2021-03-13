//
//  ProfileView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 13/3/21.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
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
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Profile")
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
    }
}
