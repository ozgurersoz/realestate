//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation

extension UIModel {
    public struct Property: Identifiable {
        public let id: String
        public let image: URL?
        public let isHighlighted: Bool
        public let askingPrice: String
        public let livingArea: String
        public let municipality: String
        public let area: String
        public let streetAdress: String
        public let numberOfRooms: String

        public init(
            id: String,
            image: URL?,
            isHighlighted: Bool,
            askingPrice: String,
            livingArea: String,
            municipality: String,
            area: String,
            streetAdress: String,
            numberOfRooms: String
        ) {
            self.id = id
            self.image = image
            self.isHighlighted = isHighlighted
            self.askingPrice = askingPrice
            self.livingArea = livingArea
            self.municipality = municipality
            self.area = area
            self.streetAdress = streetAdress
            self.numberOfRooms = numberOfRooms
        }
        
        public static func map(from dataModel: SearchResultResponse.SearchResultItem.Property, highlighted: Bool) -> Self {
            let roomsString = dataModel.numberOfRooms > 1 ? " Rooms" : " Room"
            return Self(
                id: dataModel.id,
                image: URL(string: dataModel.image),
                isHighlighted: highlighted,
                askingPrice: dataModel.askingPrice.priceLocale(),
                livingArea: String(format: "%g ", dataModel.livingArea) + UnitArea.squareMeters.symbol,
                municipality: dataModel.municipality,
                area: dataModel.area,
                streetAdress: dataModel.streetAddress,
                numberOfRooms: dataModel.numberOfRooms.description + roomsString
            )
        }
    }
}
