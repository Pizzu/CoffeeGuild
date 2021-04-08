//
//  Product.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 18/3/21.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Product : Identifiable, Codable, Hashable {
    
    @DocumentID var id : String? = UUID().uuidString
    var title : String
    var caption : String
    var description : String
    var image : String
    var price : Float
    var category : ProductCategory
    var tag : ProductTag = .base
    var likes : Int = 0
    var color : String
    
    
    enum ProductCategory: String, CaseIterable, Codable, Hashable {
        case hotCoffee = "Hot Coffee"
        case coldCoffee = "Cold Coffee"
        case cappuccino = "Cappuccino"
        case chocolate = "Chocolate"
    }
    
    enum ProductTag : String, CaseIterable, Codable, Hashable {
        case popular = "Popular"
        case new = "New"
        case base = "Base"
    }
}

let allProducts = [
    Product(
        title: "Cappuccino",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "coffee 2",
        price: 4.99,
        category: .hotCoffee,
        color: "Brownie Dark"
    ),
    Product(
        title: "Cappuccino",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "coffee 1",
        price: 4.99,
        category: .hotCoffee,
        color: "Brownie Dark"
    ),
    Product(
        title: "Cappuccino",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "coffee4",
        price: 4.99,
        category: .hotCoffee,
        color: "Brownie Dark"
    ),
    Product(
        title: "Cappuccino",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "coffe5",
        price: 4.99,
        category: .hotCoffee,
        color: "Brownie Dark"
    ),
    Product(
        title: "Cappuccino",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "coffee6",
        price: 4.99,
        category: .hotCoffee,
        color: "Brownie Dark"
    ),
    Product(
        title: "Cappuccino",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "coffee7",
        price: 4.99,
        category: .hotCoffee,
        color: "Brownie Dark"
    ),
    Product(
        title: "Cappuccino",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "coffee8",
        price: 4.99,
        category: .coldCoffee,
        color: "Brownie Dark"
    ),
    Product(
        title: "Cappuccino",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "coffee9",
        price: 4.99,
        category: .coldCoffee,
        color: "Brownie Dark"
    ),
    Product(
        title: "Cappuccino",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "coffee11",
        price: 4.99,
        category: .hotCoffee,
        color: "Brownie Dark"
    ),
    Product(
        title: "Hot Chocolate",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "chocolate",
        price: 4.99,
        category: .chocolate,
        color: "Brownie Dark"
    ),
    Product(
        title: "Cappuccino",
        caption : "A cappuccino starts with a bottom layer of one or two shots of espresso...",
        description: "A cappuccino starts with a bottom layer of one or two shots of espresso A second layer of steamed milk is added on top, followed by a thick and airy layer of foam to lend the drink a luxurious velvety texture.",
        image: "chocolate2",
        price: 4.99,
        category: .chocolate,
        color: "Brownie Dark"
    ),

]
