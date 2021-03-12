//
//  CardItem.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 11/3/21.
//

import SwiftUI

struct CardItem: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading,spacing: 10) {
                
                Spacer()
                
                Image("coffee 2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 150)
              
                
                Text("$4.99")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Cappucino")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("A cappuccino starts with a bottom layer of one or two shots of espresso...")
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
                .padding(.top, 10)
            }
            
            VStack {
                Image(systemName: "plus")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    .frame(width: 32, height: 32)
            }
            
            .background(Color(#colorLiteral(red: 0.5019607843, green: 0.3019607843, blue: 0.2156862745, alpha: 1)))
            .clipShape(Circle())
            
            
        }
        .padding(.horizontal)
        .padding(.vertical, 25)
        .frame(width: 240, height: 370)
        .background(Color(#colorLiteral(red: 0.6588235294, green: 0.3568627451, blue: 0.2352941176, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.6588235294, green: 0.3568627451, blue: 0.2352941176, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 10)
    }
}

struct CardItem_Previews: PreviewProvider {
    static var previews: some View {
        CardItem()
    }
}
