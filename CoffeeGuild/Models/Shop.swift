//
//  Shop.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 14/4/21.
//

import SwiftUI
import MapKit

struct Shop : Identifiable {
    var id : String = UUID().uuidString
    var title : String
    var address : String
    var coordinate : CLLocationCoordinate2D
}

let allShops = [
    Shop(title: "Coffee Shop Varese", address: "Via Colombera 38, 21048 Solbiate Arno Italia", coordinate: CLLocationCoordinate2D(latitude: 45.7128, longitude: 8.82223)),
    Shop(title: "Coffee Shop Firenze", address: "Via Ugo Foscolo 11, 50124 Firenze Italia", coordinate: CLLocationCoordinate2D(latitude: 43.759915, longitude: 11.240657)),
    Shop(title: "Coffee Shop Roma", address: "Via dell'Umiltà, 00187 Roma, Italia", coordinate: CLLocationCoordinate2D(latitude: 41.901234, longitude: 12.4829321))
]
