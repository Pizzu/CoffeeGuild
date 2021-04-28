//
//  OrderStore.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 28/4/21.
//

import SwiftUI
import Combine
import Firebase

class OrderStore : ObservableObject {
    
    @Published var allOrders : [Order] = []
    
    private let db : Firestore = Firestore.firestore()
    private let auth : Auth = Auth.auth()
    private var ref : ListenerRegistration? = nil
    
    func getAllOrders() {
        guard let currentUser = auth.currentUser else {return}
        self.ref = self.db.collection("users").document(currentUser.uid).collection("orders").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {return}
            self.allOrders = documents.compactMap({ (queryDocumentSnapshot) -> Order? in
                return try? queryDocumentSnapshot.data(as: Order.self)
            })
        }
    }
    
    func detachListener() {
        ref?.remove()
    }
}
