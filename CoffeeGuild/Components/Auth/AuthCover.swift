//
//  AuthCover.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 16/3/21.
//

import SwiftUI

struct AuthCover: View {
    
    @State private var show : Bool = false
    
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
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("blob1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.blobSize, height: self.blobSize)
                    .rotationEffect(Angle(degrees: self.show ? 360+90 : 90))
                    .blendMode(.softLight)
                    .offset(x: 200, y: -250)
                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false), value: self.show),
                alignment: .top
            )
            .background(
                Image("blob2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.blobSize, height: self.blobSize)
                    .rotationEffect(Angle(degrees: self.show ? 360+90 : 90))
                    .blendMode(.overlay)
                    .offset(x: -200, y: -200)
                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false), value: self.show),
                alignment: .top
            )
            .clipped()
            .ignoresSafeArea()
            
        }
        .onAppear {
            self.show = true
        }
    }
}

struct AuthCover_Previews: PreviewProvider {
    static var previews: some View {
        AuthCover()
    }
}
