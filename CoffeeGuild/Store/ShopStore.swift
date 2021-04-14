//
//  ShopStore.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 14/4/21.
//

import SwiftUI
import MapKit

class ShopStore : ObservableObject {
    
    @Published var shops : [Shop] = allShops
   
}
