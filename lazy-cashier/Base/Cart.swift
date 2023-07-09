//
//  Cart.swift
//  lazy-cashier
//
//  Created by Andreas Resch on 03.07.23.
//

import Foundation

struct Cart {
    
    var items: [Product] = []
    
    var total: Double {
        items.reduce(0, { $0 + $1.price })
    }
    
    func amount(of: UUID) -> Int {
        items.filter {
            $0.id == of
        }.count
    }
    
    func contains(id: UUID) -> Bool {
        items.contains(where: {
            $0.id == id
        })
    }
    
    mutating func add(product: Product) {
        items.append(product)
    }
    
    mutating func removeOneItem(product: Product) {
        if let index = items.firstIndex(where: { p in
            product.id == p.id}
        ) {
            items.remove(at: index)
        }
    }
    
    mutating func removeLast() {
        if !items.isEmpty {
            items.removeLast()
        }
    }
    
    mutating func clear() {
        items.removeAll()
    }
}
