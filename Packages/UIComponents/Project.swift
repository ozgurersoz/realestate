//
//  Copyright © 2023 Lvls Digital AB. All rights reserved.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.packageFramework(
    name: "UIComponents",
    dependencies: [
        .project(
            target: "DataModels",
            path: "../DataModels"
        )
    ]
)
