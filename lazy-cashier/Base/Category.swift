//
//  Category.swift
//  lazy-cashier
//
//  Created by Andreas Resch on 02.07.23.
//

import Foundation

struct Category: Identifiable {
    var id: UUID
    var name: String
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
