//
//  ProductsView.swift
//  lazy-cashier
//
//  Created by Andreas Resch on 02.07.23.
//

import SwiftUI

struct ProductsView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.managedObjectContext) var managedObjectContext
//    @FetchRequest(entity: Product.entity(), sortDescriptors: []) var products: FetchedResults<Product>
    @State var model: MockModel
    
    var body: some View {
        var categories: [String] = []
        model.products.forEach { product in
            if !categories.contains(where: {
                $0 == product.category
            }) {
                categories.append(product.category)
            }
        }
        
        return VStack {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: sizeClass == .compact ? 150 : 180))],
                    alignment: .center,
                    spacing: sizeClass == .compact ? 14 : 16,
                    pinnedViews: [.sectionHeaders]) {
                        ForEach(categories, id: \.hashValue) { category in
                        Section(header: Text(category).font(.title)) {
                            ForEach(model.products.filter {
                                $0.category == category
                            }, id: \.id) { product in
                                ProductView(product: product, model: model)
                            }
                        }
                    }
                }.padding(.horizontal, 16)
            }
        }
    }
    
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
//        let persistenceController = PersistenceController.preview
        return ProductsView(model: MockModel())
//            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
