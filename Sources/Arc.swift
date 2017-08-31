//===----------------------------------------------------------------------===//
//
// Arc.swift
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

/// Arc of a circle (a continuous length around the circumference)
public struct Arc: Graphable {
    public var size: CGSize = CGSize.zero
    public var radius: CGFloat = CGFloat(0)
    public var startDegree: CGFloat = CGFloat(0)
    public var endDegree: CGFloat = CGFloat(0)
    
    public init() {
    }
    
    public init(radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat) {
        self.radius = radius
        self.startDegree = startDegree
        self.endDegree = endDegree
    }
    
    /// The `GraphPoint` corresponding to the startDegree and radius
    public var startPoint: GraphPoint {
        return GraphPoint.graphPoint(degree: startDegree, radius: radius)
    }
    
    /// The `GraphPoint` corresponding to the endDegree and radius
    public var endPoint: GraphPoint {
        return GraphPoint.graphPoint(degree: endDegree, radius: radius)
    }
    
    /// Calculates the point of the right angle that joins the start and end points.
    public var pivot: GraphPoint {
        let start = startPoint
        let end = endPoint
        var pivot = GraphPoint(x: 0, y: 0)
        
        if startDegree < 90 {
            pivot.x = end.x
            pivot.y = start.y
        } else if startDegree < 180 {
            pivot.x = start.x
            pivot.y = end.y
        } else if startDegree < 270 {
            pivot.x = end.x
            pivot.y = start.y
        } else {
            pivot.x = start.x
            pivot.y = end.y
        }
        
        return pivot
    }
    
    // MARK: - Graphable
    public var graphPoints: [GraphPoint] {
        return [startPoint, endPoint]
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: radius, startDegree: startDegree, endDegree: endDegree)
    }
    
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let gf = graphFrame
        let offset = gf.graphOriginOffset
        let translatedPivot = gf.boundedPoint(graphPoint: pivot)
        
        path.addArc(center: offset, radius: radius, startAngle: startDegree.radians, endAngle: endDegree.radians, clockwise: false)
        path.addLine(to: translatedPivot)
        path.closeSubpath()
        
        return path
    }
}
