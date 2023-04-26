//
//  Copyright © 2023 Cool RealEstate Company AB. All rights reserved.
//

import SwiftUI
import UIComponents
import DataModels
import Dependencies

public struct ItemDetailView: View {
    @StateObject var viewModel: ItemDetailViewModel
    
    public init(viewModel: ItemDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView {
            if let itemDetail = viewModel.itemDetail {
                HeaderView(itemDetail: itemDetail)
                Text(itemDetail.description)
                    .font(.callout)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 15)
                VStack(spacing: 5) {
                    Group {
                        Text("Living area: ").fontWeight(.bold) + Text(itemDetail.livingArea)
                        Text("Number of rooms: ").fontWeight(.bold) + Text(itemDetail.numberOfRooms)
                        Text("Patio: ").fontWeight(.bold) + Text(itemDetail.hasPatio)
                        Text("Day since publish: ").fontWeight(.bold) + Text(itemDetail.daySincePublish)
                    }
                    .font(.callout)
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchItemDetail()
        }
    }
    
    @ViewBuilder
    func HeaderView(itemDetail: UIModel.SearchResult.ItemDetail) -> some View {
        VStack {
            VStack {
                AsyncImageLoaderView(url: itemDetail.image)
                    .aspectRatio(contentMode: .fill)
            }
            .frame(height: 150)
            .clipped()

            VStack(spacing: 5) {
                Group {
                    Text(itemDetail.streetAdress)
                        .font(.headline)
                    Text(itemDetail.area + " " + itemDetail.municipality )
                        .font(.footnote)
                        .foregroundColor(.gray)
                    ZStack {
                        HStack {
                            Text(itemDetail.askingPrice)
                                .font(.headline)
                            Spacer()
                            Text(itemDetail.numberOfRooms)
                        }
                        HStack {
                            Spacer()
                            Text(itemDetail.livingArea)
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

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(
            viewModel: withDependencies({
                $0.searchClient.fetchSearchItemDetail = { id in
                    return .init(
                        id: id,
                        image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Hus_i_svarttorp.jpg/800px-Hus_i_svarttorp.jpg"),
                        type: .area,
                        askingPrice: "15000 kr",
                        livingArea: "120 m2",
                        municipality: "Stockholm",
                        area: "Arsta",
                        streetAdress: "siljansvagen",
                        numberOfRooms: "5 rooms",
                        daySincePublish: "15",
                        hasPatio: "Yes",
                        description: "The living room can be furnished according to your own wishes and tastes, here the whole family can gather and enjoy each other's company. From the living room you reach the terrace overlooking the lush courtyard which is located in undisturbed and secluded location."
                    )
                }
            }, operation: {
                ItemDetailViewModel(itemId: "randomId")
            })
        )
    }
}
