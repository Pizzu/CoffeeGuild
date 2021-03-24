//
//  CartStore.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 24/3/21.
//

import SwiftUI

class CartStore : ObservableObject {
    @Published var cart : [Product] = []
    @Published var totalPrice : Float = 0.0
    
    func addProductToCart(product: Product) {
        totalPrice += product.price
        cart.append(product)
    }
    
    func removeProductFromCart(at index: Int) {
        totalPrice -= cart[index].price
        cart.remove(at: index)
    }
}
