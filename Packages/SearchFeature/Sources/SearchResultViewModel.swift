//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation
import Dependencies
import DataModels
import ItemDetailFeature

public class SearchResultViewModel: ObservableObject {
    @Dependency(\.searchClient) var searchClient
    
    @Published var searchResults: [UIModel.SearchResult] = []
    @Published var errorText: String = ""
    @Published var isLoading: Bool = false
    @Published var showPropertyDetail: Bool = false
    
    public init() { }
    
    @MainActor
    func fetchSearchResult() async {
        do {
            searchResults = try await searchClient.fetchSearchResult()
        } catch {
            errorText = error.localizedDescription
        }
    }
    
    func prepareItemDetailViewModel(itemId: String) -> ItemDetailViewModel {
        withDependencies(from: self) {
            ItemDetailViewModel(itemId: itemId)
        }
    }
}
