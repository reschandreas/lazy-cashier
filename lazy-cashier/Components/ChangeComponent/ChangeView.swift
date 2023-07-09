//
//  ChangeView.swift
//  lazy-cashier
//
//  Created by Andreas Resch on 03.07.23.
//

import SwiftUI

struct ChangeView: View {
    
    var received: Double
    @State var input: [Double] = []
    var sum: Double {
        input.reduce(0, +)
    }
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var currencyOptions: some View {
        Group {
            Spacer()
            Grid {
                Text("Scheine").font(.headline)
                GridRow {
                    ForEach([50, 20, 10, 5], id: \.description) { value in
                        BankNoteView(value: value, highlight: input.contains(value))
                            .onTapGesture {
                                withAnimation {
                                    input.append(value)
                                }
                            }
                    }
                }
                GridRow {
                    ForEach([100, 200, 500], id: \.description) { value in
                        BankNoteView(value: value, highlight: input.contains(value))
                            .onTapGesture {
                                withAnimation {
                                    input.append(value)
                                }
                            }
                    }
                    Image(systemName: "arrow.uturn.left").onTapGesture {
                        withAnimation {
                            if !input.isEmpty {
                                input.removeLast()
                            }
                        }
                    }.disabled(input.isEmpty)
                        .font(.headline)
                        .padding()
                }
            }
            Spacer()
            Grid {
                Text("Münzen").font(.headline)
                GridRow {
                    ForEach([2, 1, 0.5, 0.2], id: \.description) { value in
                        BankNoteView(value: value, highlight: input.contains(value))
                            .onTapGesture {
                                withAnimation {
                                    input.append(value)
                                }
                            }
                    }
                }
                GridRow {
                    ForEach([0.1, 0.05, 0.02, 0.01], id: \.description) { value in
                        BankNoteView(value: value, highlight: input.contains(value))
                            .onTapGesture {
                                withAnimation {
                                    input.append(value)
                                }
                            }
                    }
                }
            }
            Spacer()
        }
    }
    
    var body: some View {
        let difference = received - sum
        var instruction: String = "Perfekt"
        if difference < 0 {
            instruction = String(format: "%.2f", -difference) + " € zurückgeben"
        } else if difference > 0 {
            instruction = "Noch " + String(format: "%.2f", difference) + " € fehlen"
        }
        return VStack {
            Spacer()
            Text("Wie viel Geld hast du erhalten?").font(.title)
            Text(String(format: "%.2f", sum) + " €").font(.title).padding()
            ScrollView {
                VStack {
                    currencyOptions
                }
            }
            Text(instruction).font(.title).padding()
            Spacer()
        }.padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeView(received: 30)
    }
}
