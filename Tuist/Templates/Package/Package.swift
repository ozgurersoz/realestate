import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Package Template",
    attributes: [
        nameAttribute,
        .optional("platform", default: "ios"),
    ],
    items: [
        .file(
            path: "Packages/\(nameAttribute)/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: "Packages/\(nameAttribute)/Sources/\(nameAttribute)View.swift",
            templatePath: "View.stencil"
        ),
        .file(
            path: "Packages/\(nameAttribute)/Tests/\(nameAttribute)Tests.swift",
            templatePath: "TestFile.stencil"
        )
    ]
)
