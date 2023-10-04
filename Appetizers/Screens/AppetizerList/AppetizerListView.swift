//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by yeolife on 9/30/23.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
//                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("⚽️ Appetizer")
                .disabled(viewModel.isShowingDetail)
            }
            .task {
                viewModel.getAppetizerData()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if(viewModel.isShowingDetail) {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowDetail: $viewModel.isShowingDetail)
            }
            
            if(!viewModel.isLoading) {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
