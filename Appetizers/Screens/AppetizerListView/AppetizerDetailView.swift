//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Sadman Adib on 24/7/22.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    var appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40){
                    NutritionInfo(title: "Calories", amount: appetizer.calories)
                    
                    NutritionInfo(title: "Carbs", amount: appetizer.carbs)
                    
                    NutritionInfo(title: "Protein", amount: appetizer.protein)
                }
                
            }
            
            Spacer()
            
            Button {
                print("Pressed")
            }label: {
                APButton(price: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
            
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetailView = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(false))
    }
}

struct NutritionInfo: View{
    
    let title: String
    let amount: Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .bold()
                .font(.caption)
            Text("\(amount)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
    
}
