//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import Foundation

extension Double {
    func priceLocale() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "sv_SE")
        return formatter.string(from: NSDecimalNumber(value: self))!
    }
}
