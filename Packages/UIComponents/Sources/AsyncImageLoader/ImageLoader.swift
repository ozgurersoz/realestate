//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import SwiftUI
import Foundation

class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private var task: URLSessionDataTask?

    @MainActor
    func load(url: URL) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let loadedImage = UIImage(data: data) {
                self.image = loadedImage
            }
        } catch {
            print("Error loading image: \(error)")
            // Handle error if needed
        }
    }

    func cancel() {
        task?.cancel()
    }
}
