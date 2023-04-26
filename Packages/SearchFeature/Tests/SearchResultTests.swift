//
//  Copyright © 2023 Cool RealEstateCompany AB. All rights reserved.
//

import XCTest
import Dependencies
import DataModels
import UIKit
import UIComponents

@testable import SearchFeature

final class SearchResultTests: XCTestCase {

    func testLoadResult() async throws {
        let model = withDependencies {
            $0.searchClient.fetchSearchResult = {
                return mockResult
            }
        } operation: {
            SearchResultViewModel()
        }
        XCTAssertEqual(model.searchResults.count, 0)
        await model.fetchSearchResult()
        XCTAssertEqual(model.searchResults.count, 4)
    }
}

let mockResult = [
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
    )),
    UIModel.SearchResult.area(UIModel.Area(
        id: "3",
        area: "Brooklyn",
        ratingFormatted: "4.5 stars",
        averagePrice: "$600,000",
        image: URL(string: "https://example.com/brooklyn.jpg")
    )),
    UIModel.SearchResult.area(UIModel.Area(
        id: "4",
        area: "Los Angeles",
        ratingFormatted: "4.2 stars",
        averagePrice: "$800,000",
        image: URL(string: "https://example.com/los-angeles.jpg")
    ))
]
