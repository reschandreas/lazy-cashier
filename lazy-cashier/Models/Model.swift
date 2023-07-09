//
//  MockModel.swift
//  lazy-cashier
//
//  Created by Andreas Resch on 02.07.23.
//

import Foundation

class MockModel: ObservableObject {
    
    @Published var categories: [Category] = [
        Category(name: "Essen"),
        Category(name: "Trinken")
    ]
    
    @Published var products: [Product] = []
    
    @Published var cart = Cart()
        
    
    init() {
        self.products = [
            Product(id: UUID(), name: "½ Wein", price: 5, category: "Trinken", symbol: "🍾"),
            Product(id: UUID(), name: "Wein Glas", price: 1.5, category: "Trinken", symbol: "🍷"),
            Product(id: UUID(), name: "Bier", price: 3, category: "Trinken", symbol: "🍺"),
            Product(id: UUID(), name: "Saft", price: 2.5, category: "Trinken", symbol: "🥤"),
            Product(id: UUID(), name: "Mineralwasser", price: 2, category: "Trinken", symbol: "💧"),
            Product(id: UUID(), name: "Würstel mit Beilage", price: 9, category: "Essen", symbol: "🌭"),
            Product(id: UUID(), name: "Truthahnschnitzel mit Beilage", price: 9, category: "Essen", symbol: "🦃"),
            Product(id: UUID(), name: "Schopf mit Beilage", price: 9, category: "Essen", symbol: "🐖"),
            Product(id: UUID(), name: "Kaffee", price: 1, category: "Essen", symbol: "☕️"),
            Product(id: UUID(), name: "Kuchen", price: 2.5, category: "Trinken", symbol: "🍰"),
            Product(id: UUID(), name: "3 Krapfen", price: 2.5, category: "Trinken", symbol: "🧇"),
        ]
    }
}
