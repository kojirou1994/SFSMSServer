import PackageDescription

let package = Package(
    name: "SFSmsServer",
    targets: [
        Target(name: "MainServer", dependencies: [.Target(name: "Helpers")]),
        Target(
            name: "Helpers",
            dependencies: [.Target(name: "Models")]),
        Target(name: "Models")
    ],
    dependencies: [
        .Package(url: "http://git.sfdai.com/Kojirou1994/SFMongo.git", versions: Version(0,0,0)..<Version(0,2,0)),
        .Package(url:"https://github.com/PerfectlySoft/Perfect-HTTPServer.git", versions: Version(0,0,0)..<Version(10,0,0)),
        .Package(url:"https://github.com/PerfectlySoft/Perfect-MongoDB.git", versions: Version(0,0,0)..<Version(10,0,0))
    ]
)
