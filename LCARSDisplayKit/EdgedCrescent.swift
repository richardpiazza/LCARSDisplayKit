//===----------------------------------------------------------------------===//
//
// EdgedCrescent.swift
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

/// An interior `Arc` extended with straight lines to additional points
public struct EdgedCrescent {
    public var arc: Arc = Arc()
    public var additionalPoints: [GraphPoint] = [GraphPoint]()
    
    public init() {}
    public init(arc: Arc, additionalPoints: [GraphPoint]) {
        self.init()
        self.arc = arc
        self.additionalPoints = additionalPoints
    }
}

extension EdgedCrescent: Graphable {
    public var graphPoints: [GraphPoint] {
        var points = [GraphPoint]()
        points.appendContentsOf(arc.graphPoints)
        points.appendContentsOf(additionalPoints)
        return points
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrameFor(graphPoints, radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
    }
    
    public var path: CGMutablePathRef {
        let path: CGMutablePathRef = CGPathCreateMutable()
        
        let gf = graphFrame
        let offset = gf.offsetToGraphOrigin
        
        CGPathAddArc(path, nil, offset.x, offset.y, arc.radius, arc.startDegree.toRadians(), arc.endDegree.toRadians(), false)
        
        for point in Array(additionalPoints.reverse()) {
            let translatedPoint = gf.pointFor(graphPoint: point)
            CGPathAddLineToPoint(path, nil, translatedPoint.x, translatedPoint.y)
        }
        
        CGPathCloseSubpath(path)
        
        return path
    }
}
