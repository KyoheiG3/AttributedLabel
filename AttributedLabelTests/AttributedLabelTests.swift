//
//  AttributedLabelTests.swift
//  AttributedLabelTests
//
//  Created by Kyohei Ito on 2017/09/21.
//  Copyright © 2017年 Kyohei Ito. All rights reserved.
//

import XCTest
@testable import AttributedLabel

class AttributedLabelTests: XCTestCase {
    let string = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."

    func testContentAlignment() {
        typealias alignment = AttributedLabel.ContentAlignment
        let vSize = CGSize(width: 200, height: 200)
        let cSize = CGSize(width: 100, height: 100)

        XCTAssertEqual(alignment.center.alignOffset(viewSize: vSize, containerSize: cSize), CGPoint(x: 50, y: 50))
        XCTAssertEqual(alignment.top.alignOffset(viewSize: vSize, containerSize: cSize), CGPoint(x: 50, y: 0))
        XCTAssertEqual(alignment.bottom.alignOffset(viewSize: vSize, containerSize: cSize), CGPoint(x: 50, y: 100))
        XCTAssertEqual(alignment.left.alignOffset(viewSize: vSize, containerSize: cSize), CGPoint(x: 0, y: 50))
        XCTAssertEqual(alignment.right.alignOffset(viewSize: vSize, containerSize: cSize), CGPoint(x: 100, y: 50))
        XCTAssertEqual(alignment.topLeft.alignOffset(viewSize: vSize, containerSize: cSize), CGPoint(x: 0, y: 0))
        XCTAssertEqual(alignment.topRight.alignOffset(viewSize: vSize, containerSize: cSize), CGPoint(x: 100, y: 0))
        XCTAssertEqual(alignment.bottomLeft.alignOffset(viewSize: vSize, containerSize: cSize), CGPoint(x: 0, y: 100))
        XCTAssertEqual(alignment.bottomRight.alignOffset(viewSize: vSize, containerSize: cSize), CGPoint(x: 100, y: 100))
    }

    func testProperties() {
        let attributedLabel = AttributedLabel(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))

        attributedLabel.text = string
        XCTAssertEqual(attributedLabel.text, string)
        XCTAssertEqual(attributedLabel.attributedText?.string, string)
        XCTAssertEqual(attributedLabel.mergedAttributedText?.string, string)

        attributedLabel.text = nil
        XCTAssertEqual(attributedLabel.text, nil)
        XCTAssertEqual(attributedLabel.attributedText, nil)
        XCTAssertEqual(attributedLabel.mergedAttributedText, nil)

        attributedLabel.attributedText = NSAttributedString(string: string)
        XCTAssertEqual(attributedLabel.text, string)
        XCTAssertEqual(attributedLabel.attributedText?.string, string)
        XCTAssertEqual(attributedLabel.mergedAttributedText?.string, string)
    }

    func testContentSize() {
        let attributedLabel = AttributedLabel(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        let tallestSize = CGSize(width: attributedLabel.bounds.width, height: CGFloat.greatestFiniteMagnitude)

        attributedLabel.usesIntrinsicContentSize = true
        XCTAssertEqual(attributedLabel.intrinsicContentSize, .zero)
        XCTAssertEqual(attributedLabel.sizeThatFits(tallestSize), .zero)

        let attrString = NSMutableAttributedString(string: string)

        attrString.addAttribute(.font, attr: UIFont.systemFont(ofSize: 10))
        attrString.addAttribute(.font, attr: UIFont.systemFont(ofSize: 11))
        attrString.addAttribute(.font, attr: UIFont.systemFont(ofSize: 12))
        attrString.addAttribute(.font, attr: UIFont.systemFont(ofSize: 13))
        attrString.addAttribute(.font, attr: UIFont.systemFont(ofSize: 14))
        attrString.addAttribute(.paragraphStyle, attr: NSParagraphStyle.random())
        attrString.addAttribute(.paragraphStyle, attr: NSParagraphStyle.random())
        attrString.addAttribute(.paragraphStyle, attr: NSParagraphStyle.random())
        attrString.addAttribute(.paragraphStyle, attr: NSParagraphStyle.random())
        attrString.addAttribute(.paragraphStyle, attr: NSParagraphStyle.random())
        attributedLabel.attributedText = attrString

        XCTAssertEqual(attributedLabel.intrinsicContentSize, attributedLabel.sizeThatFits(tallestSize))

        attributedLabel.usesIntrinsicContentSize = false
        XCTAssertEqual(attributedLabel.intrinsicContentSize, attributedLabel.bounds.size)

        attributedLabel.usesIntrinsicContentSize = true
        XCTAssertNotEqual(attributedLabel.intrinsicContentSize, attributedLabel.bounds.size)

        attributedLabel.sizeToFit()
        XCTAssertEqual(attributedLabel.intrinsicContentSize, attributedLabel.bounds.size)
    }

    func testMergeAttributes() {
        let font = UIFont.systemFont(ofSize: 12)
        let color = UIColor.blue
        let style = NSParagraphStyle.random()
        let shadow = NSShadow.random()

        let attributedLabel = AttributedLabel()
        var mergedAttrString = attributedLabel.mergeAttributes(NSAttributedString(string: string))

        XCTAssertNotEqual(mergedAttrString.attribute(.font, at: 0, effectiveRange: nil) as? UIFont, font)
        XCTAssertNotEqual(mergedAttrString.attribute(.font, at: string.count - 1, effectiveRange: nil) as? UIFont, font)
        XCTAssertNotEqual(mergedAttrString.attribute(.font, at: 0, effectiveRange: nil) as? UIFont, font)
        XCTAssertNotEqual(mergedAttrString.attribute(.font, at: string.count - 1, effectiveRange: nil) as? UIFont, font)
        XCTAssertNotEqual(mergedAttrString.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSParagraphStyle, style)
        XCTAssertNotEqual(mergedAttrString.attribute(.paragraphStyle, at: string.count - 1, effectiveRange: nil) as? NSParagraphStyle, style)
        XCTAssertNotEqual(mergedAttrString.attribute(.shadow, at: 0, effectiveRange: nil) as? NSShadow, shadow)
        XCTAssertNotEqual(mergedAttrString.attribute(.shadow, at: string.count - 1, effectiveRange: nil) as? NSShadow, shadow)

        attributedLabel.font = font
        attributedLabel.textColor = color
        attributedLabel.paragraphStyle = style
        attributedLabel.shadow = shadow

        mergedAttrString = attributedLabel.mergeAttributes(NSAttributedString(string: string))

        XCTAssertEqual(mergedAttrString.attribute(.font, at: 0, effectiveRange: nil) as? UIFont, font)
        XCTAssertEqual(mergedAttrString.attribute(.font, at: string.count - 1, effectiveRange: nil) as? UIFont, font)
        XCTAssertEqual(mergedAttrString.attribute(.font, at: 0, effectiveRange: nil) as? UIFont, font)
        XCTAssertEqual(mergedAttrString.attribute(.font, at: string.count - 1, effectiveRange: nil) as? UIFont, font)
        XCTAssertEqual(mergedAttrString.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSParagraphStyle, style)
        XCTAssertEqual(mergedAttrString.attribute(.paragraphStyle, at: string.count - 1, effectiveRange: nil) as? NSParagraphStyle, style)
        XCTAssertEqual(mergedAttrString.attribute(.shadow, at: 0, effectiveRange: nil) as? NSShadow, shadow)
        XCTAssertEqual(mergedAttrString.attribute(.shadow, at: string.count - 1, effectiveRange: nil) as? NSShadow, shadow)
    }
}

extension NSShadow {
    static func random() -> NSShadow {
        let shadow = NSShadow()
        shadow.shadowBlurRadius = CGFloat(5.random())
        shadow.shadowOffset = CGSize(width: 5.random(), height: 5.random())
        shadow.shadowColor = UIColor(hue: CGFloat(10.random()) / 10, saturation: 0.8, brightness: 0.8, alpha: 1)
        return shadow
    }
}

extension NSParagraphStyle {
    private static func lineBreakMode() -> NSLineBreakMode {
        let mode: [NSLineBreakMode] = [.byWordWrapping, .byCharWrapping, .byClipping, .byTruncatingHead, .byTruncatingTail, .byTruncatingMiddle]
        return mode[mode.count.random()]
    }

    static func random() -> NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = CGFloat(10.random() + 10)
        paragraphStyle.maximumLineHeight = CGFloat(10.random() + 10)
        paragraphStyle.lineSpacing = CGFloat(10.random() - 5)
        paragraphStyle.lineBreakMode = lineBreakMode()
        return paragraphStyle
    }
}

extension NSMutableAttributedString {
    @discardableResult
    func addAttribute(_ attrName: NSAttributedStringKey, attr: AnyObject) -> Self {
        let location = self.length.random()
        let length = (self.length - location).random()
        let range = NSRange(location: location, length: length)

        enumerateAttribute(attrName, in: range, options: .reverse) { object, range, pointer in
            if object == nil {
                addAttributes([attrName: attr], range: range)
            }
        }

        return self
    }
}

extension Int {
    func random() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

