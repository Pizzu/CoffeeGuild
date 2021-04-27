//
//  CartView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 13/3/21.
//

import SwiftUI
import Stripe

struct CartView: View {
    
    //Global State
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cartStore: CartStore
    @EnvironmentObject var userStore : UserStore
    
    let paymentHandler = PaymentHandler()
    
    
    private func fetchProducts() {
        self.cartStore.fetchCartProducts()
    }
    
    var body: some View {
        ZStack {
            content
            
            noItemsMessage
            
            checkout
        }
        .onAppear {
            self.fetchProducts()
        }
        .onDisappear {
            self.cartStore.detachListener()
        }
    }
    
    var content : some View {
        NavigationView {
            List {
                ForEach(self.cartStore.cartItems, id: \.self) { item in
                    CartItem(cartItem: item)
                }
            }
            .listStyle(InsetListStyle())
            .navigationBarTitle("Cart")
        }
    }
    
    var noItemsMessage : some View {
        Text("Add some products to your cart".capitalized)
            .font(.headline)
            .foregroundColor(.gray)
            .scaleEffect(self.cartStore.cartItems.count > 0 ? 0.7 : 1)
            .opacity(self.cartStore.cartItems.count > 0 ? 0 : 1 )
            .animation(.spring())
    }
    
    var checkout : some View {
        VStack {
            Spacer()
            
            HStack {
                Text(String(format: "$%.2f", self.cartStore.totalPrice))
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        self.paymentHandler.startPayment(for: self.userStore.currentUser, totalAmount: self.cartStore.totalPrice) { (success) in
                            if success {
                                print("Success")
                                self.presentationMode.wrappedValue.dismiss()
                            } else {
                                print("Failed")
                            }
                        }
                    }) {
                        Text("Check Out")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.8823529412, green: 0.7098039216, blue: 0.2705882353, alpha: 1)))
                            .padding(12)
                            .frame(width: 150)
                            .background(Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.3568627451, green: 0.2039215686, blue: 0.1176470588, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 20)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 110)
            .background(Color("Gray Light"))
            .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0.0, y: -10)
            .offset(y: self.cartStore.cartItems.count > 0 ? 0 : UIScreen.main.bounds.height)
            .animation(.spring())
        }
        .ignoresSafeArea()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartStore())
    }
}
