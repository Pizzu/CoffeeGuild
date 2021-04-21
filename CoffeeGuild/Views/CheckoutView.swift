//
//  CheckoutView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 21/4/21.
//

import SwiftUI

struct CheckoutView: View {
    
    var body: some View {
        NavigationView {
            Text("CheckOut")
                .navigationTitle(Text("Checkout"))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
