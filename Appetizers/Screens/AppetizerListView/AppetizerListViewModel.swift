//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    
    //    func getAppetizers(){
    //        isLoading = true
    //        NetworkManager.shared.getAppetizers{ result in
    //            DispatchQueue.main.async { [self] in
    //                isLoading = false
    //                switch result {
    //                case .success(let appetizers):
    //                    self.appetizers = appetizers
    //                case.failure(let error):
    //                    switch error {
    //                    case .invalidData:
    //                        alertItem = AlertContext.invalidData
    //                    case .invalidURL:
    //                        alertItem = AlertContext.invalidURL
    //                    case .invalidResponse:
    //                        alertItem = AlertContext.invalidResponse
    //                    case .unableToComplete:
    //                        alertItem = AlertContext.unableToComplete
    //                    }
    //                }
    //            }
    //
    //        }
    //    }
    
    func getAppetizers(){
        isLoading = true
        
        Task {
            
            do {
                appetizers = try await NetworkManager.shared.getAppetizers() // if here error is thrown (referencing to the NetworkManager) then it goes to the catch block
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse // here we are using invalidResponse as a generic error (general error)
                }
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
            
        }
        
    }
    
}
