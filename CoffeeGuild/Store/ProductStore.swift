//
//  ProductStore.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 18/3/21.
//

import SwiftUI
import Combine

class ProductStore : ObservableObject {
    @Published var products : [Product] = []
    
    init() {
        ProductService.instance.getAllProducts { (items) in
            items.forEach { (item) in
                let id = item.id
                guard let title = item.fields["title"] as? String else {return}
                guard let caption = item.fields["caption"] as? String else {return}
                guard let description = item.fields["description"] as? String else {return}
                guard let image = item.fields.linkedAsset(at: "image")?.urlString else {return}
                guard let price = item.fields["price"] as? Double else {return}
                guard let category = item.fields["category"] as? String else {return}
                guard let tag = item.fields["tag"] as? String else {return}
                guard let color = item.fields["color"] as? String else {return}
                
                
                let newProduct = Product(id: id, title: title, caption: caption, description: description, image: image, price: Float(price), category: Product.ProductCategory(rawValue: category) ?? .hotCoffee, tag: Product.ProductTag(rawValue: tag) ?? .base, color: color)
                
                self.products.append(newProduct)
            }
        }
    }
}
