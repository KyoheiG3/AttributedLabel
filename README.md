# AttributedLabel

[![Build Status](https://travis-ci.org/KyoheiG3/AttributedLabel.svg?branch=master)](https://travis-ci.org/KyoheiG3/AttributedLabel)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/AttributedLabel.svg?style=flat)](http://cocoadocs.org/docsets/AttributedLabel)
[![License](https://img.shields.io/cocoapods/l/AttributedLabel.svg?style=flat)](http://cocoadocs.org/docsets/AttributedLabel)
[![Platform](https://img.shields.io/cocoapods/p/AttributedLabel.svg?style=flat)](http://cocoadocs.org/docsets/AttributedLabel)

![Graph](https://user-images.githubusercontent.com/5707132/33195812-1a93b3ac-d11e-11e7-89de-f5b5d21ac4a8.png)

##### Higher performance than `UILabel`.

#### [Appetize's Demo](https://appetize.io/app/7q459fyg56828caye3ucdntqp0)

![Label](https://user-images.githubusercontent.com/5707132/33195811-182c5128-d11e-11e7-8945-0c4244429e19.gif)

## Overview

This is a better performance than `UILabel` and can be used like a standard UI component.
Also, Easier to use than `UILabel`.

Since `UIView` is inherited instead of `UILabel`, there is little wasteful processing.
It uses the function of TextKit to draw characters.

However, please note that content layout is not done automatically.
If want to automatically fix the height of the content, set `usesIntrinsicContentSize` to `true`.

##### Customization is easy.

![Customize](https://user-images.githubusercontent.com/5707132/33195810-159c27bc-d11e-11e7-9a8b-45c9c20567fd.gif)

Left tab is customizable label. The center tab AttributedLabel So fast. Right tab is UILabel So slow. Fast more than 10 times from 5 times.

- use the UIlabel

![UILabel](https://user-images.githubusercontent.com/5707132/33195814-1d55f622-d11e-11e7-8e8a-71ac9bc72375.png)

- use the AttributedLabel

![AttributedLabel](https://user-images.githubusercontent.com/5707132/33195809-138ddda8-d11e-11e7-80fe-1ee33441d4b8.png)
!
## Requirements

- Swift 5.0
- iOS 7.0 or later
- tvOS 9.0 or later

## How to Install AttributedLabel

### iOS 8+, tvOS

#### CocoaPods

Add the following to your `Podfile`:

```Ruby
pod "AttributedLabel"
```

#### Carthage

Add the following to your `Cartfile`:

```Ruby
github "KyoheiG3/AttributedLabel"
```

### iOS 7

Just add everything in the `AttributedLabel.swift` file to your project.

## Usage

### Variable

```swift
var numberOfLines: Int
```
- Same as `numberOfLines` of `UILabel`.
- Default is `0`.

```swift
var contentAlignment: AttributedLabel.ContentAlignment
```
- Alignment of content.
- Default is `left`.

```swift
@IBInspectable var padding: CGFloat
```
- `lineFragmentPadding` of `NSTextContainer`.
- default is `0`.

```swift
var font: UIFont
```
- Text font.
- Default is system font 17 plain.

```swift
var lineBreakMode: NSLineBreakMode
```
- Same as `lineBreakMode` of `UILabel`.
- Default is `ByTruncatingTail`.

```swift
@IBInspectable var textColor: UIColor?
```
- Default is nil (text draws black).

```swift
var paragraphStyle: NSParagraphStyle?
```
- Default is nil.

```swift
var shadow: NSShadow?
```
- Default is nil.

```swift
var attributedText: NSAttributedString?
```
- Default is nil.

```swift
@IBInspectable var text: String?
```
- Default is nil.

```swift
var usesIntrinsicContentSize: Bool
```
- If need to use intrinsicContentSize set true.
- Should call invalidateIntrinsicContentSize when intrinsicContentSize is cached. When text was changed for example.
- Default is `false`.

```swift
var preferredMaxLayoutWidth: CGFloat
```
- Support for constraint-based layout (auto layout)
- If nonzero, this is used when determining intrinsicContentSize for multiline labels

### Function

```swift
override func sizeThatFits(size: CGSize) -> CGSize
```
- Same as `sizeThatFits` of `UILabel`.

```swift
override func sizeToFit()
```
- Fit like `UILabel`.

## Author

#### Kyohei Ito

- [GitHub](https://github.com/kyoheig3)
- [Twitter](https://twitter.com/kyoheig3)

Follow me 🎉

## LICENSE

Under the MIT license. See LICENSE file for details.
