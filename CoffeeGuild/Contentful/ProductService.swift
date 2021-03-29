//
//  ProductService.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 27/3/21.
//

import SwiftUI
import Contentful

class ProductService {
    
    static let instance = ProductService()
    private let client : Client
    
    private init() {
        client = Client(spaceId: API.spaceID, accessToken: API.accessToken)
    }
    
    func getAllProducts(completion: @escaping([Entry]) -> Void) {
        let query = Query.where(contentTypeId: "product")
        client.fetchArray(of: Entry.self, matching: query) { result in
            switch result {
            case .success(let entry):
                DispatchQueue.main.async {
                    completion(entry.items)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
