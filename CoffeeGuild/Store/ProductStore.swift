//
//  ProductStore.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 18/3/21.
//

import SwiftUI

class ProductStore : ObservableObject {
    @Published var products = allProducts
}
