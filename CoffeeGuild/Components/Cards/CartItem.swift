//
//  CartItem.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 24/3/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItem: View {
    
    var cartItem : Cart
    @EnvironmentObject var cartStore: CartStore
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            WebImage(url: URL(string: cartItem.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75, height: 75)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(cartItem.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .frame(width: 25, height: 25)
                            .onTapGesture {
                                self.cartStore.removeProductFromCart(at: cartItem)
                            }
                    }
                    .background(Color.red)
                    .clipShape(Circle())
                }
                
                HStack {
                    Text(String(format: "$%.2f", cartItem.price))
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    
                    Spacer()
                    
                    
                    Text("x\(cartItem.quantity)")
                        .font(.headline)
                        .fontWeight(.bold)
                }
                
                
            }
            
        }
        .padding()
        .frame(height: 100)
     
    }
}

struct CartItem_Previews: PreviewProvider {
    static var previews: some View {
        CartItem(cartItem: Cart(title: "Cappucino", price: 4.99, quantity: 3, image: "coffee 2"))
            .environmentObject(CartStore())
    }
}
