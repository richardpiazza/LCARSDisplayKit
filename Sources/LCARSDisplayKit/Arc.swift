#if (os(macOS) || os(iOS) || os(tvOS) || os(watchOS))

import CoreGraphics
import GraphPoint

/// Arc of a circle (a continuous length around the circumference)
public struct Arc: Graphable {
    public var size: CGSize = CGSize.zero
    public var radius: CGFloat = CGFloat(0)
    public var startDegree: CGFloat = CGFloat(0)
    public var endDegree: CGFloat = CGFloat(0)
    /// A `GraphPoint` used to vertically/horizontally clip the starting degree
    public var boundedStart: GraphPoint?
    /// A `GraphPoint` used to vertically/horizontally clip the ending degree
    public var boundedEnd: GraphPoint?
    
    public init() {
    }
    
    public init(radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat) {
        self.radius = radius
        self.startDegree = startDegree
        self.endDegree = endDegree
    }
    
    /// The `GraphPoint` corresponding to the startDegree and radius
    public var startPoint: GraphPoint {
        if let boundedStart = self.boundedStart {
            return GraphPoint.graphPoint(degree: startDegree, radius: radius, boundedBy: boundedStart)
        }
        
        return GraphPoint.graphPoint(degree: startDegree, radius: radius)
    }
    
    /// The `GraphPoint` corresponding to the endDegree and radius
    public var endPoint: GraphPoint {
        if let boundedEnd = self.boundedEnd {
            return GraphPoint.graphPoint(degree: endDegree, radius: radius, boundedBy: boundedEnd)
        }
        
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

#endif
