// swift-tools-version:5.3
//
//  Package.swift
//

import PackageDescription

let package = Package(
    name: "SKPhotoBrowser",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "SKPhotoBrowserSDK",
            targets: ["SKPhotoBrowserSDK"])
    ],
    targets: [
        .target(
            name: "SKPhotoBrowserSDK",
            dependencies: ["SKPhotoBrowserObjC"],
            path: "SKPhotoBrowser",
            exclude: ["Info.plist",
                      "extensions/ObjC"],
            resources: [
                .copy("SKPhotoBrowser.bundle")
            ]),
        .target(
            name: "SKPhotoBrowserObjC",
            path: "SKPhotoBrowser/extensions/ObjC",
            publicHeadersPath: "."),
        .testTarget(
            name: "SKPhotoBrowserTests",
            dependencies: ["SKPhotoBrowserSDK"],
            path: "SKPhotoBrowserTests",
            exclude: ["Info.plist"]
        )
    ]
)
