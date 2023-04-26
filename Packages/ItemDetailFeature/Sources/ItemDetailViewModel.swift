//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation
import DataModels
import Dependencies

public class ItemDetailViewModel: ObservableObject {
    @Dependency(\.searchClient) var searchClient
    @Published var itemDetail: UIModel.SearchResult.ItemDetail?
    @Published var errorText: String = ""
    
    let itemId: String
        
    public init(itemId: String) {
        self.itemId = itemId
    }
    
    @MainActor
    func fetchItemDetail() {
        Task {
            do {
                itemDetail = try await searchClient.fetchSearchItemDetail(itemId)
            } catch {
                errorText = error.localizedDescription
            }
        }
    }
}
