//
//  EmptyState.swift
//  Appetizers
//
//  Created by Sadman Adib on 25/7/22.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let description: String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(description)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(imageName: "empty-order", description: "This is test description to see the alignment on the line.")
    }
}
