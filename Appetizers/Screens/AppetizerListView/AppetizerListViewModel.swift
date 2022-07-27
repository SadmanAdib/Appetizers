//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import SwiftUI
import CoreLocation

@MainActor final class AppetizerListViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    
    @Published var locationManager = CLLocationManager()
    @Published var userLocation: CLLocation!
    @Published var userAddress = ""
    @Published var noLocation = true
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        //checking location access
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            print("authorized")
            self.noLocation = false
            manager.requestLocation()
        case .denied:
            print("denied")
            self.noLocation = true
        default:
            print("unknown")
            //direct call
            //locationManager.requestWhenInUseAuthorization()
        }
    }
    
    nonisolated func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //reading user location and updating details
        self.userLocation = locations.last
        self.extractLocation()
    }
    
    func extractLocation(){
        
        CLGeocoder().reverseGeocodeLocation(self.userLocation) { (res, err) in
            
            guard let safeData = res else {return}
            
            var address = ""
            
            // getting area and locality name
            address += safeData.first?.name ?? ""
            address += ", "
            address += safeData.first?.locality ?? ""
            
            self.userAddress = address
        }
        
    }
    
    
    
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
