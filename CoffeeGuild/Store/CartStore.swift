//
//  CartStore.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 24/3/21.
//

import SwiftUI
import Combine
import Firebase

class CartStore : ObservableObject {
    @Published var cartItems : [Cart] = []
    @Published var totalPrice : Float = 0.0
    
    private let db : Firestore = Firestore.firestore()
    private let auth : Auth = Auth.auth()
    private var ref : ListenerRegistration? = nil
        
    func fetchCartProducts() {
        guard let currentUser = auth.currentUser else {return}
        self.ref = self.db.collection("users").document(currentUser.uid).collection("cart").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {return}
            self.cartItems = documents.compactMap({ (queryDocumentSnapshot) -> Cart? in
                return try? queryDocumentSnapshot.data(as: Cart.self)
            })
            self.totalPrice = self.cartItems.reduce(into: 0) { (acc, cart) in
                acc += cart.price * Float(cart.quantity)
            }
        }
    }
    
    func addProductToCart(product: Product) {
        guard let currentUser = auth.currentUser else {return}

        let cartRef = db.collection("users").document(currentUser.uid).collection("cart").document(product.id)
        cartRef.getDocument { (document, error) in
            if let document = document, document.exists {
                do {
                    guard var currentCartItem = try document.data(as: Cart.self) else {return}
                    currentCartItem.quantity += 1
                    try cartRef.setData(from: currentCartItem, merge: true)
                } catch {
                    print(error)
                }
            } else {
                do {
                    let cartItem = Cart(id: product.id, title: product.title, price: product.price, quantity: 1, image: product.image)
                    try cartRef.setData(from: cartItem)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func removeProductFromCart(at item: Cart) {
        guard let currentUser = auth.currentUser else {return}
        let cartItem = item
        guard let cartItemID = cartItem.id else {return}
        
        let cartRef = db.collection("users").document(currentUser.uid).collection("cart").document(cartItemID)
        cartRef.getDocument { (document, error) in
            if let document = document, document.exists {
                cartRef.delete()
            }
        }
    }
    
    func detachListener() {
        ref?.remove()
    }
}
