//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation

public struct SearchItemDetailResponse: Decodable {
    public let id: String
    public let type: String
    public let askingPrice: Double
    public let municipality: String
    public let area: String
    public let daysSincePublish: Int
    public let livingArea: Int
    public let numberOfRooms: Int
    public let streetAddress: String
    public let image: String
    public let description: String
    public let patio: String
    
    public init(
        id: String,
        type: String,
        askingPrice: Double,
        municipality: String,
        area: String,
        daysSincePublish: Int,
        livingArea: Int,
        numberOfRooms: Int,
        streetAddress: String,
        image: String,
        description: String,
        patio: String
    ) {
        self.id = id
        self.type = type
        self.askingPrice = askingPrice
        self.municipality = municipality
        self.area = area
        self.daysSincePublish = daysSincePublish
        self.livingArea = livingArea
        self.numberOfRooms = numberOfRooms
        self.streetAddress = streetAddress
        self.image = image
        self.description = description
        self.patio = patio
    }
}
