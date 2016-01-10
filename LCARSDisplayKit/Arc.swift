//===----------------------------------------------------------------------===//
//
// Arc.swift
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

/// Arc of a circle (a continuous length around the circumference)
public struct Arc {
    public var radius: CGFloat = CGFloat(0)
    public var startDegree: CGFloat = CGFloat(0)
    public var endDegree: CGFloat = CGFloat(0)
    
    public var startPoint: GraphPoint {
        return GraphPoint.pointFor(degree: startDegree, radius: radius)
    }
    
    public var endPoint: GraphPoint {
        return GraphPoint.pointFor(degree: endDegree, radius: radius)
    }
    
    public var allPoints: [GraphPoint] {
        return [startPoint, endPoint]
    }
    
    public init(radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat) {
        self.radius = radius
        self.startDegree = startDegree
        self.endDegree = endDegree
    }
    
    public func rightAnglePivotPoint(graphFrame: GraphFrame) -> GraphPoint {
        let start = graphFrame.pointFor(graphPoint: startPoint)
        let end = graphFrame.pointFor(graphPoint: endPoint)
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
}
