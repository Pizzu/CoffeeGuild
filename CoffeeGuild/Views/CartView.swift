//
//  CartView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 13/3/21.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20.0) {
                    ForEach(0 ..< 5) { item in
                        CardItemSmall()
                    }
                }
                .padding(.horizontal)
                
            }
            .navigationBarTitle("Cart")
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

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
