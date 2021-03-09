# Google Analytics XCFramework
This is an xcframework wrapper around Google's Analytics framework for use in lagacy projects that cannot implement Firebase for technical or business reasons. Below, you'll find the steps used to create the framework vended in this repository. Feel free to use the xcframework hosted in the release, or rebuild your own using the following steps.

> **Note:** The GoogleAnalytics SDK packaged here has not been updated in a while. As a result, I do not guarauntee any maintenance of this SDK. Google does not recommend use of this SDK for new projects. If starting a new project, consider using [Firebase](https://github.com/firebase/firebase-ios-sdk).

## Step 1: Download the Framework
The framework vended is a copy of the [Google Analytics Services SDK](https://developers.google.com/analytics/devguides/collection/ios/v3/sdk-download) version 3.17. Details surrounding the SDK can be found in the above link, however I've found that attempting to download the SDK through the provided links provide 404's. I've found that the project has been merged with the Google Tag Manager project, and download links can be found [here](https://developers.google.com/tag-manager/ios/downloads).

Follow the directions in the [Google Analytics Services SDK](https://developers.google.com/analytics/devguides/collection/ios/v3/sdk-download) page to integrate this into a new Xcode project.

## Step 2: Archive the project
You will need to generate two archives of the project, one for iOS and one for iOS Simulators. I used the following commands to generate these archives for a scheme entitled `GoogleAnalytics`.

```bash
$ xcodebuild archive \
-scheme GoogleAnalytics \
-destination "generic/platform=iOS" \
-archivePath ./build/GoogleAnalytics-iOS \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
```

```bash
$ xcodebuild archive \
-scheme GoogleAnalytics \
-destination "generic/platform=iOS Simulator" \
-archivePath ./build/GoogleAnalytics-Sim \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
```

## Step 3: 
Combine the two products into an xcframework.

```bash
$ xcodebuild -create-xcframework \
-framework ./build/GoogleAnalytics-iOS.xcarchive/Products/Library/Frameworks/GoogleAnalytics.framework \
-framework ./build/GoogleAnalytics-Sim.xcarchive/Products/Library/Frameworks/GoogleAnalytics.framework \
-output ./frameworks/GoogleAnalytics.xcframework
```

The output `GoogleAnalytics.xcframework` is ready to be used in a Swift Package Manager application. 

## Step 4: Import into SPM Application
In your Swift Package Manager application, add a new binary target in your list of targets and use the checksum listed below.

```swift
.binaryTarget(
  name: "GoogleAnalytics",
  url: "https://github.com/schrismartin/google-analytics-xcframework/raw/main/frameworks/GoogleAnalytics.xcframework.zip",
  checksum: "993fbb4f6d6763322e11be3bfd15a8bee50c90a7c5e263c800aea1d7f7732c01"
)
```
