//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation
import SwiftUI

public struct AsyncImageLoaderView: View {
    
    @StateObject private var loader = ImageLoader()
    private let url: URL?
    private let placeholder: Image

    public init(url: URL?, placeholder: Image = Image(systemName: "photo")) {
        self.url = url
        self.placeholder = placeholder
    }

    public var body: some View {
        Group {
            if let url {
                if let image = loader.image {
                    Image(uiImage: image)
                        .resizable()
                } else {
                    ProgressView()
                }
            } else {
                placeholder
            }
        }
        .onAppear {
            Task {
                if let url {
                    await loader.load(url: url)
                }
            }
        }
        .onDisappear {
            loader.cancel()
        }
    }
}
