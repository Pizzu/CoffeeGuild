//
//  CoffeeGuildApp.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 11/3/21.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}


@main
struct CoffeeGuildApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserStore())
                .environmentObject(ProductStore())
                .environmentObject(CartStore())
        }
    }
}
