// swift-tools-version: 5.5
/*
 * Copyright 2022 Google LLC
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
  name: "GooglePlacesSwift", platforms: [.iOS(.v14)],
  products: [.library(name: "google_places_swift", targets: ["google_places_swiftTarget"])],
  dependencies: [.package(url: "https://github.com/googlemaps/ios-places-sdk", from: "0.0.0")],
  targets: [
    .binaryTarget(
      name: "google_places_swift",
      url: "https://dl.google.com/geosdk/swiftpm/0.0.0/google_places_swift.xcframework.zip",
      checksum: "90ce3d6a34e92346a7f3badcf723f37c45b6de22fe304bf6845f96c441eb7ad0"
    ),
    .target(
      name: "google_places_swiftTarget",
      dependencies: [
        "google_places_swift",
        .product(name: "GooglePlaces", package: "ios-places-sdk"),
      ],
      path: "GooglePlacesSwift",
      sources: ["Empty.swift"],
      resources: [.copy("Resources/GooglePlacesSwiftResources/GooglePlacesSwift.bundle")],
      publicHeadersPath: "Sources"
    ),
  ]
)
