//
//  ProductView.swift
//  lazy-cashier
//
//  Created by Andreas Resch on 02.07.23.
//

import SwiftUI

struct ProductView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    var product: Product
    @StateObject var model: MockModel
    
    var body: some View {
        return VStack {
            Text(product.symbol)
                .font(.largeTitle)
            Text(product.name)
                .font(.title3)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            Text(model.cart.amount(of: product.id).description +  " × " + String(format: "%.2f", product.price) + " €")
                .font(.callout)
        }
        .frame(width: sizeClass == .compact ? 140 : 150, height: sizeClass == .compact ? 100 : 120)
        .padding()
        .background(
            Rectangle()
                .fill(Color.gray.opacity(
                    0.25 + (model.cart.contains(id: product.id) ? 0.55 : 0))
                )
        )
        .cornerRadius(12)
        .onTapGesture {
            withAnimation {
                model.cart.add(product: product)
            }
        }
        .onLongPressGesture(minimumDuration: 0.15) {
            withAnimation {
                model.cart.removeOneItem(product: product)
            }
        }
    }
}
//
//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        return ProductView(product: controller.container., model: model)
//            .environment(\.managedObjectContext, controller.container.viewContext)
//    }
//}
