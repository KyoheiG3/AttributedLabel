# AttributedLabel

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/AttributedLabel.svg?style=flat)](http://cocoadocs.org/docsets/AttributedLabel)
[![License](https://img.shields.io/cocoapods/l/AttributedLabel.svg?style=flat)](http://cocoadocs.org/docsets/AttributedLabel)
[![Platform](https://img.shields.io/cocoapods/p/AttributedLabel.svg?style=flat)](http://cocoadocs.org/docsets/AttributedLabel)

![Graph](https://github.com/KyoheiG3/assets/blob/master/AttributedLabel/performance_graph.png)

##### Higher performance than `UILabel`.

#### [Appetize's Demo](https://appetize.io/app/7q459fyg56828caye3ucdntqp0)

![Label](https://github.com/KyoheiG3/assets/blob/master/AttributedLabel/label.gif)

##### Customization is easy.

![Customize](https://github.com/KyoheiG3/assets/blob/master/AttributedLabel/customize.gif)

Left tab is customizable label. The center tab AttributedLabel So fast. Right tab is UILabel So slow. Fast more than 10 times from 5 times.

- use the UIlabel

![UILabel](https://github.com/KyoheiG3/assets/blob/master/AttributedLabel/ui_label.png)

- use the AttributedLabel

![AttributedLabel](https://github.com/KyoheiG3/assets/blob/master/AttributedLabel/attributed_label.png)

## How to Install AttributedLabel

### iOS 8+

#### Cocoapods

Add the following to your `Podfile`:

```Ruby
pod "AttributedLabel"
use_frameworks!
```
Note: the `use_frameworks!` is required for pods made in Swift.

#### Carthage

Add the following to your `Cartfile`:

```Ruby
github "KyoheiG3/AttributedLabel"
```

### iOS 7

Just add everything in the `AttributedLabel.swift` file to your project.

## Usage

### import

If target is ios8.0 or later, please import the `AttributedLabel`.

```Swift
import AttributedLabel
```

### Variable

```swift
var numberOfLines: Int
```
* Same as `numberOfLines` of `UILabel`.
* Default is `0`.

```swift
var contentAlignment: AttributedLabel.ContentAlignment
```
* Alignment of content.
* Default is `Left`.

```swift
var padding: CGFloat
```
* `lineFragmentPadding` of `NSTextContainer`.
* default is `0`.

```swift
var font: UIFont
```
* Text font.
* Default is system font 17 plain.

```swift
var lineBreakMode: NSLineBreakMode
```
* Same as `lineBreakMode` of `UILabel`.
* Default is `ByTruncatingTail`.

```swift
var textColor: UIColor?
```
* Default is nil (text draws black).

```swift
var paragraphStyle: NSParagraphStyle?
```
* Default is nil.

```swift
var shadow: NSShadow?
```
* Default is nil.

```swift
var attributedText: NSAttributedString?
```
* Default is nil.

```swift
var text: String?
```
* Default is nil.

### Function

```swift
override func sizeThatFits(size: CGSize) -> CGSize
```
* Same as `sizeThatFits` of `UILabel`.

```swift
override func sizeToFit()
```
* Same as `sizeToFit` of `UILabel`.
* Autolayout doesn't work with `sizeToFit`.

## LICENSE

Under the MIT license. See LICENSE file for details.
