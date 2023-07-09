//
//  ContentView.swift
//  lazy-cashier
//
//  Created by Andreas Resch on 02.07.23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = MockModel()
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showChangeSheet = false
        
    var body: some View {
        return VStack {
            HStack{
                Button("Löschen", role: .destructive) {
                    withAnimation {
                        model.cart.clear()
                    }
                }.disabled(model.cart.items.isEmpty)
                Spacer()
                Image(systemName: "arrow.uturn.left").onTapGesture {
                    withAnimation {
                        model.cart.removeLast()
                    }
                }.disabled(model.cart.items.isEmpty)
                    .font(.headline)
                    .padding()
                Text(String(format: "%.2f", model.cart.total) + " €")
                    .font(.largeTitle)
                Spacer()
                Button("Kassieren") {
                    showChangeSheet.toggle()
                }.buttonStyle(.borderedProminent)
                    .disabled(model.cart.items.isEmpty)
            }.padding()
            ProductsView(model: model)
        }
        .sheet(isPresented: $showChangeSheet) {
            ChangeView(received: model.cart.total)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        let controller = PersistenceController.preview
        return ContentView()
//            .environment(\.managedObjectContext, controller.container.viewContext)
    }
}
