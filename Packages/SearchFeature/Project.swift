//
//  Copyright © 2023 Lvls Digital AB. All rights reserved.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.packageFramework(
    name: "SearchFeature",
    includePreviewTarget: false,
    dependencies: [
        .external(name: "Dependencies"),
        .project(
            target: "DataModels",
            path: "../DataModels"
        ),
        .project(
            target: "UIComponents",
            path: "../UIComponents"
        ),
        .project(
            target: "ItemDetailFeature",
            path: "../ItemDetailFeature"
        )
    ]
)
