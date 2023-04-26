//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import SwiftUI
import Foundation
import DataModels

public struct PropertyView: View {
    var property: UIModel.Property
    
    public init(property: UIModel.Property) {
        self.property = property
    }
    
    public var body: some View {
        VStack {
            VStack {
                AsyncImageLoaderView(url: property.image!)
                    .aspectRatio(contentMode: .fill)
            }
            .padding(.horizontal, 2)
            .frame(height: 150)
            .clipped()
            .background(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.yellow, lineWidth: property.isHighlighted ? 4 : 0)
            )
            VStack(spacing: 5) {
                Group {
                    Text(property.streetAdress)
                        .font(.headline)
                    Text(property.area + " " + property.municipality )
                        .font(.footnote)
                        .foregroundColor(.gray)
                    ZStack {
                        HStack {
                            Text(property.askingPrice)
                                .font(.headline)
                            Spacer()
                            Text(property.numberOfRooms)
                        }
                        HStack {
                            Spacer()
                            Text(property.livingArea)
                                .frame(minWidth: 30)
                            Spacer()
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(height: 250)
        
    }
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyView(
            property: UIModel.Property(
                id: "someId",
                image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Hus_i_svarttorp.jpg/800px-Hus_i_svarttorp.jpg"),
                isHighlighted: true,
                askingPrice: "3000000",
                livingArea: "120",
                municipality: "Stockholm",
                area: "Årsta",
                streetAdress: "Siljansvägen, 60",
                numberOfRooms: "5"
            )
        )
    }
}
