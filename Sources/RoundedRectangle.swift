//===----------------------------------------------------------------------===//
//
// RoundedRectangle.swift
//
// Copyright (c) 2016 Richard Piazza
// https://github.com/richardpiazza/LCARSDisplayKit
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

import CoreGraphics
import GraphPoint

/// A rectangle with optionally rounded ends
public struct RoundedRectangle: Graphable {
    public var size: CGSize = CGSize.zero
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
    public var path: CGMutablePath {
        let path = CGMutablePath()
        
        guard leftRounded == true || rightRounded == true else {
            path.addRect(CGRect(origin: CGPoint.zero, size: size))
            return path
        }
        
        if leftRounded && rightRounded {
            if cornersOnly {
                path.addArc(center: upperLeftCenter, radius: radius, startAngle: CGFloat.radians180, endAngle: CGFloat.radians270, clockwise: false)
                path.addLine(to: CGPoint(x: lowerRightCenter.x, y: 0))
                path.addArc(center: CGPoint(x: lowerRightCenter.x, y: upperLeftCenter.y), radius: radius, startAngle: CGFloat.radians270, endAngle: CGFloat.radians0, clockwise: false)
                path.addLine(to: CGPoint(x: size.width, y: lowerRightCenter.y))
                path.addArc(center: lowerRightCenter, radius: radius, startAngle: CGFloat.radians0, endAngle: CGFloat.radians90, clockwise: false)
                path.addLine(to: CGPoint(x: upperLeftCenter.x, y: size.height))
                path.addArc(center: CGPoint(x: upperLeftCenter.x, y:lowerRightCenter.y), radius: radius, startAngle: CGFloat.radians90, endAngle: CGFloat.radians180, clockwise: false)
                path.closeSubpath()
            } else {
                path.addArc(center: upperLeftCenter, radius: radius, startAngle: CGFloat.radians90, endAngle: CGFloat.radians270, clockwise: false)
                path.addLine(to: CGPoint(x: lowerRightCenter.x, y: 0))
                path.addArc(center: lowerRightCenter, radius: radius, startAngle: CGFloat.radians270, endAngle: CGFloat.radians90, clockwise: false)
                path.closeSubpath()
            }
        } else if leftRounded {
            if cornersOnly {
                path.addArc(center: upperLeftCenter, radius: radius, startAngle: CGFloat.radians180, endAngle: CGFloat.radians270, clockwise: false)
                path.addLine(to: CGPoint(x: size.width, y: 0))
                path.addLine(to: CGPoint(x: size.width, y: size.height))
                path.addLine(to: CGPoint(x: upperLeftCenter.x, y: size.height))
                path.addArc(center: CGPoint(x: upperLeftCenter.x, y: lowerRightCenter.y), radius: radius, startAngle: CGFloat.radians90, endAngle: CGFloat.radians180, clockwise: false)
                path.closeSubpath()
            } else {
                path.addArc(center: upperLeftCenter, radius: radius, startAngle: CGFloat.radians90, endAngle: CGFloat.radians270, clockwise: false)
                path.addLine(to: CGPoint(x: size.width, y: 0))
                path.addLine(to: CGPoint(x: size.width, y: size.height))
                path.closeSubpath()
            }
        } else if rightRounded {
            if cornersOnly {
                path.addArc(center: CGPoint(x: lowerRightCenter.x, y: upperLeftCenter.y), radius: radius, startAngle: CGFloat.radians270, endAngle: CGFloat.radians0, clockwise: false)
                path.addLine(to: CGPoint(x: size.width, y: lowerRightCenter.y))
                path.addArc(center: lowerRightCenter, radius: radius, startAngle: CGFloat.radians0, endAngle: CGFloat.radians90, clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: size.height))
                path.addLine(to: CGPoint.zero)
                path.closeSubpath()
            } else {
                path.addArc(center: lowerRightCenter, radius: radius, startAngle: CGFloat.radians270, endAngle: CGFloat.radians90, clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: size.height))
                path.addLine(to: CGPoint.zero)
                path.closeSubpath()
            }
        }
        
        return path
    }
}
