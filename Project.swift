import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "CoolRealEstate",
    organizationName: "CoolRealEstate AB",
    targets: [
        Target(
            name: "CoolRealEstateApp",
            platform: .iOS,
            product: .app,
            bundleId: "se.CoolRealEstate.app",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: [.iphone]),
            infoPlist: .appInfoPlist(),
            sources: ["Targets/CoolRealEstateApp/Sources/**"],
            resources: ["Targets/CoolRealEstateApp/Resources/**"],
            dependencies: [
                .external(name: "Dependencies"),
                .project(
                    target: "SearchFeature",
                    path: "Packages/SearchFeature"
                ),
                .project(
                    target: "DataModels",
                    path: "Packages/DataModels"
                )
            ]
        ),
        Target(
            name: "CoolRealEstateAppTest",
            platform: .iOS,
            product: .unitTests,
            bundleId: "se.CoolRealEstate.app.test",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: [.iphone]),
            infoPlist: .appInfoPlist(),
            sources: ["Targets/CoolRealEstateApp/Tests/**"],
            resources: ["Targets/CoolRealEstateApp/Resources/**"],
            dependencies: [
                .target(name: "CoolRealEstateApp")
            ]
        ),
    ]
)

