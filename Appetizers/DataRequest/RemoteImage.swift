//
//  RemoteImage.swift
//  Appetizers
//
//  Created by yeolife on 10/2/23.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkMananger.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("emptyList").resizable() // 3
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image) // 2
            .onAppear{ imageLoader.load(fromURLString: urlString) } // 1
    }
}
