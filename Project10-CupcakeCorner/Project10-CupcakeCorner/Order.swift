//
//  Order.swift
//  Project10-CupcakeCorner
//
//  Created by Chloe Fermanis on 8/1/22.
//

import Foundation

class Order: ObservableObject {
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
        
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
}
