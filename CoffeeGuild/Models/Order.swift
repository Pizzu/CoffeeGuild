//
//  Order.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 28/4/21.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Order: Identifiable, Codable, Hashable {
    @DocumentID var id : String?
    var title : String
    @ServerTimestamp var creationDate : Date?
    var orderNumber : String
    var items : [[String : String]]
}
