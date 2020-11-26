import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics

extension Arc: ExpressibleByPath {
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let pivot = frame.originModifiedBy(pivotPoint)
        
        path.addArc(center: center, radius: radius, startDegree: startDegree, endDegree: endDegree, clockwise: false)
        path.addLine(to: CGPoint(pivot))
        path.closeSubpath()
        
        return path
    }
    
    public var subpaths: [CGMutablePath]? {
        return nil
    }
}

@available(*, deprecated)
extension Arc {
    public init(radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat) {
        self.radius = Radius(radius)
        self.startDegree = Degree(startDegree)
        self.endDegree = Degree(endDegree)
    }
    
    /// A `GraphPoint` used to vertically/horizontally clip the starting degree
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
    public var startPoint: GraphPoint {
        if let boundedStart = self.boundedStart {
            return GraphPoint.graphPoint(degree: CGFloat(startDegree), radius: CGFloat(radius), boundedBy: boundedStart)
        }
        
        return GraphPoint.graphPoint(degree: CGFloat(startDegree), radius: CGFloat(radius))
    }
    
    /// The `GraphPoint` corresponding to the endDegree and radius
    public var endPoint: GraphPoint {
        if let boundedEnd = self.boundedEnd {
            return GraphPoint.graphPoint(degree: CGFloat(endDegree), radius: CGFloat(radius), boundedBy: boundedEnd)
        }
        
        return GraphPoint.graphPoint(degree: CGFloat(endDegree), radius: CGFloat(radius))
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
}

@available(*, deprecated)
extension Arc: Graphable {
    public var size: CGSize {
        get { .zero }
        set { }
    }
    
    public var graphPoints: [GraphPoint] {
        return [startPoint, endPoint]
    }
        
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: CGFloat(radius), startDegree: CGFloat(startDegree), endDegree: CGFloat(endDegree))
    }
}
#endif
