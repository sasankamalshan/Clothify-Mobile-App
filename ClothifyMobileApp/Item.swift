//
//  Item.swift
//  ClothifyMobileApp
//
//  Created by Sasanka Malshan on 2025-08-13.
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
