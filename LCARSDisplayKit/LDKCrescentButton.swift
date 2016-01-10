//===----------------------------------------------------------------------===//
//
// LDKCrescentButton.swift
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

@IBDesignable public class LDKCrescentButton: UIButton {
    @IBInspectable public var backgroundImageColor: UIColor = UIColor.neonCarrot()
    @IBInspectable public var innerRadius: CGFloat = CGFloat(0)
    @IBInspectable public var outerRadius: CGFloat = CGFloat(0)
    @IBInspectable public var startDegree: CGFloat = CGFloat(0)
    @IBInspectable public var endDegree: CGFloat = CGFloat(0)
    
    convenience init(innerRadius: CGFloat, outerRadius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, graphOrigin: GraphOrigin) {
        let innerArc = Arc(radius: innerRadius, startDegree: startDegree, endDegree: endDegree)
        let outerArc = Arc(radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
        var points = [GraphPoint]()
        points.appendContentsOf(innerArc.allPoints)
        points.appendContentsOf(outerArc.allPoints)
        let graphFrame = GraphFrame.frameFor(points, radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
        let frame = graphFrame.rectFor(graphOrigin)
        self.init(frame: frame)
        self.innerRadius = innerRadius
        self.outerRadius = outerRadius
        self.startDegree = startDegree
        self.endDegree = endDegree
    }
}

// MARK: - Tappable
extension LDKCrescentButton: Tappable {
    public func backgroundImagePath(size: CGSize) -> CGMutablePathRef {
        let innerArc = Arc(radius: innerRadius, startDegree: startDegree, endDegree: endDegree)
        let outerArc = Arc(radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
        return self.dynamicType.cresentPathWithArcs(innerArc, outerArc: outerArc)
    }
    
    public func backgroundImage(context: CGContextRef?, size: CGSize) -> UIImage? {
        let path = backgroundImagePath(size)
        return UIImage.imageWithPath(path, size: size, color: self.backgroundImageColor, context: context)
    }
}

// MARK: - CG Paths
extension LDKCrescentButton {
    public static func cresentPathWithArcs(innerArc: Arc, outerArc: Arc) -> CGMutablePathRef {
        let path: CGMutablePathRef = CGPathCreateMutable()
        
        var points = [GraphPoint]()
        points.appendContentsOf(innerArc.allPoints)
        points.appendContentsOf(outerArc.allPoints)
        
        let graphFrame = GraphFrame.frameFor(points, radius: outerArc.radius, startDegree: outerArc.startDegree, endDegree: outerArc.endDegree)
        let graphOrigin = graphFrame.graphOrigin
        let outerEnd = graphFrame.pointFor(graphPoint: outerArc.endPoint)
        
        CGPathAddArc(path, nil, graphOrigin.x, graphOrigin.y, innerArc.radius, innerArc.startDegree.toRadians(), innerArc.endDegree.toRadians(), false)
        CGPathAddLineToPoint(path, nil, outerEnd.x, outerEnd.y)
        CGPathAddArc(path, nil, graphOrigin.x, graphOrigin.y, outerArc.radius, outerArc.endDegree.toRadians(), outerArc.startDegree.toRadians(), true)
        CGPathCloseSubpath(path)
        
        return path
    }
}