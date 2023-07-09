//
//  BankNoteView.swift
//  lazy-cashier
//
//  Created by Andreas Resch on 03.07.23.
//

import SwiftUI

struct BankNoteView: View {
    
    var value: Double
    var highlight: Bool
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        Text(String(format: value < 1 ? "%.2f" : "%.0f", value) + " €")
            .frame(width: sizeClass == .compact ? 50 : 80, height: sizeClass == .compact ? 25 : 50)
            .padding()
            .background(
                Rectangle()
                    .fill(Color.gray.opacity(0.25 + (highlight ? 0.55 : 0)))
            )
            .cornerRadius(12)
    }
}

struct BankNoteView_Previews: PreviewProvider {
    static var previews: some View {
        BankNoteView(value: 10, highlight: false)
    }
}
