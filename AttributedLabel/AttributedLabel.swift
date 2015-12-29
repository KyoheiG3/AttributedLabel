//
//  AttributedLabel.swift
//  AttributedLabel
//
//  Created by Kyohei Ito on 2015/07/17.
//  Copyright © 2015年 Kyohei Ito. All rights reserved.
//

import UIKit

@IBDesignable
public class AttributedLabel: UIView {
    public enum ContentAlignment: Int {
        case Center
        case Top
        case Bottom
        case Left
        case Right
        case TopLeft
        case TopRight
        case BottomLeft
        case BottomRight
        
        func alignOffset(viewSize viewSize: CGSize, containerSize: CGSize) -> CGPoint {
            let xMargin = viewSize.width - containerSize.width
            let yMargin = viewSize.height - containerSize.height
            
            switch self {
            case Center:
                return CGPoint(x: max(xMargin / 2, 0), y: max(yMargin / 2, 0))
            case Top:
                return CGPoint(x: max(xMargin / 2, 0), y: 0)
            case Bottom:
                return CGPoint(x: max(xMargin / 2, 0), y: max(yMargin, 0))
            case Left:
                return CGPoint(x: 0, y: max(yMargin / 2, 0))
            case Right:
                return CGPoint(x: max(xMargin, 0), y: max(yMargin / 2, 0))
            case TopLeft:
                return CGPoint(x: 0, y: 0)
            case TopRight:
                return CGPoint(x: max(xMargin, 0), y: 0)
            case BottomLeft:
                return CGPoint(x: 0, y: max(yMargin, 0))
            case BottomRight:
                return CGPoint(x: max(xMargin, 0), y: max(yMargin, 0))
            }
        }
    }
    
    /// default is `0`.
    @IBInspectable
    public var numberOfLines: Int {
        get { return container.maximumNumberOfLines }
        set {
            container.maximumNumberOfLines = newValue
            setNeedsDisplay()
        }
    }
    /// default is `Left`.
    public var contentAlignment: ContentAlignment = .Left {
        didSet { setNeedsDisplay() }
    }
    /// `lineFragmentPadding` of `NSTextContainer`. default is `0`.
    @IBInspectable
    public var padding: CGFloat {
        get { return container.lineFragmentPadding }
        set {
            container.lineFragmentPadding = newValue
            setNeedsDisplay()
        }
    }
    /// default is system font 17 plain.
    public var font = UIFont.systemFontOfSize(17) {
        didSet { setNeedsDisplay() }
    }
    /// default is `ByTruncatingTail`.
    public var lineBreakMode: NSLineBreakMode {
        get { return container.lineBreakMode }
        set {
            container.lineBreakMode = newValue
            setNeedsDisplay()
        }
    }
    /// default is nil (text draws black).
    @IBInspectable
    public var textColor: UIColor? {
        didSet { setNeedsDisplay() }
    }
    /// default is nil.
    public var paragraphStyle: NSParagraphStyle? {
        didSet { setNeedsDisplay() }
    }
    /// default is nil.
    public var shadow: NSShadow? {
        didSet { setNeedsDisplay() }
    }
    /// default is nil.
    public var attributedText: NSAttributedString? {
        didSet { setNeedsDisplay() }
    }
    /// default is nil.
    @IBInspectable
    public var text: String? {
        get {
            return attributedText?.string
        }
        set {
            if let value = newValue {
                attributedText = NSAttributedString(string: value)
            } else {
                attributedText = nil
            }
        }
    }
    
    var mergedAttributedText: NSAttributedString? {
        if let attributedText = attributedText {
            return mergeAttributes(attributedText)
        }
        return nil
    }
    
    let container = NSTextContainer()
    let layoutManager = NSLayoutManager()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        opaque = false
        contentMode = .Redraw
        lineBreakMode = .ByTruncatingTail
        padding = 0
        layoutManager.addTextContainer(container)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        opaque = false
        contentMode = .Redraw
        lineBreakMode = .ByTruncatingTail
        padding = 0
        layoutManager.addTextContainer(container)
    }
    
    public override func setNeedsDisplay() {
        if NSThread.isMainThread() {
            super.setNeedsDisplay()
        }
    }
    
    public override func drawRect(rect: CGRect) {
        guard let attributedText = mergedAttributedText else {
            return
        }
        
        let storage = NSTextStorage(attributedString: attributedText)
        storage.addLayoutManager(layoutManager)
        
        container.size = rect.size
        let frame = layoutManager.usedRectForTextContainer(container)
        let point = contentAlignment.alignOffset(viewSize: rect.size, containerSize: CGRectIntegral(frame).size)
        
        let glyphRange = layoutManager.glyphRangeForTextContainer(container)
        layoutManager.drawBackgroundForGlyphRange(glyphRange, atPoint: point)
        layoutManager.drawGlyphsForGlyphRange(glyphRange, atPoint: point)
    }
    
    public override func sizeThatFits(size: CGSize) -> CGSize {
        guard let attributedText = mergedAttributedText else {
            return super.sizeThatFits(size)
        }
        
        let storage = NSTextStorage(attributedString: attributedText)
        storage.addLayoutManager(layoutManager)
        
        container.size = size
        let frame = layoutManager.usedRectForTextContainer(container)
        return CGRectIntegral(frame).size
    }
    
    public override func sizeToFit() {
        super.sizeToFit()
        
        frame.size = sizeThatFits(CGSize(width: bounds.width, height: CGFloat.max))
    }
    
    private func mergeAttributes(attributedText: NSAttributedString) -> NSAttributedString {
        let attrString = NSMutableAttributedString(attributedString: attributedText)
        
        addAttribute(attrString, attrName: NSFontAttributeName, attr: font)
        
        if let textColor = textColor {
            addAttribute(attrString, attrName: NSForegroundColorAttributeName, attr: textColor)
        }
        
        if let paragraphStyle = paragraphStyle {
            addAttribute(attrString, attrName: NSParagraphStyleAttributeName, attr: paragraphStyle)
        }
        
        if let shadow = shadow {
            addAttribute(attrString, attrName: NSShadowAttributeName, attr: shadow)
        }
        
        return attrString
    }
    
    private func addAttribute(attrString: NSMutableAttributedString, attrName: String, attr: AnyObject) {
        let range = NSRange(location: 0, length: attrString.length)
        attrString.enumerateAttribute(attrName, inRange: range, options: .Reverse) { object, range, pointer in
            if object == nil {
                attrString.addAttributes([attrName: attr], range: range)
            }
        }
    }
}
