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
        NavigationStack {
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("⚽️ Appetizer")
        }
        .onAppear {
            viewModel.getAppetizerData()
        }
    }
}

#Preview {
    AppetizerListView()
}
