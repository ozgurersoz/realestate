//
//  PropertyClient+Live.swift
//  CoolRealEstateApp
//
//  Created by Ozgur Ersoz on 2023-04-25.
//  Copyright © 2023 CoolRealEstate AB. All rights reserved.
//

import Foundation
import DataModels
import Dependencies

extension SearchClient: DependencyKey {
    
    public static var liveValue: SearchClient {
        let networkManager = NetworkManager()
        
        return Self(
            fetchSearchResult: {
                let response = try await networkManager.performRequest(
                    path: "raw/nH5NinBi",
                    method: .get,
                    responseType: SearchResultResponse.self
                )
                let listingItems = response.items.map { type -> UIModel.SearchResult in
                    switch type {
                        case let .area(areaDataModel):
                            let areaUIModel = UIModel.Area.map(from: areaDataModel)
                            return .area(areaUIModel)
                        case let .property(propertyDataModel):
                            let propertyUIModel = UIModel.Property.map(
                                from: propertyDataModel,
                                highlighted: false
                            )
                            return .property(propertyUIModel)
                        case let .hightlightedProperty(propertyDataModel):
                            let propertyUIModel = UIModel.Property.map(
                                from: propertyDataModel,
                                highlighted: true
                            )
                            return .property(propertyUIModel)
                    }
                }
                return listingItems
            },
            fetchSearchItemDetail: { id in
                let response = try await networkManager.performRequest(
                    path: "raw/uj6vtukE",
                    method: .get,
                    responseType: SearchItemDetailResponse.self
                )
                
                let uiModel = UIModel.SearchResult.ItemDetail.map(from: response)
                return uiModel
            }
        )
    }
}

