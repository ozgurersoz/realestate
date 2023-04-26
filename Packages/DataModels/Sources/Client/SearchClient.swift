//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation
import Dependencies

public struct SearchClient {
    public var fetchSearchResult: () async throws -> [UIModel.SearchResult]
    public var fetchSearchItemDetail: (_ id: String)  async throws -> UIModel.SearchResult.ItemDetail
    
    public init(
        fetchSearchResult: @escaping () async throws -> [UIModel.SearchResult],
        fetchSearchItemDetail: @escaping (_ id: String) async throws -> UIModel.SearchResult.ItemDetail
    ) {
        self.fetchSearchResult = fetchSearchResult
        self.fetchSearchItemDetail = fetchSearchItemDetail
    }
}

extension SearchClient: TestDependencyKey {
    public static var testValue: SearchClient {
        return Self(
            fetchSearchResult: {
                [
                    UIModel.SearchResult.property(UIModel.Property(
                        id: "1",
                        image: URL(string: "https://example.com/property1.jpg"),
                        isHighlighted: true,
                        askingPrice: "$500,000",
                        livingArea: "2,000",
                        municipality: "New York City",
                        area: "Manhattan",
                        streetAdress: "123 Main St.",
                        numberOfRooms: "3 Rooms"
                    )),
                    UIModel.SearchResult.property(UIModel.Property(
                        id: "2",
                        image: URL(string: "https://example.com/property2.jpg"),
                        isHighlighted: false,
                        askingPrice: "$350,000",
                        livingArea: "1,500",
                        municipality: "San Francisco",
                        area: "Bay Area",
                        streetAdress: "456 Oak St.",
                        numberOfRooms: "2 Rooms"
                    ))
                ]
            },
            fetchSearchItemDetail: { id in
                UIModel.SearchResult.ItemDetail(
                    id: "56789",
                    image: URL(string: "https://example.com/property2.jpg"),
                    type: .area,
                    askingPrice: "450,000 kr",
                    livingArea: "1,000 m2",
                    municipality: "Chicago",
                    area: "Lakeview",
                    streetAdress: "987 Belmont Ave.",
                    numberOfRooms: "2",
                    daySincePublish: "4 days ago",
                    hasPatio: "Yes",
                    description: "Cozy 2 bedroom townhouse in Lakeview, with a charming patio and easy access to public transportation."
                )
            }
        )
    }
    
    public static var previewValue: SearchClient {
        return Self(
            fetchSearchResult: {
                [
                    UIModel.SearchResult.property(UIModel.Property(
                        id: "1",
                        image: URL(string: "https://example.com/property1.jpg"),
                        isHighlighted: true,
                        askingPrice: "$500,000",
                        livingArea: "2,000",
                        municipality: "New York City",
                        area: "Manhattan",
                        streetAdress: "123 Main St.",
                        numberOfRooms: "3 Rooms"
                    )),
                    UIModel.SearchResult.property(UIModel.Property(
                        id: "2",
                        image: URL(string: "https://example.com/property2.jpg"),
                        isHighlighted: false,
                        askingPrice: "$350,000",
                        livingArea: "1,500",
                        municipality: "San Francisco",
                        area: "Bay Area",
                        streetAdress: "456 Oak St.",
                        numberOfRooms: "2 Rooms"
                    ))
                ]
            },
            fetchSearchItemDetail: { id in
                UIModel.SearchResult.ItemDetail(
                    id: "56789",
                    image: URL(string: "https://example.com/property2.jpg"),
                    type: .area,
                    askingPrice: "450,000 kr",
                    livingArea: "1,000 m2",
                    municipality: "Chicago",
                    area: "Lakeview",
                    streetAdress: "987 Belmont Ave.",
                    numberOfRooms: "2",
                    daySincePublish: "4 days ago",
                    hasPatio: "Yes",
                    description: "Cozy 2 bedroom townhouse in Lakeview, with a charming patio and easy access to public transportation."
                )
            }
        )
    }
}

extension DependencyValues {
    public var searchClient: SearchClient {
        get { self[SearchClient.self] }
        set { self[SearchClient.self] = newValue }
    }
}
