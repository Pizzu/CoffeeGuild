//
//  AuthView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 14/3/21.
//

import SwiftUI

struct AuthView: View {
    
    @State private var showSignIn : Bool = false
    @State private var showSignUp : Bool = false
        
    var body: some View {
        ZStack {
            
            AuthCover()
            
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
                    Button(action: {
                        self.showSignIn = true
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                            .padding(12)
                            .frame(width: 200)
                            .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 20)
                    }
                    .fullScreenCover(isPresented: $showSignIn, content: {
                        SignInView()
                    })
                    
                    Button(action: {
                        self.showSignUp = true
                    }) {
                        Text("Sign Up")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                            .padding(12)
                            .frame(width: 200)
                            .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 20)
                    }
                    .fullScreenCover(isPresented: $showSignUp, content: {
                        SignUpView()
                    })
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

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
