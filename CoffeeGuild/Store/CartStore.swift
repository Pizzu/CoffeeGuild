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
    @Published var showCartAlert : Bool = false
    @Published var showOrderCompleted : Bool = false
    
    private let db : Firestore = Firestore.firestore()
    private let auth : Auth = Auth.auth()
    private let functions: Functions = Functions.functions()
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
    
    func addProductToCart(product: Product, quantity: Int = 1, completion: @escaping () -> Void) {
        guard let currentUser = auth.currentUser else {return}
        guard let productId = product.id else {return}
        
        let cartRef = db.collection("users").document(currentUser.uid).collection("cart").document(productId)
        cartRef.getDocument { (document, error) in
            if let document = document, document.exists {
                do {
                    guard var currentCartItem = try document.data(as: Cart.self) else {return}
                    currentCartItem.quantity += quantity
                    try cartRef.setData(from: currentCartItem, merge: true)
                    DispatchQueue.main.async {
                        completion()
                    }
                    
                } catch {
                    print(error)
                }
            } else {
                do {
                    let cartItem = Cart(id: productId, title: product.title, price: product.price, quantity: quantity, image: product.image)
                    try cartRef.setData(from: cartItem)
                    DispatchQueue.main.async {
                        completion()
                    }
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
    
    func removeAllProductsFromCart() {
        self.functions.httpsCallable("cleanCart").call(nil) { (result, error) in
            if error != nil {
                return
            }
        }
    }
    
    func detachListener() {
        ref?.remove()
    }
}
