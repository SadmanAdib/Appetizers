//
//  APButton.swift
//  Appetizers
//
//  Created by Sadman Adib on 24/7/22.
//

import SwiftUI

struct APButton: View {
    
    let price: LocalizedStringKey
    
    var body: some View {
        Text(price)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(price: "99 - Add to Order")
    }
}
