// swift-tools-version: 5.5
/*
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import PackageDescription

let package = Package(
  name: "GooglePlacesSwift", platforms: [.iOS(.v15)],
  products: [.library(name: "GooglePlacesSwift", targets: ["GooglePlacesSwiftTarget"])],
  dependencies: [.package(url: "https://github.com/googlemaps/ios-places-sdk", from: "9.1.0")],
  targets: [
    .binaryTarget(
      name: "GooglePlacesSwift",
      url: "https://dl.google.com/geosdk/swiftpm/0.1.0/google_places_swift.xcframework.zip",
      checksum: "0b1daed4bff0d629fe9f939577b16a985ccbb8af9df42d5682ff09a22cf619b4"
    ),
    .target(
      name: "GooglePlacesSwiftTarget",
      dependencies: [
        "GooglePlacesSwift",
        .product(name: "GooglePlaces", package: "ios-places-sdk"),
      ],
      path: "PlacesSwift",
      sources: ["Empty.swift"],
      resources: [.copy("Resources/GooglePlacesSwiftResources/GooglePlacesSwift.bundle")],
      publicHeadersPath: "Sources"
    ),
  ]
)
