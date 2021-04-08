//
//  ProductStore.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 18/3/21.
//

import SwiftUI
import Combine
import Firebase

class ProductStore : ObservableObject {
    @Published var products : [Product] = []
    @Published var favoriteProducts : [Product] = []
    
    private let db : Firestore = Firestore.firestore()
    private let auth : Auth = Auth.auth()
    
    init() {
        fetchProducts()
    }
    
    private func fetchProducts() {
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
    
    func fetchFavoriteProducts() {
        guard let currentUser = auth.currentUser else {return}
        db.collection("users").document(currentUser.uid).collection("favorites").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {return}
            self.favoriteProducts = documents.compactMap({ (queryDocumentSnapshot) -> Product? in
                return try? queryDocumentSnapshot.data(as: Product.self)
            })
        }
    }
    
    func toggleProductToFavorite(product: Product, completion: @escaping () -> Void) {
        guard let currentUser = auth.currentUser else {return}
        guard let productID = product.id else {return}
        
        let favoritesRef = db.collection("users").document(currentUser.uid).collection("favorites").document(productID)
        favoritesRef.getDocument { (document, error) in
            if let document = document, document.exists {
                //Remove it from favorites
                favoritesRef.delete()
                DispatchQueue.main.async {
                    completion()
                }
            } else {
                //Add it to favorites
                do {
                    try favoritesRef.setData(from: product)
                    DispatchQueue.main.async {
                        completion()
                    }
                } catch {
                    print(error)
                }
                
            }
        }
    }
}
