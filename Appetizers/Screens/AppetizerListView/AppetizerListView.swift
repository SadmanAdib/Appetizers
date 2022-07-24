//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Sadman Adib on 20/7/22.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State var isShowingDetailView = false
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                   AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            isShowingDetailView = true
                        }
                }
                .navigationTitle("Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            
            if isShowingDetailView {
                AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: $isShowingDetailView)
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
