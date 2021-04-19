//
//  PasswordResetView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 18/4/21.
//

import SwiftUI

struct PasswordResetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userStore : UserStore
    
    @State private var resetEmail : String = ""
    @State private var isResetSuccessful : Bool = false
    @State private var isResetUnsuccessful : Bool = false
    
    private func onSubmitPressed() {
        do {
            try self.userStore.resetPassword(with: resetEmail, completion: { error in
                if error != nil {
                    self.isResetUnsuccessful = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.isResetUnsuccessful = false
                    }
                } else {
                    self.isResetSuccessful = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.isResetSuccessful = false
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            })
        } catch {
            self.isResetUnsuccessful = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isResetUnsuccessful = false
            }
        }
    }
    
    var body: some View {
        ZStack {
            content
                .disabled(self.isResetSuccessful)
                .disabled(self.isResetUnsuccessful)
            
            if self.isResetSuccessful {
                CustomAlert(title: "Reset Password", description: "An email has been sent you successfully.")
            }
            
            if self.isResetUnsuccessful {
                CustomAlert(title: "Reset Password", description: "Something went wrong.", icon: .xmark, color: Color.red)
            }
        }
    }
    
    var content : some View {
        ZStack {
            AuthCover()
            
            VStack(spacing: 60.0) {
                Text("Reset Password")
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
                        
                        TextField("Email".capitalized, text: self.$resetEmail)
                            .keyboardType(.emailAddress)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.leading)
                            .frame(height: 44)
                    }
                    
                    Divider()
                        .background(Color.white)
                        .padding(.leading, 60)
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .frame(maxWidth: 650)
                .background(Color(#colorLiteral(red: 0.737254902, green: 0.5647058824, blue: 0.4156862745, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                
                VStack(spacing: 20.0) {
                    Button(action: {
                        self.onSubmitPressed()
                    }) {
                        Text("Submit")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                            .padding(12)
                            .frame(width: 200)
                            .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 20)
                    }
                }
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}
