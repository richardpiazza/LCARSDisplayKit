//===----------------------------------------------------------------------===//
//
// CGRect.swift
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

/// A frame that represents its center as its origin (0, 0)
/// Degrees 0/360 are calculated along the positive x axis.
public typealias GraphFrame = CGRect

public extension GraphFrame {
    public var radius: CGFloat {
        if self.midX > self.midY {
            return self.midY
        }
        
        return self.midX
    }
    
    public var graphOrigin: GraphOrigin {
        if origin.x < 0 {
            return GraphOrigin(x: abs(origin.x), y: origin.y)
        } else {
            return GraphOrigin(x: -(origin.x), y: origin.y)
        }
    }
    
    public var description: String {
        let originDescription = "{ \(origin.x), \(origin.y) }"
        let sizeDescription = "{ \(size.width), \(size.height) }"
        return "Graph Frame: \(originDescription) \(sizeDescription)"
    }
    
    /// Calcuates the `CGGeometry` `CGRect` frame
    public func rectFor(graphOrigin: GraphOrigin) -> CGRect {
        return CGRectMake(graphOrigin.x + origin.x, graphOrigin.y - origin.y, size.width, size.height)
    }
    
    /// Translates a `GraphPoint` to the `CGGeometry` `CGPoint`
    /// e.g. Given GraphFrame(0, 0, 10, 10), the GraphPoint(-2.5, -2.5) 
    /// would equal CGPoint(2.5, 7.5)
    public func pointFor(graphPoint graphPoint: GraphPoint) -> CGPoint {
        let x = abs(origin.x - graphPoint.x)
        let y = abs(origin.y - graphPoint.y)
        return CGPointMake(x, y)
    }
    
    /// Translates a `CGGeometry` `CGPoint` to a `GraphPoint`
    /// e.g. Given GraphFrame(0, 0, 10, 10), the CGPoint(2.5, 7.5)
    /// would equal GraphPoint(-2.5, -2.5)
    public func pointFor(point point: CGPoint) -> GraphPoint {
        var graphPoint = GraphPoint(x: 0, y: 0)
        
        if point.x < graphOrigin.x {
            graphPoint.x = -(graphOrigin.x - point.x)
        } else if point.x > graphOrigin.x {
            graphPoint.x = point.x - graphOrigin.x
        }
        
        if point.y > graphOrigin.y {
            graphPoint.y = -(point.y - graphOrigin.y)
        } else if point.y < graphOrigin.y {
            graphPoint.y = graphOrigin.y - point.y
        }
        
        return graphPoint
    }
    
    /// Convenience method that translates a internal coordinate point before 
    /// passing to `degreeForGraphPoint:`
    public func degreeFor(point: CGPoint) -> CGFloat {
        return GraphPoint.degreeFor(graphPoint: pointFor(point: point))
    }
    
    /// Determines that smallest `GraphFrame` that encompases all graph points.
    public static func frameFor(graphPoints: [GraphPoint]) -> GraphFrame {
        var minXMaxY = CGPointZero
        var maxXMinY = CGPointZero
        
        for point in graphPoints {
            if point.x < minXMaxY.x || minXMaxY.x == 0 {
                minXMaxY.x = point.x
            }
            if point.y > minXMaxY.y || minXMaxY.y == 0 {
                minXMaxY.y = point.y
            }
            if point.x > maxXMinY.x || maxXMinY.x == 0 {
                maxXMinY.x = point.x
            }
            if point.y < maxXMinY.y || maxXMinY.y == 0 {
                maxXMinY.y = point.y
            }
        }
        
        return GraphFrame(x: minXMaxY.x, y: minXMaxY.y, width: abs(maxXMinY.x - minXMaxY.x), height: abs(maxXMinY.y - minXMaxY.y))
    }
    
    public static func frameFor(graphPoints: [GraphPoint], radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat) -> GraphFrame {
        var graphFrame = self.frameFor(graphPoints)
        
        if startDegree >= 270 && endDegree <= 90 {
            let expand = abs(graphFrame.origin.x + graphFrame.width)
            if expand < radius {
                graphFrame.size.width = graphFrame.size.width + (radius - expand)
            }
        } else if startDegree >= 180 && endDegree > 270 {
            let expand = abs(graphFrame.origin.y)
            if expand < radius {
                graphFrame.origin.y = graphFrame.origin.y + (radius - expand)
                graphFrame.size.height = graphFrame.size.height + (radius - expand)
            }
        } else if startDegree >= 90 && endDegree > 180 {
            let expand = abs(graphFrame.origin.x)
            if expand < radius {
                graphFrame.origin.x = graphFrame.origin.x - (radius - expand)
                graphFrame.size.width = graphFrame.size.width + (radius - expand)
            }
        } else if startDegree >= 0 && endDegree > 90 {
            let expand = abs(graphFrame.origin.y + graphFrame.height)
            if expand < radius {
                graphFrame.size.height = graphFrame.size.height + (radius - expand)
            }
        }
        
        return graphFrame
    }
    
    public static func frameFor(arc arc: Arc) -> GraphFrame {
        return frameFor(arc.allPoints, radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
    }
}
