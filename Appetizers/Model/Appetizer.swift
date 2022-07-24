//
//  Appetizer.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request : [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 001, name: "Test Appetizer", description: "This is description", price: 10.50, imageURL: "", calories: 99, protein: 99, carbs: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
}


