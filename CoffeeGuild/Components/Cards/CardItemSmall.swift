//
//  CardItemSmall.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 11/3/21.
//

import SwiftUI

struct CardItemSmall: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            Image("coffee 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75, height: 75)
                .clipShape(Circle())
            
//            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Frappucino")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("$8.99")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                }
                
                HStack {
                    Text("Milkshake with ice cream, and cappuccino...")
                        .font(.caption)
                        .fontWeight(.regular)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "plus")
                            .font(.headline)
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                            .frame(width: 25, height: 25)
                    }
                    
                    .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                    .clipShape(Circle())
                }
            }
            
        }
        .padding()
        .frame(height: 100)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 10)
    }
}

struct CardItemSmall_Previews: PreviewProvider {
    static var previews: some View {
        CardItemSmall()
    }
}
