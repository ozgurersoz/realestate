//
//  Copyright © 2023 Lvls Digital AB. All rights reserved.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.packageFramework(
    name: "ItemDetailFeature",
    dependencies: [
        .project(
            target: "DataModels",
            path: "../DataModels"
        ),
        .project(
            target: "DesignSystem",
            path: "../DesignSystem"
        ),
        .project(
            target: "UIComponents",
            path: "../UIComponents"
        )
    ]
)
