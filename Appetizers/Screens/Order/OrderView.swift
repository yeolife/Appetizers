//
//  OrderView.swift
//  Appetizers
//
//  Created by yeolife on 9/30/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order placed")
                    } label: {
                        // APButton(title: .modifier(StandardButtonStyle))
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "emptyList",
                               message: "You have no items in your order.\n Please add an appetizer!")
                }
            }
            
            .navigationTitle("⚾️ Orders")
        }
    }
}

#Preview {
    OrderView()
}
