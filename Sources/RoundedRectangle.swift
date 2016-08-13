//===----------------------------------------------------------------------===//
//
// RoundedRectangle.swift
//
// Copyright (c) 2016 Richard Piazza
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
//===----------------------------------------------------------------------===//

import CoreGraphics
import GraphPoint

/// A rectangle with optionally rounded ends
public struct RoundedRectangle: Graphable {
    public var size: CGSize = CGSizeZero
    public var leftRounded: Bool = false
    public var rightRounded: Bool = false
    public var cornersOnly: Bool = false
    
    public init() {}
    public init(size: CGSize, leftRounded: Bool, rightRounded: Bool, cornersOnly: Bool) {
        self.size = size
        self.leftRounded = leftRounded
        self.rightRounded = rightRounded
        self.cornersOnly = cornersOnly
    }
    
    /// Caluclates the radius of the arcs depending on `cornersOnly`
    var radius: CGFloat {
        return (cornersOnly) ? size.height * 0.25 : size.height * 0.5
    }
    
    var upperLeftCenter: CGPoint {
        return CGPoint(x: radius, y: radius)
    }
    
    var lowerRightCenter: CGPoint {
        return CGPoint(x: size.width - radius, y: size.height - radius)
    }
    
    // MARK: - Graphable
    public var path: CGMutablePathRef {
        let path = CGPathCreateMutable()
        
        guard leftRounded == true || rightRounded == true else {
            CGPathAddRect(path, nil, CGRect(origin: CGPointZero, size: size))
            return path
        }
        
        if leftRounded && rightRounded {
            if cornersOnly {
                CGPathAddArc(path, nil, upperLeftCenter.x, upperLeftCenter.y, radius, CGFloat(180).radians, CGFloat(270).radians, false)
                CGPathAddLineToPoint(path, nil, lowerRightCenter.x, 0)
                CGPathAddArc(path, nil, lowerRightCenter.x, upperLeftCenter.y, radius, CGFloat(270).radians, CGFloat(0).radians, false)
                CGPathAddLineToPoint(path, nil, size.width, lowerRightCenter.y)
                CGPathAddArc(path, nil, lowerRightCenter.x, lowerRightCenter.y, radius, CGFloat(0).radians, CGFloat(90).radians, false)
                CGPathAddLineToPoint(path, nil, upperLeftCenter.x, size.height)
                CGPathAddArc(path, nil, upperLeftCenter.x, lowerRightCenter.y, radius, CGFloat(90).radians, CGFloat(180).radians, false)
                CGPathCloseSubpath(path)
            } else {
                CGPathAddArc(path, nil, upperLeftCenter.x, upperLeftCenter.y, radius, CGFloat(90).radians, CGFloat(270).radians, false)
                CGPathAddLineToPoint(path, nil, lowerRightCenter.x, 0)
                CGPathAddArc(path, nil, lowerRightCenter.x, lowerRightCenter.y, radius, CGFloat(270).radians, CGFloat(90).radians, false)
                CGPathCloseSubpath(path)
            }
        } else if leftRounded {
            if cornersOnly {
                CGPathAddArc(path, nil, upperLeftCenter.x, upperLeftCenter.y, radius, CGFloat(180).radians, CGFloat(270).radians, false)
                CGPathAddLineToPoint(path, nil, size.width, 0)
                CGPathAddLineToPoint(path, nil, size.width, size.height)
                CGPathAddLineToPoint(path, nil, upperLeftCenter.x, size.height)
                CGPathAddArc(path, nil, upperLeftCenter.x, lowerRightCenter.y, radius, CGFloat(90).radians, CGFloat(180).radians, false)
                CGPathCloseSubpath(path)
            } else {
                CGPathAddArc(path, nil, upperLeftCenter.x, upperLeftCenter.y, radius, CGFloat(90).radians, CGFloat(270).radians, false)
                CGPathAddLineToPoint(path, nil, size.width, 0)
                CGPathAddLineToPoint(path, nil, size.width, size.height)
                CGPathCloseSubpath(path)
            }
        } else if rightRounded {
            if cornersOnly {
                CGPathAddArc(path, nil, lowerRightCenter.x, upperLeftCenter.y, radius, CGFloat(270).radians, CGFloat(0).radians, false)
                CGPathAddLineToPoint(path, nil, size.width, lowerRightCenter.y)
                CGPathAddArc(path, nil, lowerRightCenter.x, lowerRightCenter.y, radius, CGFloat(0).radians, CGFloat(90).radians, false)
                CGPathAddLineToPoint(path, nil, 0, size.height)
                CGPathAddLineToPoint(path, nil, 0, 0)
                CGPathCloseSubpath(path)
            } else {
                CGPathAddArc(path, nil, lowerRightCenter.x, lowerRightCenter.y, radius, CGFloat(270).radians, CGFloat(90).radians, false)
                CGPathAddLineToPoint(path, nil, 0, size.height)
                CGPathAddLineToPoint(path, nil, 0, 0)
                CGPathCloseSubpath(path)
            }
        }
        
        return path
    }
}
