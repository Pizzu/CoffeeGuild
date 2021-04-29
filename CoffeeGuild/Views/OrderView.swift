//
//  OrderView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 24/4/21.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var orderStore : OrderStore = OrderStore()
    
    var body: some View {
        List {
            ForEach(self.orderStore.allOrders, id: \.self) { order in
                NavigationLink(destination: OrderDetailView(order: order)) {
                    VStack(alignment: .leading, spacing: 5.0) {
                        Text(order.orderNumber)
                            .font(.footnote)
                        Text(order.title)
                            .font(.headline)
                        Text(order.creationDate?.getFormattedDate(format: "dd-MM-yyyy") ?? "Date not available.")
                            .font(.caption)
                    }
                }
                .isDetailLink(true)
                .accentColor(.primary)
            }
        }
        .navigationBarTitle("Your orders")
        .onAppear {
            self.orderStore.getAllOrders()
        }
        .onDisappear {
            self.orderStore.detachListener()
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
