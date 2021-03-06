import PackageDescription

let package = Package(
    name: "SFSmsServer",
    targets: [
        Target(
            name: "MainServer",
            dependencies: ["Helpers"]),
        Target(
            name: "Helpers",
            dependencies: ["Models", "SMSProvider"]),
        Target(
            name: "Models"),
        Target(
            name: "SMSProvider",
            dependencies: ["Models"])
    ],
    dependencies: [
        .Package(url: "http://git.sfdai.com/Kojirou1994/SFMongo.git", versions: Version(0,0,0)..<Version(0,3,0)),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", versions: Version(0,0,0)..<Version(10,0,0)),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-MongoDB.git", versions: Version(0,0,0)..<Version(10,0,0)),
        .Package(url: "http://git.sfdai.com/Kojirou1994/SFCurl.git", versions: Version(0,0,0)..<Version(0,3,0))
    ],
    exclude: ["sdk_20151230"]
)
