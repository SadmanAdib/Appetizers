//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.userLocation == nil ? "Locating..." : "Deliver To")
                
                Text(viewModel.userAddress)
                    .font(.caption)
                    .fontWeight(.heavy)
                    .foregroundColor(.brandPrimary)
            }
            ZStack{
                NavigationView{
                    List(viewModel.appetizers){ appetizer in
                        AppetizerListCell(appetizer: appetizer)
                            .onTapGesture {
                                viewModel.selectedAppetizer = appetizer
                                viewModel.isShowingDetailView = true
                            }
                        
                    }
                    .listStyle(.plain)
                    .navigationTitle("Appetizers")
                    .disabled(viewModel.isShowingDetailView)
                }
                .task {
                    viewModel.getAppetizers()
                }
                .blur(radius: viewModel.isShowingDetailView || viewModel.noLocation ? 20 : 0)
                
                if viewModel.isShowingDetailView {
                    AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetailView: $viewModel.isShowingDetailView)
                }
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
        .onAppear {
            //calling location delegate
            viewModel.locationManager.delegate = viewModel
            viewModel.locationManager.requestWhenInUseAuthorization()
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
