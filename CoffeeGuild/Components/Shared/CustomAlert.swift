//
//  CustomAlert.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 24/3/21.
//

import SwiftUI
import SwiftUIX

struct CustomAlert: View {
    
    @State private var show : Bool = false
    
    var title : String
    var description : String
    var icon : IconType = .checkmark
    var color : Color = Color(#colorLiteral(red: 0.1568627451, green: 0.9254901961, blue: 0.1411764706, alpha: 1))
    
    enum IconType : String {
        case checkmark = "checkmark"
        case xmark = "xmark"
    }
    
    var body: some View {
        VStack(spacing: 30.0) {
            Circle()
                .stroke(lineWidth: 7)
                .fill(self.color)
                .frame(width: 100, height: 100)
                .overlay(
                    Image(systemName: self.icon.rawValue)
                        .font(.largeTitle, weight: .bold)
                        .foregroundColor(self.color)
                )
            
            VStack(alignment: .center, spacing: 5.0) {
                Text(self.title)
                    .font(.headline)
                    .bold()
                
                Text(self.description)
                    .font(.headline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
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

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(title: "Product", description: "Added to cart")
    }
}
