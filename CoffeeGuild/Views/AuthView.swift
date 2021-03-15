//
//  AuthView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 14/3/21.
//

import SwiftUI

struct AuthView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var blobSize : CGFloat {
        if self.horizontalSizeClass == .compact {
            return 600
        } else {
            return 800
        }
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.737254902, green: 0.5647058824, blue: 0.4156862745, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Image("blob1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: self.blobSize, height: self.blobSize)
                        .blendMode(.softLight)
                        .offset(x: 200, y: -250)
                    
                    Image("blob2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: self.blobSize, height: self.blobSize)
                        .blendMode(.overlay)
                        .offset(x: -200, y: -200)
                }
                
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack(spacing: 50.0) {
                Image("LogoIllustration")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                
                VStack(alignment: .center, spacing: 8.0) {
                    
                    Text("The Best Coffee")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("Anywhere & Anytime")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 20.0) {
                    Button(action: {}) {
                        Text("Sign In")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    }
                    .padding(12)
                    .frame(width: 200)
                    .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 20)
                    
                    Button(action: {}) {
                        Text("Sign Up")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    }
                    .padding(12)
                    .frame(width: 200)
                    .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 20)
                }
            }

        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
