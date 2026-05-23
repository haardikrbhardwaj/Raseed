//
//  Item.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
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
