// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "XMTP",
	platforms: [.iOS(.v14), .macOS(.v11)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "XMTP",
			targets: ["XMTP"]
		),
		.library(
			name: "XMTPTestHelpers",
			targets: ["XMTPTestHelpers"]
		),
	],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
		// .package(url: /* package url */, from: "1.0.0"),

		.package(url: "https://github.com/GigaBitcoin/secp256k1.swift.git", exact: "0.10.0"),
		.package(url: "https://github.com/argentlabs/web3.swift", from: "0.9.3"),
		.package(url: "https://github.com/1024jp/GzipSwift", from: "5.2.0"),
		.package(url: "https://github.com/bufbuild/connect-swift", exact: "0.3.0"),
		.package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.0.0"),
		.package(url: "https://github.com/xmtp/xmtp-rust-swift", branch: "main"),
	],
	targets: [
		// Targets are the basic building blocks of a package. A target can define a module or a test suite.
		// Targets can depend on other targets in this package, and on products in packages this package depends on.
		.target(
			name: "XMTP",
			dependencies: [
				.product(name: "secp256k1", package: "secp256k1.swift"),
				"web3.swift",
				.product(name: "Gzip", package: "GzipSwift"),
				.product(name: "Connect", package: "connect-swift"),
				.product(name: "XMTPRust", package: "xmtp-rust-swift"),
			]
		),
		.target(
			name: "XMTPTestHelpers",
			dependencies: ["XMTP"]
		),
		.testTarget(
			name: "XMTPTests",
			dependencies: ["XMTP", "XMTPTestHelpers"]
		),
	]
)
