//===----------------------------------------------------------------------===//
//
// LDKElbowButton.swift
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
import GraphPoint

@IBDesignable public class LDKElbowButton: UIButton, Tappable {
    @IBInspectable public var backgroundImageColor: UIColor = Interface.theme.primaryDark
    @IBInspectable public var top: Bool = true
    @IBInspectable public var left: Bool = true
    /// Specifies if the corner specified by `top` and `left` should be rounded.
    @IBInspectable public var rounded: Bool = true
    @IBInspectable public var horizontalHeight: CGFloat = CGFloat(120)
    @IBInspectable public var verticalWidth: CGFloat = CGFloat(30)
    /// If closedHeight > 0, an additional area is drawn parallel to the horizontalHeight area.
    @IBInspectable public var closedHeight: CGFloat = CGFloat(0)
    
    convenience init(frame: CGRect, top: Bool, left: Bool, rounded: Bool, horizontalHeight: CGFloat, verticalWidth: CGFloat, closedHeight: CGFloat) {
        self.init(frame: frame)
        self.top = top
        self.left = left
        self.rounded = rounded
        self.horizontalHeight = horizontalHeight
        self.verticalWidth = verticalWidth
        self.closedHeight = closedHeight
    }
    
    // MARK: - Tappable
    public func backgroundImagePath(size: CGSize) -> CGMutablePathRef {
        return self.dynamicType.elbowPathWithSize(size, top: top, left: left, rounded: rounded, horizontalHeight: horizontalHeight, verticalWidth: verticalWidth, closedHeight: closedHeight)
    }
    
    // MARK: - CG Paths
    public static func elbowPathWithSize(size: CGSize, top: Bool, left: Bool, rounded: Bool, horizontalHeight: CGFloat, verticalWidth: CGFloat, closedHeight: CGFloat) -> CGMutablePathRef {
        let path: CGMutablePathRef = CGPathCreateMutable()
        
        let outerRadius = fmax(horizontalHeight, verticalWidth) / 2
        let innerRadius = outerRadius / 2.4
        let upperLeftOuterCenter = CGPointMake(outerRadius, outerRadius)
        let upperLeftInnerCenter = CGPointMake(verticalWidth + innerRadius, horizontalHeight + innerRadius)
        let lowerRightOuterCenter = CGPointMake(size.width - outerRadius, size.height - outerRadius)
        let lowerRightInnerCenter = CGPointMake(size.width - verticalWidth - innerRadius, size.height - horizontalHeight - innerRadius)
        
        if top && left {
            // Upper Left
            if rounded {
                CGPathAddArc(path, nil, upperLeftOuterCenter.x, upperLeftOuterCenter.y, outerRadius, CGFloat(180).radians, CGFloat(270).radians, false)
            } else {
                CGPathMoveToPoint(path, nil, 0, 0)
            }
            CGPathAddLineToPoint(path, nil, size.width, 0)
            CGPathAddLineToPoint(path, nil, size.width, horizontalHeight)
            if rounded {
                CGPathAddLineToPoint(path, nil, verticalWidth + innerRadius, horizontalHeight)
                CGPathAddArc(path, nil, upperLeftInnerCenter.x, upperLeftInnerCenter.y, innerRadius, CGFloat(270).radians, CGFloat(180).radians, true)
            } else {
                CGPathAddLineToPoint(path, nil, verticalWidth, horizontalHeight)
            }
            if closedHeight > 0 {
                CGPathAddLineToPoint(path, nil, verticalWidth, size.height - closedHeight)
                CGPathAddLineToPoint(path, nil, size.width, size.height - closedHeight)
                CGPathAddLineToPoint(path, nil, size.width, size.height)
            } else {
                CGPathAddLineToPoint(path, nil, verticalWidth, size.height)
            }
            CGPathAddLineToPoint(path, nil, 0, size.height)
            CGPathCloseSubpath(path)
        } else if !top && left {
            // Lower Left
            if rounded {
                CGPathAddArc(path, nil, upperLeftOuterCenter.x, lowerRightOuterCenter.y, outerRadius, CGFloat(180).radians, CGFloat(90).radians, true)
            } else {
                CGPathMoveToPoint(path, nil, 0, size.height)
            }
            CGPathAddLineToPoint(path, nil, size.width, size.height)
            CGPathAddLineToPoint(path, nil, size.width, size.height - horizontalHeight)
            if rounded {
                CGPathAddLineToPoint(path, nil, verticalWidth + innerRadius, size.height - horizontalHeight)
                CGPathAddArc(path, nil, upperLeftInnerCenter.x, lowerRightInnerCenter.y, innerRadius, CGFloat(90).radians, CGFloat(180).radians, false)
            } else {
                CGPathAddLineToPoint(path, nil, verticalWidth, size.height - horizontalHeight)
            }
            if closedHeight > 0 {
                CGPathAddLineToPoint(path, nil, verticalWidth, closedHeight)
                CGPathAddLineToPoint(path, nil, size.width, closedHeight)
                CGPathAddLineToPoint(path, nil, size.width, 0)
            } else {
                CGPathAddLineToPoint(path, nil, verticalWidth, 0)
            }
            CGPathAddLineToPoint(path, nil, 0, 0)
            CGPathCloseSubpath(path)
        } else if top && !left {
            // Upper Right
            if rounded {
                CGPathAddArc(path, nil, lowerRightOuterCenter.x, upperLeftOuterCenter.y, outerRadius, CGFloat(0).radians, CGFloat(270).radians, true)
            } else {
                CGPathMoveToPoint(path, nil, size.width, 0)
            }
            CGPathAddLineToPoint(path, nil, 0, 0)
            CGPathAddLineToPoint(path, nil, 0, horizontalHeight)
            if rounded {
                CGPathAddLineToPoint(path, nil, size.width - verticalWidth - innerRadius, horizontalHeight)
                CGPathAddArc(path, nil, lowerRightInnerCenter.x, upperLeftInnerCenter.y, innerRadius, CGFloat(270).radians, CGFloat(0).radians, false)
            } else {
                CGPathAddLineToPoint(path, nil, size.width - verticalWidth, horizontalHeight)
            }
            if closedHeight > 0 {
                CGPathAddLineToPoint(path, nil, size.width - verticalWidth, size.height - closedHeight)
                CGPathAddLineToPoint(path, nil, 0, size.height - closedHeight)
                CGPathAddLineToPoint(path, nil, 0, size.height)
            } else {
                CGPathAddLineToPoint(path, nil, size.width - verticalWidth, size.height)
            }
            CGPathAddLineToPoint(path, nil, size.width, size.height)
            CGPathCloseSubpath(path)
        } else if !top && !left {
            // Lower Right
            if rounded {
                CGPathAddArc(path, nil, lowerRightOuterCenter.x, lowerRightOuterCenter.y, outerRadius, CGFloat(0).radians, CGFloat(90).radians, false)
            } else {
                CGPathMoveToPoint(path, nil, size.width, size.height)
            }
            CGPathAddLineToPoint(path, nil, 0, size.height)
            CGPathAddLineToPoint(path, nil, 0, size.height - horizontalHeight)
            if rounded {
                CGPathAddLineToPoint(path, nil, size.width - verticalWidth - innerRadius, size.height - horizontalHeight)
                CGPathAddArc(path, nil, lowerRightInnerCenter.x, lowerRightInnerCenter.y, innerRadius, CGFloat(90).radians, CGFloat(0).radians, true)
            } else {
                CGPathAddLineToPoint(path, nil, size.width - verticalWidth, size.height - horizontalHeight)
            }
            if closedHeight > 0 {
                CGPathAddLineToPoint(path, nil, size.width - verticalWidth, closedHeight)
                CGPathAddLineToPoint(path, nil, 0, closedHeight)
                CGPathAddLineToPoint(path, nil, 0, 0)
            } else {
                CGPathAddLineToPoint(path, nil, size.width - verticalWidth, 0)
            }
            CGPathAddLineToPoint(path, nil, size.width, 0)
            CGPathCloseSubpath(path)
        }
        
        return path
    }
}
