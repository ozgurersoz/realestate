//
//  Copyright © 2023 Cool RealEstateCompany AB. All rights reserved.
//

import XCTest
import Dependencies
import DataModels
import UIKit
import UIComponents

@testable import ItemDetailFeature

final class ItemDetailFeatureTests: XCTestCase {

    func testLoadItemDeyail() async throws {
        let model = withDependencies {
            $0.searchClient.fetchSearchItemDetail = { id in
                UIModel.SearchResult.ItemDetail(
                    id: id,
                    image: URL(string: "https://google.com"),
                    type: .area,
                    askingPrice: "$350,000",
                    livingArea: "1,500 sqft",
                    municipality: "San Francisco",
                    area: "Bayview",
                    streetAdress: "123 Main St.",
                    numberOfRooms: "3",
                    daySincePublish: "2 days ago",
                    hasPatio: "Yes",
                    description: "Charming 3 bedroom house in the Bayview neighborhood, with a beautiful patio."
                )
            }
        } operation: {
            ItemDetailViewModel(itemId: "12345")
        }
        
        await model.fetchItemDetail()
        XCTAssertEqual(model.itemId, "12345")
    }
}
