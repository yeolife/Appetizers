//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by yeolife on 9/30/23.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizerData() {
//        isLoading = true
//        NetworkMananger.shared.getAppetizers { [self] result in
//            DispatchQueue.main.sync {
//                isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func getAppetizerData() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkMananger.shared.getAppetizers()
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
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
