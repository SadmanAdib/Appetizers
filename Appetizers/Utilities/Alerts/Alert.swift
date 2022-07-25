//
//  Alert.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import SwiftUI

struct AlertItem: Identifiable{
    
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
}

struct AlertContext {
    
    //MARK: - Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data recieved from the server was invalid. Please contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later or contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting to the server. Please contact support"), dismissButton: .default(Text("OK")))

    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request at this time. Please check your internet connection"), dismissButton: .default(Text("OK")))
    
    
    //MARK: - Account Form Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please fill all the fields"), dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Please put a valid email"), dismissButton: .default(Text("OK")))
    
    
    static let userSavingSuccess = AlertItem(title: Text("Profile saved!"), message: Text("You information was saved successfully!"), dismissButton: .default(Text("OK")))
    static let invalidUserData = AlertItem(title: Text("Profile failed to save!"), message: Text("There was an error saving or retrieving your profile"), dismissButton: .default(Text("OK")))
}
