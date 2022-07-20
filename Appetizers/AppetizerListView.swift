//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView{
            List(MockData.appetizers){ appetizer in
               AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
        }
        
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
