//===----------------------------------------------------------------------===//
//
// LDKButton.swift
//
// Copyright (c) 2015 Richard Piazza
// https://github.com/richardpiazza/CodeQuickKit
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// Star Trek and related marks are registered trademarks of CBS® / PARAMOUNT®
// PLC. Original LCARS design credit: Mike Okuda.
//
//===----------------------------------------------------------------------===//

import UIKit

@IBDesignable public class LDKButton: UIButton {
    @IBInspectable public var backgroundImageColor: UIColor = UIColor.neonCarrot()
    @IBInspectable public var roundLeft: Bool = false
    @IBInspectable public var roundRight: Bool = false
    /// When isFrame == true, rounding is applied only to corners, not the entire edge.
    @IBInspectable public var isFrame: Bool = false
    
    convenience init(frame: CGRect, roundLeft: Bool, roundRight: Bool, isFrame: Bool) {
        self.init(frame: frame)
        self.roundLeft = roundLeft
        self.roundRight = roundRight
        self.isFrame = isFrame
    }
}

// MARK: - Tappable
extension LDKButton: Tappable {
    public func backgroundImagePath(size: CGSize) -> CGMutablePathRef {
        return self.dynamicType.buttonPathWithSize(size, roundLeft: self.roundLeft, roundRight: self.roundRight, isFrame: self.isFrame)
    }
}

// MARK: - Scalable
extension LDKButton: Scalable {
    public class func defaultSize() -> CGSize {
        return CGSizeMake(144, 60)
    }
}

// MARK: - CG Paths
extension LDKButton {
    public static func buttonPathWithSize(size: CGSize, roundLeft: Bool, roundRight: Bool, isFrame: Bool) -> CGMutablePathRef {
        let path: CGMutablePathRef = CGPathCreateMutable()
        
        if roundLeft == false && roundRight == false {
            CGPathAddRect(path, nil, CGRectMake(0, 0, size.width, size.height))
            return path
        }
        
        let radius = (isFrame) ? CGFloat(size.height * 0.25) : CGFloat(size.height / 2)
        let upperLeftCenter = CGPointMake(radius, radius)
        let lowerRightCenter = CGPointMake(size.width - radius, size.height - radius)
        
        if roundLeft && roundRight {
            if isFrame {
                CGPathAddArc(path, nil, upperLeftCenter.x, upperLeftCenter.y, radius, CGFloat(180).toRadians(), CGFloat(270).toRadians(), false)
                CGPathAddLineToPoint(path, nil, lowerRightCenter.x, 0)
                CGPathAddArc(path, nil, lowerRightCenter.x, upperLeftCenter.y, radius, CGFloat(270).toRadians(), CGFloat(0).toRadians(), false)
                CGPathAddLineToPoint(path, nil, size.width, lowerRightCenter.y)
                CGPathAddArc(path, nil, lowerRightCenter.x, lowerRightCenter.y, radius, CGFloat(0).toRadians(), CGFloat(90).toRadians(), false)
                CGPathAddLineToPoint(path, nil, upperLeftCenter.x, size.height)
                CGPathAddArc(path, nil, upperLeftCenter.x, lowerRightCenter.y, radius, CGFloat(90).toRadians(), CGFloat(180).toRadians(), false)
                CGPathCloseSubpath(path)
            } else {
                CGPathAddArc(path, nil, upperLeftCenter.x, upperLeftCenter.y, radius, CGFloat(90).toRadians(), CGFloat(270).toRadians(), false)
                CGPathAddLineToPoint(path, nil, lowerRightCenter.x, 0)
                CGPathAddArc(path, nil, lowerRightCenter.x, lowerRightCenter.y, radius, CGFloat(270).toRadians(), CGFloat(90).toRadians(), false)
                CGPathCloseSubpath(path)
            }
        } else if roundLeft {
            if isFrame {
                CGPathAddArc(path, nil, upperLeftCenter.x, upperLeftCenter.y, radius, CGFloat(180).toRadians(), CGFloat(270).toRadians(), false)
                CGPathAddLineToPoint(path, nil, size.width, 0)
                CGPathAddLineToPoint(path, nil, size.width, size.height)
                CGPathAddLineToPoint(path, nil, upperLeftCenter.x, size.height)
                CGPathAddArc(path, nil, upperLeftCenter.x, lowerRightCenter.y, radius, CGFloat(90).toRadians(), CGFloat(180).toRadians(), false)
                CGPathCloseSubpath(path)
            } else {
                CGPathAddArc(path, nil, upperLeftCenter.x, upperLeftCenter.y, radius, CGFloat(90).toRadians(), CGFloat(270).toRadians(), false)
                CGPathAddLineToPoint(path, nil, size.width, 0)
                CGPathAddLineToPoint(path, nil, size.width, size.height)
                CGPathCloseSubpath(path)
            }
        } else if roundRight {
            if isFrame {
                CGPathAddArc(path, nil, lowerRightCenter.x, upperLeftCenter.y, radius, CGFloat(270).toRadians(), CGFloat(0).toRadians(), false)
                CGPathAddLineToPoint(path, nil, size.width, lowerRightCenter.y)
                CGPathAddArc(path, nil, lowerRightCenter.x, lowerRightCenter.y, radius, CGFloat(0).toRadians(), CGFloat(90).toRadians(), false)
                CGPathAddLineToPoint(path, nil, 0, size.height)
                CGPathAddLineToPoint(path, nil, 0, 0)
                CGPathCloseSubpath(path)
            } else {
                CGPathAddArc(path, nil, lowerRightCenter.x, lowerRightCenter.y, radius, CGFloat(270).toRadians(), CGFloat(90).toRadians(), false)
                CGPathAddLineToPoint(path, nil, 0, size.height)
                CGPathAddLineToPoint(path, nil, 0, 0)
                CGPathCloseSubpath(path)
            }
        }
        
        return path
    }
}
