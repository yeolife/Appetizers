//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by yeolife on 9/30/23.
//

import SwiftUI
import SwiftData

@main
struct AppetizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
