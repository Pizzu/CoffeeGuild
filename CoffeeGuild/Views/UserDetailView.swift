//
//  UserDetailView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 19/4/21.
//

import SwiftUI

struct UserDetailView: View {
    
    @EnvironmentObject var userStore : UserStore
    
    @State private var image : Image = Image(systemName: "person.fill")
    @State private var username : String = ""
    @State private var address : String = ""
    @State private var showCaptureImageView : Bool = false
    
    private func setTextFields() {
        guard let currentUser = userStore.currentUser else {return}
        self.username = currentUser.username
        self.address = currentUser.address
        if currentUser.profileImage != "" {
            self.image = Image(currentUser.profileImage)
        }
    }
    
    private func onUpdateInfoPressed() {
        // Update user info
        
    }
    
    var body : some View {
        ZStack {
            content
            
            if self.showCaptureImageView {
                CaptureImageView(isShown: $showCaptureImageView, image: $image)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
    
    var content: some View {
        ZStack {
            AuthCover()
            
            VStack(spacing: 60) {
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 180)
                    .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                    .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                    .clipShape(Circle())
                    .onTapGesture {
                        self.showCaptureImageView = true
                    }
                
                VStack(spacing: 8) {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        
                        TextField("Username".capitalized, text: self.$username)
                            .keyboardType(.emailAddress)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.leading)
                            .frame(height: 44)
                    }
                    
                    Divider()
                        .background(Color.white)
                        .padding(.leading, 60)
                    
                    HStack {
                        Image(systemName: "map")
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        
                        TextField("Address".capitalized, text: self.$address)
                            .keyboardType(.emailAddress)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.leading)
                            .frame(height: 44)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .frame(maxWidth: 650)
                .background(Color(#colorLiteral(red: 0.737254902, green: 0.5647058824, blue: 0.4156862745, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                
                Button(action: {
                    //
                }) {
                    Text("Update")
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
        .onTapGesture {
            self.hideKeyboard()
        }
        .onAppear(perform: setTextFields)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
            .environmentObject(UserStore())
    }
}
