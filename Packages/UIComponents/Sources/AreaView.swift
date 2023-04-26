//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import SwiftUI
import DataModels

public struct AreaView: View {
    
    let area: UIModel.Area
    
    public init(area: UIModel.Area) {
        self.area = area
    }
    
    public var body: some View {
        VStack(spacing: 5) {
            Text("Area")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                AsyncImageLoaderView(url: area.image!)
                    .aspectRatio(contentMode: .fill)
            }
            .padding(.horizontal, 2)
            .frame(height: 150)
            .clipped()
            Group {
                Text(area.area)
                    .font(.headline)
                Text("Rating: " + area.ratingFormatted)
                    .font(.footnote)
                Text("Average Price: " + area.averagePrice)
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct AreaView_Previews: PreviewProvider {
    static var previews: some View {
        AreaView(
            area: .init(
                id: "someid",
                area: "Stockholm",
                ratingFormatted: "4.5/5",
                averagePrice: "5100 m2",
                image: URL(string: "https://i.imgur.com/v6GDnCG.png")
            )
        )
    }
}
