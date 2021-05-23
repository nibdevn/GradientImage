# GradientImage

![Swift](https://img.shields.io/badge/Swift-4.2-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/nibdevn/GradientImage/blob/master/LICENSE)


## Summary

- [Requirements](#requirements)
- [Installation](#installation)
- [Property](#property)
- [Usage](#usage)
- [Example](#example)

## Requirements

- Swift 4.2
- iOS 10.0+

## Installation

#### Cocoapods

GradientImage is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GradientImage', :tag => '2.0.0', :git => 'https://github.com/nibdevn/GradientImage'
```

#### Swift Package Manager

You can use The Swift Package Manager to install GradientImage by adding the proper description to your Package.swift file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/nibdevn/GradientImage.git", from: "2.0.0")
    ]
)
```

Next, add GradientImage to your targets dependencies like so:

```swift
.target(
    name: "YOUR_TARGET_NAME",
    dependencies: [
        "GradientImage",
    ]
),
```

Then run swift package update.

## Property

#### layer

> This property is the CAGradient layer used in this object.

```swift
var layer: CAGradientLayer
```

#### frame

> This property is for the frame of the CAGradientLayer.

```swift
var frame: CGRect
```

#### colors
> This property is for CAGradientlayer's colors and is converted to CGColor's Array property.

```swift
var colors: [CGColor]
```

#### locations
> This property is for CAGradientlayer locations.

```swift
var locations: [NSNumber]?
```

#### type

> This property is for the type of CAGradientLayer.

```swift
var type: CAGradientLayerType
```

#### image

> This property is a UI image generated from the value of the CAGradientLayer property.

```swift
public var image: UIImage?
```

#### color

> This property is a UIColor generated from the value of the CAGradientLayer property.

```swift
public var color: UIColor?
```

## Usage

```swift
let gradient = Gradient(frame: CGRect(x: 0, y: 0, width: 100, height: 100), direction: .top, colors: [.black, .clear], locations: [0 , 1])

gradient.setFrame(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    .setDirection(at: .left)
    .setStart(at: CGPoint(x: 0, y: 0))
    .setEnd(at: CGPoint(x: 1, y: 1))
    .setColors(colors: [.blue, .red, .clear])
    .setLocations(locations: [0, 0.5, 1])
    .setType(type: .axial)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

These works are available under the MIT license. See the [LICENSE][license] file
for more info.


[license]: LICENSE
