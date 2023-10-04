//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by yeolife on 9/30/23.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
//             위의 방법에 비해 매우 간단하지만 단점으로는 이미지가 캐시되지 않음
//            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 90)
//                    .cornerRadius(8)
//            } placeholder: {
//                Image("emptyList")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 90)
//                    .cornerRadius(8)
//            }

            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppletizer)
}
