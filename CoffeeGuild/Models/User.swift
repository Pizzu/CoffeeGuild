//
//  User.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 17/3/21.
//

import SwiftUI
import FirebaseFirestoreSwift

struct User : Identifiable, Codable {
    @DocumentID var id : String?
    var username : String
    var email : String
    var address : String
    var stripeID : String
    var profileImage : String
}

