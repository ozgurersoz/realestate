//
//  Dependencies.swift
//  Config
//
//  Created by Ozgur Ersoz on 2023-04-25.
//

import Foundation

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .package(url: "https://github.com/pointfreeco/swift-dependencies", .upToNextMajor(from: "0.1.0")),
        ],
        productTypes: [
            "Dependencies": .framework,
            "XCTestDynamicOverlay": .framework,
            "Clocks": .framework,
            "CombineSchedulers": .framework
        ]
    ),
    platforms: [.iOS]
)
