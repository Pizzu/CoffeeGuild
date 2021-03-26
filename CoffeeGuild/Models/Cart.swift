//
//  Cart.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 25/3/21.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Cart : Identifiable, Codable, Hashable {
    
    @DocumentID var id : String? = UUID().uuidString
    var title : String
    var price : Float
    var quantity : Int
    var image : String

}
