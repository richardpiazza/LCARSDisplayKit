//===----------------------------------------------------------------------===//
//
// LDKEdgedCrescentButton.swift
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

@IBDesignable public class LDKEdgedCrescentButton: UIButton {
    @IBInspectable public var backgroundImageColor: UIColor = UIColor.neonCarrot()
    @IBInspectable public var radius: CGFloat = CGFloat(0)
    @IBInspectable public var startDegree: CGFloat = CGFloat(0)
    @IBInspectable public var endDegree: CGFloat = CGFloat(0)
    @IBInspectable public var edgePoint1: CGPoint = CGPointZero
    @IBInspectable public var edgePoint2: CGPoint = CGPointZero
    @IBInspectable public var edgePoint3: CGPoint = CGPointZero
    
    convenience init(radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, edgePoint1: GraphPoint?, edgePoint2: GraphPoint?, edgePoint3: GraphPoint?, graphOrigin: GraphOrigin) {
        let arc = Arc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        var points = [GraphPoint]()
        points.appendContentsOf(arc.allPoints)
        if let ep = edgePoint1 {
            points.append(ep)
        }
        if let ep = edgePoint2 {
            points.append(ep)
        }
        if let ep = edgePoint3 {
            points.append(ep)
        }
        let graphFrame = GraphFrame.frameFor(points, radius: radius, startDegree: startDegree, endDegree: endDegree)
        let frame = graphFrame.rectFor(graphOrigin)
        
        self.init(frame: frame)
        self.radius = radius
        self.startDegree = startDegree
        self.endDegree = endDegree
        if let ep = edgePoint1 {
            self.edgePoint1.x = ep.x
            self.edgePoint1.y = ep.y
        }
        if let ep = edgePoint2 {
            self.edgePoint2.x = ep.x
            self.edgePoint2.y = ep.y
        }
        if let ep = edgePoint3 {
            self.edgePoint3.x = ep.x
            self.edgePoint3.y = ep.y
        }
    }
}

// MARK: - Tappable
extension LDKEdgedCrescentButton: Tappable {
    public func backgroundImagePath(size: CGSize) -> CGMutablePathRef {
        let arc = Arc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        var points = [GraphPoint]()
        if !CGPointEqualToPoint(edgePoint1, CGPointZero) {
            points.append(edgePoint1)
        }
        if !CGPointEqualToPoint(edgePoint2, CGPointZero) {
            points.append(edgePoint2)
        }
        if !CGPointEqualToPoint(edgePoint3, CGPointZero) {
            points.append(edgePoint3)
        }
        return self.dynamicType.edgedCresentPathWithArc(arc, points: points)
    }
}

// MARK: - CG Paths
extension LDKEdgedCrescentButton {
    public static func edgedCresentPathWithArc(arc: Arc, points: [GraphPoint]) -> CGMutablePathRef {
        let path: CGMutablePathRef = CGPathCreateMutable()
        
        var allPoints = [GraphPoint]()
        allPoints.appendContentsOf(arc.allPoints)
        allPoints.appendContentsOf(points)
        
        let graphFrame = GraphFrame.frameFor(allPoints, radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
        let graphOrigin = graphFrame.graphOrigin
        
        CGPathAddArc(path, nil, graphOrigin.x, graphOrigin.y, arc.radius, arc.startDegree.toRadians(), arc.endDegree.toRadians(), false)
        
        for point in Array(points.reverse()) {
            let viewPoint = graphFrame.pointFor(graphPoint: point)
            CGPathAddLineToPoint(path, nil, viewPoint.x, viewPoint.y)
        }
        
        CGPathCloseSubpath(path)
        
        return path
    }
}
