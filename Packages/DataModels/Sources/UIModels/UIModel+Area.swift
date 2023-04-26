//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation

extension UIModel {
    public struct Area {
        public let id: String
        public let area: String
        public let ratingFormatted: String
        public let averagePrice: String
        public let image: URL?
        
        public init(id: String, area: String, ratingFormatted: String, averagePrice: String, image: URL?) {
            self.id = id
            self.area = area
            self.ratingFormatted = ratingFormatted
            self.averagePrice = averagePrice
            self.image = image
        }
        
        
        static public func map(from dataModel: SearchResultResponse.SearchResultItem.Area) -> Self {
            return Self(
                id: dataModel.id,
                area: dataModel.area,
                ratingFormatted: dataModel.ratingFormatted,
                averagePrice: dataModel.averagePrice.priceLocale() + " " + UnitArea.squareMeters.symbol,
                image: URL(string: dataModel.image)
            )
        }
    }
}
