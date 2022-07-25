//
//  OrderView.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orders
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List {
                        ForEach(orderItems) { order in
                            AppetizerListCell(appetizer: order)
                        }
    //                    .onDelete(perform: { indexSet in
    //                        deleteItems(at: indexSet)
    //                    })
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order placed")
                    } label: {
                        APButton(price: "$99.99 - Place order")
                    }
                    .padding(.bottom, 25)
                    
                }
                
                if orderItems.isEmpty{
                    EmptyState(imageName: "empty-order", description: "There are currently no orders.\nPlease add some appetizers")
                }
                
            }
            .navigationTitle("Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
