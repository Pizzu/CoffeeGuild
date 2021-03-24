//
//  CartItem.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 24/3/21.
//

import SwiftUI

struct CartItem: View {
    
    var product : Product
    var numberOfItems : Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75, height: 75)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("x\(numberOfItems)")
                        .font(.headline)
                        .fontWeight(.bold)
                }
                
                Text(String(format: "$%.2f", product.price))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
            }
            
        }
        .padding()
        .frame(height: 100)
     
    }
}

struct CartItem_Previews: PreviewProvider {
    static var previews: some View {
        CartItem(product: allProducts[0], numberOfItems: 4)
            .environmentObject(CartStore())
    }
}
