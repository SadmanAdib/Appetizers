//
//  OrderView.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List {
                        ForEach(order.items) { order in
                            AppetizerListCell(appetizer: order)
                        }
    //                    .onDelete(perform: { indexSet in
    //                        deleteItems(at: indexSet)
    //                    })
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order placed")
                    } label: {
//                        APButton(price: "$\(order.totalPrice, specifier: "%.2f") - Place order")
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                    
                }
                
                if order.items.isEmpty{
                    EmptyState(imageName: "empty-order", description: "There are currently no orders.\nPlease add some appetizers")
                }
                
            }
            .navigationTitle("Orders")
        }
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
