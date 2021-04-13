//
//  FavoriteItem.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 13/4/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteItem: View {
    
    //Global State
    @EnvironmentObject var cartStore : CartStore
    
    //Properties
    var product : Product
    
    private func addProductToCart() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        self.cartStore.addProductToCart(product: product) {
            self.cartStore.showCartAlert = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.cartStore.showCartAlert = false
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .center, spacing: 15) {
                
                Spacer()
                
                WebImage(url: URL(string: product.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 100)
                
                Text(product.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            VStack {
                Image(systemName: "plus")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    .frame(width: 32, height: 32)
                    .onTapGesture {
                        self.addProductToCart()
                    }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 25)
        .frame(height: 220)
        .background(Color(product.color))
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: Color(product.color).opacity(0.3), radius: 20, x: 0.0, y: 10)
    }
}

struct FavoriteItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteItem(product: allProducts[8])
            .environmentObject(CartStore())
    }
}
