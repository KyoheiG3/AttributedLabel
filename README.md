# AttributedLabel

[![Build Status](https://travis-ci.org/KyoheiG3/AttributedLabel.svg?branch=master)](https://travis-ci.org/KyoheiG3/AttributedLabel)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/AttributedLabel.svg?style=flat)](http://cocoadocs.org/docsets/AttributedLabel)
[![License](https://img.shields.io/cocoapods/l/AttributedLabel.svg?style=flat)](http://cocoadocs.org/docsets/AttributedLabel)
[![Platform](https://img.shields.io/cocoapods/p/AttributedLabel.svg?style=flat)](http://cocoadocs.org/docsets/AttributedLabel)

![Graph](https://github.com/KyoheiG3/assets/blob/master/AttributedLabel/performance_graph.png)

##### Higher performance than `UILabel`.

#### [Appetize's Demo](https://appetize.io/app/7q459fyg56828caye3ucdntqp0)

![Label](https://github.com/KyoheiG3/assets/blob/master/AttributedLabel/label.gif)

## Overview

This is a better performance than `UILabel` and can be used like a standard UI component.
Also, Easier to use than `UILabel`.

Since `UIView` is inherited instead of `UILabel`, there is little wasteful processing.
It uses the function of TextKit to draw characters.

However, please note that content layout is not done automatically.
If want to automatically fix the height of the content, set `usesIntrinsicContentSize` to `true`.

Even if set it to true, the width of the content depends on the content frame.
Even if specify an ambiguous width in Interface Builder, the width does not automatically fit.

##### Customization is easy.

![Customize](https://github.com/KyoheiG3/assets/blob/master/AttributedLabel/customize.gif)

Left tab is customizable label. The center tab AttributedLabel So fast. Right tab is UILabel So slow. Fast more than 10 times from 5 times.

- use the UIlabel

![UILabel](https://github.com/KyoheiG3/assets/blob/master/AttributedLabel/ui_label.png)

- use the AttributedLabel

![AttributedLabel](https://github.com/KyoheiG3/assets/blob/master/AttributedLabel/attributed_label.png)

## Requirements

- Swift 4.0
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
- Must specify width of Label yourself because this change only height automatically.
- Should call invalidateIntrinsicContentSize when intrinsicContentSize is cached. When text was changed for example.
- Default is `false`.

### Function

```swift
override func sizeThatFits(size: CGSize) -> CGSize
```
- Same as `sizeThatFits` of `UILabel`.

```swift
override func sizeToFit()
```
- Fit like `UILabel`.
- The width of the content depends on the content frame.

## Author

#### Kyohei Ito

- [GitHub](https://github.com/kyoheig3)
- [Twitter](https://twitter.com/kyoheig3)

Follow me 🎉

## LICENSE

Under the MIT license. See LICENSE file for details.
