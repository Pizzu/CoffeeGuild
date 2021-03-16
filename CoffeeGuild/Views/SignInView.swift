//
//  SignInView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 16/3/21.
//

import SwiftUI

struct SignInView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email : String = ""
    @State private var password : String = ""
    @State var isFocus : Bool = false
    
    var body: some View {
        ZStack {
            AuthCover()
            
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .padding()
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
                
                Spacer()
            }
            
            VStack(spacing: 60.0) {
                Text("Sign In")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()

                VStack(spacing: 8.0) {
                    HStack {
                        Image(systemName: "mail")
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        
                        TextField("Email".capitalized, text: self.$email)
                            .keyboardType(.emailAddress)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.leading)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isFocus = true
                            }
                    }
                    
                    Divider()
                        .background(Color.white)
                        .padding(.leading, 60)
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        
                        SecureField("Password".capitalized, text: self.$password)
                            .keyboardType(.default)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.leading)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isFocus = true
                            }
                    }
                    
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .frame(maxWidth: 650)
                .background(Color(#colorLiteral(red: 0.737254902, green: 0.5647058824, blue: 0.4156862745, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                
                VStack(spacing: 20.0) {
                    Button(action: {}) {
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
                    
                    
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
            }
            .animation(.easeInOut, value: self.isFocus)
        }
        .onTapGesture {
            self.isFocus = false
            self.hideKeyboard()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
