//
//  OrderDetailView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 29/4/21.
//

import SwiftUI

struct OrderDetailView: View {
    
    var order : Order
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                VStack(spacing: 20.0) {
                    VStack {
                        Image("LogoIllustration")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                    .frame(width: 150, height: 150)
                    .background(Color("Brownie Dark"))
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0.0, y: 10)
                    
                    VStack(spacing: 8) {
                        Text("Coffee Guild Order")
                            .font(.title)
                        
                        Text("No. \(self.order.orderNumber)")
                            .font(.headline)
                        
                        Text(order.creationDate?.getFormattedDate(format: "dd-MM-yyyy") ?? "Date not available.")
                            .font(.headline)
                    }
                }
                
                LazyVStack {
                    ForEach(self.order.items, id: \.self) { item in
                        HStack {
                            Text(item["title"] ?? "")
                                .font(.headline)
                        
                            Spacer()
                            
                            Text("x\(item["quantity"] ?? "")")
                                .font(.headline)
                                .fontWeight(.light)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        
                        Divider()
                    }
                }
                
                Text("Total: \(String(format: "$%.2f", self.order.totalAmount))")
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            .frame(maxWidth: .infinity)
        }
    }
}
