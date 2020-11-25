import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics
#endif

/// Arc of a circle (a continuous length around the circumference)
public struct Arc {
    public var size: CGSize = CGSize.zero
    public var radius: Radius
    public var startDegree: Degree
    public var endDegree: Degree
    
    public var startLimiter: CartesianPoint?
    public var endLimiter: CartesianPoint?
    
    public init(radius: Radius = 0.0, startDegree: Degree = 0.0, endDegree: Degree = 0.0) {
        self.radius = radius
        self.startDegree = startDegree
        self.endDegree = endDegree
    }
}

public extension Arc {
    var startingPoint: CartesianPoint {
        if let modifier = startLimiter {
            return (try? CartesianPoint.make(for: radius, degree: startDegree, modifier: modifier)) ?? .zero
        }
        
        return (try? CartesianPoint.make(for: radius, degree: startDegree)) ?? .zero
    }
    
    var endingPoint: CartesianPoint {
        if let modifier = endLimiter {
            return (try? CartesianPoint.make(for: radius, degree: endDegree, modifier: modifier)) ?? .zero
        }
        
        return (try? CartesianPoint.make(for: radius, degree: endDegree)) ?? .zero
    }
    
    var pivotPoint: CartesianPoint {
        let start = self.startingPoint
        let end = self.endingPoint
        var pivot = CartesianPoint()
        
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

extension Arc: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        [startingPoint, endingPoint]
    }
}

#if canImport(CoreGraphics)
extension Arc: ExpressibleByPath {
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let pivot = frame.originModifiedBy(pivotPoint)
        
        path.addArc(center: center, radius: radius, startAngle: startDegree, endAngle: endDegree, clockwise: false)
        path.addLine(to: CGPoint(pivot))
        path.closeSubpath()
        
        return path
    }
    
    public var subpaths: [CGMutablePath]? {
        return nil
    }
}

extension Arc {
    public init(radius: Radius, dPad: DPad) {
        self.radius = radius
        self.startDegree = Degree(dPad.start)
        self.endDegree = Degree(dPad.end)
    }
    
    @available(*, deprecated)
    public init(radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat) {
        self.radius = Radius(radius)
        self.startDegree = Degree(startDegree)
        self.endDegree = Degree(endDegree)
    }
    
    /// A `GraphPoint` used to vertically/horizontally clip the starting degree
    @available(*, deprecated)
    public var boundedStart: GraphPoint? {
        get {
            guard let point = startLimiter else {
                return nil
            }
            
            return GraphPoint(point)
        }
        set {
            if let value = newValue {
                startLimiter = value.point
            } else {
                startLimiter = nil
            }
        }
    }
    
    /// A `GraphPoint` used to vertically/horizontally clip the ending degree
    @available(*, deprecated)
    public var boundedEnd: GraphPoint? {
        get {
            guard let point = endLimiter else {
                return nil
            }
            
            return GraphPoint(point)
        }
        set {
            if let value = newValue {
                endLimiter = value.point
            } else {
                endLimiter = nil
            }
        }
    }
    
    /// The `GraphPoint` corresponding to the startDegree and radius
    @available(*, deprecated)
    public var startPoint: GraphPoint {
        if let boundedStart = self.boundedStart {
            return GraphPoint.graphPoint(degree: CGFloat(startDegree), radius: CGFloat(radius), boundedBy: boundedStart)
        }
        
        return GraphPoint.graphPoint(degree: CGFloat(startDegree), radius: CGFloat(radius))
    }
    
    /// The `GraphPoint` corresponding to the endDegree and radius
    @available(*, deprecated)
    public var endPoint: GraphPoint {
        if let boundedEnd = self.boundedEnd {
            return GraphPoint.graphPoint(degree: CGFloat(endDegree), radius: CGFloat(radius), boundedBy: boundedEnd)
        }
        
        return GraphPoint.graphPoint(degree: CGFloat(endDegree), radius: CGFloat(radius))
    }
    
    /// Calculates the point of the right angle that joins the start and end points.
    @available(*, deprecated)
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
}

extension Arc: Graphable {
    @available(*, deprecated)
    public var graphPoints: [GraphPoint] {
        return [startPoint, endPoint]
    }
    
    @available(*, deprecated)
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: CGFloat(radius), startDegree: CGFloat(startDegree), endDegree: CGFloat(endDegree))
    }
}
#endif
