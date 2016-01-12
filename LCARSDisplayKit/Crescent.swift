//===----------------------------------------------------------------------===//
//
// Crescent.swift
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

/// Two `Arc`s connected by stright lines at their end points.
public struct Crescent {
    public var innerArc: Arc = Arc()
    public var outerArc: Arc = Arc()
    
    public var innerRadius: CGFloat {
        return min(innerArc.radius, outerArc.radius)
    }
    
    public var outerRadius: CGFloat {
        return max(outerArc.radius, innerArc.radius)
    }
    
    public var startDegree: CGFloat {
        return min(innerArc.startDegree, outerArc.startDegree)
    }
    
    public var endDegree: CGFloat {
        return max(innerArc.endDegree, outerArc.endDegree)
    }
    
    public init() {}
    public init(innerArc: Arc, outerArc: Arc) {
        self.init()
        self.innerArc = innerArc
        self.outerArc = outerArc
    }
    public init(innerRadius: CGFloat, outerRadius: CGFloat, startDegree: CGFloat, endDegree: CGFloat) {
        self.init()
        innerArc = Arc(radius: innerRadius, startDegree: startDegree, endDegree: endDegree)
        outerArc = Arc(radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
    }
}

// MARK: - Graphable
extension Crescent: Graphable {
    public var graphPoints: [GraphPoint] {
        var points = [GraphPoint]()
        points.appendContentsOf(innerArc.graphPoints)
        points.appendContentsOf(outerArc.graphPoints)
        return points
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrameFor(graphPoints, radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
    }
    
    public var path: CGMutablePathRef {
        let path = CGPathCreateMutable()
        
        let gf = graphFrame
        let offset = gf.offsetToGraphOrigin
        let translatedEnd = gf.pointFor(graphPoint: outerArc.endPoint)
        
        CGPathAddArc(path, nil, offset.x, offset.y, innerArc.radius, innerArc.startDegree.toRadians(), innerArc.endDegree.toRadians(), false)
        CGPathAddLineToPoint(path, nil, translatedEnd.x, translatedEnd.y)
        CGPathAddArc(path, nil, offset.x, offset.y, outerArc.radius, outerArc.endDegree.toRadians(), outerArc.startDegree.toRadians(), true)
        CGPathCloseSubpath(path)
        
        return path
    }
}
