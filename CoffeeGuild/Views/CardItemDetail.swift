//
//  CardItemDetail.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 11/3/21.
//

import SwiftUI

struct CardItemDetail: View {
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            content
        }
    }
    
    var content : some View {
        ScrollView {
            VStack(spacing: 40.0) {
                
                VStack {
                    VStack {
                        Image("coffee7")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                        
                    }
                    .frame(maxWidth:.infinity)
                    .frame(height: 350)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.737254902, green: 0.5647058824, blue: 0.4156862745, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                }
                
                VStack(spacing: 20.0) {
                    HStack {
                        Spacer()
                        
                        Text("$4.99")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text("Cappucino")
                                .font(.largeTitle)
                                .bold()
                            
                            Text("A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.")
                                .font(.footnote)
                                .fontWeight(.regular)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        HStack {
                            ForEach(0 ..< 5) { item in
                                Image(systemName: "star.fill")
                                    .font(.headline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                            }
                            
                            Text("12k Likes")
                                .font(.caption)
                            
                            Image("Avatar1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
                                .overlay(
                                    Image("Avatar2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 32, height: 32)
                                        .clipShape(Circle())
                                        .offset(x: 17)
                                        .overlay(
                                            Image("Avatar3")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 32, height: 32)
                                                .clipShape(Circle())
                                                .offset(x: 34)
                                        )
                                )
                        }
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "heart.fill")
                                .font(.headline)
                                .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                                .frame(width: 38, height: 38)
                                .onTapGesture {
                                    UINotificationFeedbackGenerator().notificationOccurred(.success)
                                }
                        }
                        
                        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 10)
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    
                    Image(systemName: "minus")
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    
                    Spacer()
                    
                    Text("3")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    Image(systemName: "plus")
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .frame(width: 150)
                .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                
                Button(action: {}) {
                    Text("Order Now")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                        .padding(12)
                        .padding(.horizontal, 40)
                        .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 20)
                }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(.easeIn) {
                
            }
        }
    }
    
}

struct CardItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardItemDetail()
    }
}
