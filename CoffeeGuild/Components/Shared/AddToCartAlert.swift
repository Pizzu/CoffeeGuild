//
//  AddToCartAlert.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 24/3/21.
//

import SwiftUI
import SwiftUIX

struct AddToCartAlert: View {
    
    @State private var show : Bool = false
    
    var body: some View {
        VStack(spacing: 30.0) {
            Circle()
                .stroke(lineWidth: 7)
                .fill(Color(#colorLiteral(red: 0.1568627451, green: 0.9254901961, blue: 0.1411764706, alpha: 1)))
                .frame(width: 100, height: 100)
                .overlay(
                    Image(systemName: "checkmark")
                        .font(.largeTitle, weight: .bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.1568627451, green: 0.9254901961, blue: 0.1411764706, alpha: 1)))
                )
            
            VStack(spacing: 5.0) {
                Text("Product")
                    .font(.headline)
                    .bold()
                
                Text("Added to Cart")
                    .font(.headline)
                    .bold()
            }
           
        }
        .frame(width: 250, height: 300)
        .background(BlurEffectView(style: .systemMaterial))
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        .scaleEffect(self.show ? 1 : 0.6)
        .onAppear {
            withAnimation(.spring()) {
                self.show = true
            }
        }
        .onDisappear {
            withAnimation(.spring()) {
                self.show = true
            }
        }
    }
}

struct AddToCartAlert_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartAlert()
            
    }
}
