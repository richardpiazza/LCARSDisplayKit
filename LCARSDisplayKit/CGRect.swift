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
//===----------------------------------------------------------------------===//

import CoreGraphics

/// A frame that has an origin that is relative to a `GraphOrigin`.
/// Typically as an offset to a `CGRect` center.
public typealias GraphFrame = CGRect

public extension CGRect {
    /// Friendly string representation
    public var description: String {
        let originDescription = "{ \(origin.x), \(origin.y) }"
        let sizeDescription = "{ \(size.width), \(size.height) }"
        return "CGRect (x,y,w,h): \(originDescription) \(sizeDescription)"
    }
    
    /// The largest radius that would fit both X and Y dimensions.
    public var radius: CGFloat {
        if midX > midY {
            return midY
        }
        
        return midX
    }
    
    /// The center of a CGRect based on mid values
    public var center: GraphOrigin {
        return GraphOrigin(x: midX, y: midY)
    }
    
    /// Translates a `GraphPoint` to the corresponding `CGPoint`.
    /// e.g. Given CGRect(0, 0, 10, 10), the GraphPoint(-2.5, -2.5)
    /// would equal CGPoint(2.5, 7.5)
    public func pointFor(graphPoint graphPoint: GraphPoint) -> CGPoint {
        let x = abs(origin.x - graphPoint.x)
        let y = abs(origin.y - graphPoint.y)
        return CGPointMake(x, y)
    }
    
    /// Translates a `CGPoint` to a `GraphPoint`
    /// e.g. Given GraphFrame(0, 0, 10, 10), the CGPoint(2.5, 7.5)
    /// would equal GraphPoint(-2.5, -2.5)
    public func graphPointFor(point point: CGPoint) -> GraphPoint {
        var graphPoint = GraphPoint(x: 0, y: 0)
        
        if point.x < center.x {
            graphPoint.x = -(center.x - point.x)
        } else if point.x > center.x {
            graphPoint.x = point.x - center.x
        }
        
        if point.y > center.y {
            graphPoint.y = -(point.y - center.y)
        } else if point.y < center.y {
            graphPoint.y = center.y - point.y
        }
        
        return graphPoint
    }
    
    /// Calculates the view frame for a `GraphFrame` contained with this frames bounds.
    /// An optional `GraphOriginOffset` allows for an offset value to change where center
    /// is calculated from.
    public func frameFor(graphFrame graphFrame: GraphFrame, withGraphOriginOffset graphOriginOffset: GraphOriginOffset = GraphOriginOffset(x: 0, y: 0)) -> CGRect {
        var graphCenter = self.center
        graphCenter.x = graphCenter.x + graphOriginOffset.x
        graphCenter.y = graphCenter.y + graphOriginOffset.y
        
        return CGRect(x: graphCenter.x + graphFrame.origin.x, y: graphCenter.y - graphFrame.origin.y, width: graphFrame.width, height: graphFrame.height)
    }
}

public extension GraphFrame {
    /// The location of the `GraphOrigin` relative to this `GraphFrame` origin
    public var offsetToGraphOrigin: GraphOriginOffset {
        if origin.x <= 0 {
            return GraphOriginOffset(x: abs(origin.x), y: origin.y)
        } else {
            return GraphOriginOffset(x: -(origin.x), y: origin.y)
        }
    }
    
    /// Calcuates the `CGGeometry` `CGRect` frame
    public func rectFor(graphOrigin: GraphOrigin) -> CGRect {
        return CGRectMake(graphOrigin.x + origin.x, graphOrigin.y - origin.y, size.width, size.height)
    }
}

// MARK: - Static Funcs
public extension GraphFrame {
    /// Determines that smallest `GraphFrame` that encompases all graph points.
    public static func graphFrameFor(graphPoints: [GraphPoint]) -> GraphFrame {
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
    
    /// Determines the smallest `GraphFrame` that encompases all points, with
    /// expansion for crossing an axis.
    public static func graphFrameFor(graphPoints: [GraphPoint], radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat) -> GraphFrame {
        var graphFrame = graphFrameFor(graphPoints)
        
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
    
    public static func graphFrameFor(arc arc: Arc) -> GraphFrame {
        return graphFrameFor(arc.graphPoints, radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
    }
}
