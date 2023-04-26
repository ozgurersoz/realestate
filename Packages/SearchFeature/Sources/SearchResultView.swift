//
//  Copyright © 2023 Cool RealEstate AB. All rights reserved.
//

import SwiftUI
import DataModels
import Dependencies
import DesignSystem
import UIComponents
import ItemDetailFeature

public struct SearchResultView: View {
    @StateObject var viewModel: SearchResultViewModel
    
    public init(viewModel: SearchResultViewModel = SearchResultViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack {
            if viewModel.searchResults.isEmpty == false {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(Array(viewModel.searchResults.enumerated()), id: \.element) { index, item in
                            switch item {
                                case let .property(property):
                                    if index == 0 {
                                        Button(
                                            action: {
                                                viewModel.showPropertyDetail = true
                                            },
                                            label: {
                                                PropertyView(property: property)
                                            }
                                        )
                                        .sheet(isPresented: $viewModel.showPropertyDetail) {
                                            ItemDetailView(viewModel: viewModel.prepareItemDetailViewModel(itemId: property.id))
                                        }
                                    } else {
                                        PropertyView(property: property)
                                    }
                                case .area(let area):
                                    AreaView(area: area)
                            }
                        }
                    }
                }
            } else {
                VStack {
                    Spacer()
                    ProgressView()
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchSearchResult()
            }
        }
        .padding()
    }
}
#if DEBUG
struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(
            viewModel: withDependencies({
                $0.searchClient.fetchSearchResult = {
                    return [
                        .property(
                            .init(
                                id: "someid",
                                image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Hus_i_svarttorp.jpg/800px-Hus_i_svarttorp.jpg"),
                                isHighlighted: true,
                                askingPrice: "55000 kr",
                                livingArea: "20 m2",
                                municipality: "Stockholm",
                                area: "Siljansvagen",
                                streetAdress: "Siljansvage",
                                numberOfRooms: "5 rooms"
                            )
                        )
                    ]
                }
            }, operation: {
                SearchResultViewModel()
            })
        )
    }
}
#endif
