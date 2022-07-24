//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var isShowingDetailView = false
    @State private var selectedAppetizer: Appetizer?
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                   AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetailView = true
                        }
                }
                .navigationTitle("Appetizers")
                .disabled(isShowingDetailView)
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius: isShowingDetailView ? 20 : 0)
            
            if isShowingDetailView {
                AppetizerDetailView(appetizer: selectedAppetizer!, isShowingDetailView: $isShowingDetailView)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
