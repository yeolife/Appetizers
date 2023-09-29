//
//  Item.swift
//  Appetizers
//
//  Created by yeolife on 9/30/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
