//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import SwiftUI

struct AppetizerListCell: View {
    
    var appetizer: Appetizer
    
    var body: some View {
        HStack{
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5){
                
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            
        }

    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}