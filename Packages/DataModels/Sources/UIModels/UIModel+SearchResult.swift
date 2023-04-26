//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation

extension UIModel {
    public enum SearchResult: Identifiable, Hashable {
        public var id: String {
            switch self {
                case let.property(p):
                    return p.id
                case .area(let area):
                    return area.id
            }
        }
        
        case property(UIModel.Property)
        case area(UIModel.Area)
        
        public static func == (lhs: UIModel.SearchResult, rhs: UIModel.SearchResult) -> Bool {
            lhs.id == rhs.id
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(self.id)
        }
    }
}

