//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation

extension SearchResultResponse {
    public enum SearchResultItem: Decodable {
        case property(Property)
        case hightlightedProperty(Property)
        case area(Area)
        
        enum CodingKeys: String, CodingKey {
            case type
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(String.self, forKey: .type)
            
            let singleValueContainer = try decoder.singleValueContainer()
            switch type.lowercased() {
                case "property":
                    let property = try singleValueContainer.decode(Property.self)
                    self = .property(property)
                case "highlightedproperty":
                    let highlightedProperty = try singleValueContainer.decode(Property.self)
                    self = .hightlightedProperty(highlightedProperty)
                case "area":
                    let area = try singleValueContainer.decode(Area.self)
                    self = .area(area)
                default:
                    throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Invalid type")
            }
        }
    }
}

extension SearchResultResponse.SearchResultItem {
    
    public struct Property: Decodable {
        public let id: String
        public let askingPrice: Double
        public let monthlyFee: Double?
        public let municipality: String
        public let area: String
        public let daysSincePublish: Int
        public let livingArea: Double
        public let numberOfRooms: Int
        public let streetAddress: String
        public let image: String
        
        init(id: String, askingPrice: Double, monthlyFee: Double?, municipality: String, area: String, daysSincePublish: Int, livingArea: Double, numberOfRooms: Int, streetAddress: String, image: String) {
            self.id = id
            self.askingPrice = askingPrice
            self.monthlyFee = monthlyFee
            self.municipality = municipality
            self.area = area
            self.daysSincePublish = daysSincePublish
            self.livingArea = livingArea
            self.numberOfRooms = numberOfRooms
            self.streetAddress = streetAddress
            self.image = image
        }
    }
    
    public struct Area: Decodable {
        public let id: String
        public let area: String
        public let ratingFormatted: String
        public let averagePrice: Double
        public let image: String
        
        public init(id: String, area: String, ratingFormatted: String, averagePrice: Double, image: String) {
            self.id = id
            self.area = area
            self.ratingFormatted = ratingFormatted
            self.averagePrice = averagePrice
            self.image = image
        }
    }
    
}

