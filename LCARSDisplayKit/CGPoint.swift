//===----------------------------------------------------------------------===//
//
// CGPoint.swift
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
// Star Trek and related marks are registered trademarks of CBS® / PARAMOUNT®
// PLC. Original LCARS design credit: Mike Okuda.
//
//===----------------------------------------------------------------------===//

import CoreGraphics

/// The center (0, 0) of the graph axis, typically the center of a UIView
public typealias GraphOrigin = CGPoint

/// A point on the graph with coordinates as an offset of GraphOrigin
public typealias GraphPoint = CGPoint

public extension GraphPoint {
    /// Uses the mathematical 'Law of Sines' to determine a `GraphPoint` for
    /// the supplied degree and radius
    public static func pointFor(degree degree: CGFloat, radius r: CGFloat) -> GraphPoint {
        var point = GraphPoint(x: 0, y: 0)
        
        let angleRight = CGFloat(90)
        var angleRise = CGFloat(0)
        var angleRun = CGFloat(0)
        
        if (degree > 315) {
            angleRise = CGFloat(360) - degree
            angleRun = CGFloat(180) - angleRight - angleRise
            point.y = (r / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            point.x = (r / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 270) {
            angleRun = degree - CGFloat(270)
            angleRise = CGFloat(180) - angleRight - angleRun
            point.y = (r / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            point.x = (r / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 225) {
            angleRun = CGFloat(270) - degree
            angleRise = CGFloat(180) - angleRight - angleRun
            point.y = (r / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            point.x = -1.0 * (r / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 180) {
            angleRise = degree - CGFloat(180)
            angleRun = CGFloat(180) - angleRight - angleRise
            point.y = (r / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            point.x = -1.0 * (r / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 135) {
            angleRise = CGFloat(180) - degree
            angleRun = CGFloat(180) - angleRight - angleRise
            point.y = -1.0 * (r / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            point.x = -1.0 * (r / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 90) {
            angleRun = degree - CGFloat(90)
            angleRise = CGFloat(180) - angleRight - angleRun
            point.y = -1.0 * (r / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            point.x = -1.0 * (r / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 45) {
            angleRun = CGFloat(90) - degree
            angleRise = CGFloat(180) - angleRight - angleRun
            point.y = -1.0 * (r / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            point.x = (r / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree >= 0) {
            angleRise = degree
            angleRun = CGFloat(180) - angleRight - angleRise
            point.y = -1.0 * (r / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            point.x = (r / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        }
        
        return point
    }
    
    /// Uses the mathematical 'Law of Cotangents' to determine the degree for
    /// a `graphPoint`
    public static func degreeFor(graphPoint graphPoint: GraphPoint) -> CGFloat {
        var degree = CGFloat(0)
        guard !CGPointEqualToPoint(graphPoint, CGPointZero) else {
            return degree
        }
        
        let maxX = abs(graphPoint.x)
        let maxY = abs(graphPoint.y)
        let radius = (maxX >= maxY) ? maxX : maxY
        
        if graphPoint.x >= 0 && graphPoint.y >= 0 {
            let midPoint = GraphPoint.pointFor(degree: CGFloat(315), radius: radius)
            if graphPoint.x <= midPoint.x {
                degree = CGFloat(270) + atan(graphPoint.x / graphPoint.y).toDegress()
            } else {
                degree = CGFloat(360) - atan(graphPoint.y / graphPoint.x).toDegress()
            }
        } else if graphPoint.x >= 0 && graphPoint.y <= 0 {
            let midPoint = GraphPoint.pointFor(degree: CGFloat(45), radius: radius)
            if graphPoint.x <= midPoint.x {
                degree = atan(abs(graphPoint.y) / graphPoint.x).toDegress()
            } else {
                degree = CGFloat(90) - atan(graphPoint.x / abs(graphPoint.y)).toDegress()
            }
        } else if graphPoint.x <= 0 && graphPoint.y <= 0 {
            let midPoint = GraphPoint.pointFor(degree: CGFloat(135), radius: radius)
            if graphPoint.x <= midPoint.x {
                degree = CGFloat(180) - atan(abs(graphPoint.y) / abs(graphPoint.x)).toDegress()
            } else {
                degree = CGFloat(90) + atan(abs(graphPoint.x) / abs(graphPoint.y)).toDegress()
            }
        } else if graphPoint.x <= 0 && graphPoint.y >= 0 {
            let midPoint = GraphPoint.pointFor(degree: CGFloat(225), radius: radius)
            if graphPoint.x <= midPoint.x {
                degree = CGFloat(180) + atan(graphPoint.y / abs(graphPoint.x)).toDegress()
            } else {
                degree = CGFloat(270) - atan(abs(graphPoint.x) / graphPoint.y).toDegress()
            }
        }
        
        return degree
    }
}
