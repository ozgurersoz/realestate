//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation

extension UIModel.SearchResult {
    public struct ItemDetail: Identifiable {
        public let id: String
        public let image: URL?
        public let type: ItemType?
        public let askingPrice: String
        public let livingArea: String
        public let municipality: String
        public let area: String
        public let streetAdress: String
        public let numberOfRooms: String
        public let daySincePublish: String
        public let hasPatio: String
        public let description: String

        public init(
            id: String,
            image: URL?,
            type: ItemType?,
            askingPrice: String,
            livingArea: String,
            municipality: String,
            area: String,
            streetAdress: String,
            numberOfRooms: String,
            daySincePublish: String,
            hasPatio: String,
            description: String
        ) {
            self.id = id
            self.image = image
            self.type = type
            self.askingPrice = askingPrice
            self.livingArea = livingArea
            self.municipality = municipality
            self.area = area
            self.streetAdress = streetAdress
            self.numberOfRooms = numberOfRooms
            self.daySincePublish = daySincePublish
            self.hasPatio = hasPatio
            self.description = description
        }
        
        public static func map(from dataModel: SearchItemDetailResponse) -> Self {
            let roomsString = dataModel.numberOfRooms > 1 ? " Rooms" : " Room"
            let dayString = dataModel.daysSincePublish > 1 ? " days" : " day"
            return Self(
                id: dataModel.id,
                image: URL(string: dataModel.image),
                type: ItemType(rawValue: dataModel.type.lowercased()),
                askingPrice: dataModel.askingPrice.priceLocale(),
                livingArea: dataModel.livingArea.description + " " + UnitArea.squareMeters.symbol,
                municipality: dataModel.municipality,
                area: dataModel.area,
                streetAdress: dataModel.streetAddress,
                numberOfRooms: dataModel.numberOfRooms.description + roomsString,
                daySincePublish: dataModel.daysSincePublish.description + dayString,
                hasPatio: dataModel.patio,
                description: dataModel.description
            )
        }
                
        public enum ItemType: String {
            case highlightedProperty = "highlightedproperty"
            case property = "property"
            case area = "area"
        }
    }
}
