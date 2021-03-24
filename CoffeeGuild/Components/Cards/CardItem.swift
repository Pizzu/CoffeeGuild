//
//  CardItem.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 11/3/21.
//

import SwiftUI

struct CardItem: View {
    
    //Global State
    @EnvironmentObject var cartStore : CartStore
    
    var product : Product
    @Binding var showCartAlert : Bool
    
    
    private func addProductToCart() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        self.showCartAlert = true
        self.cartStore.addProductToCart(product: product)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showCartAlert = false
        }
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 5) {
                
                Spacer()
                
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 150)
              
                
                Text(String(format: "$%.2f", product.price))
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(product.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(product.caption)
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
                
                HStack {
                    ForEach(0 ..< 5) { item in
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    }
                }
                .padding(.top, 8)
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
        .frame(width: 240, height: 350)
        .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)).opacity(0.3), radius: 15, x: 0.0, y: 3)
    }
}

struct CardItem_Previews: PreviewProvider {
    static var previews: some View {
        CardItem(product: allProducts[0], showCartAlert: .constant(false))
            .environmentObject(CartStore())
    }
}
