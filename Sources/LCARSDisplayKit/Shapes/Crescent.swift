import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics

/// Two `Arc`s connected by straight lines at their end points.
public struct Crescent: Graphable {
    public var size: CGSize = CGSize.zero
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
    
    public var boundStart: Bool = false {
        didSet {
            if boundStart {
                outerArc.boundedStart = innerArc.startPoint
            } else {
                outerArc.boundedStart = nil
            }
        }
    }
    
    public var boundEnd: Bool = false {
        didSet {
            if boundEnd {
                outerArc.boundedEnd = innerArc.endPoint
            } else {
                outerArc.boundedEnd = nil
            }
        }
    }
    
    public init() {}
    public init(innerArc: Arc, outerArc: Arc, boundedStart: Bool = false, boundedEnd: Bool = false) {
        self.init()
        self.innerArc = innerArc
        self.outerArc = outerArc
        if boundedStart {
            self.outerArc.boundedStart = self.innerArc.startPoint
        }
        if boundedEnd {
            self.outerArc.boundedEnd = self.innerArc.endPoint
        }
    }
    public init(innerRadius: CGFloat, outerRadius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, boundedStart: Bool = false, boundedEnd: Bool = false) {
        let innerArc = Arc(radius: innerRadius, startDegree: startDegree, endDegree: endDegree)
        let outerArc = Arc(radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
        self.init(innerArc: innerArc, outerArc: outerArc, boundedStart: boundedStart, boundedEnd: boundedEnd)
    }
    
    // MARK: - Graphable
    public var graphPoints: [GraphPoint] {
        var points = [GraphPoint]()
        points.append(contentsOf: innerArc.graphPoints)
        points.append(contentsOf: outerArc.graphPoints)
        return points
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
    }
    
    public var path: CGMutablePath {
        let path = CGMutablePath()
        
        let gf = graphFrame
        let offset = gf.graphOriginOffset
        let translatedEnd = gf.boundedPoint(graphPoint: outerArc.endPoint)
        
        path.addArc(center: offset, radius: innerArc.radius, startAngle: innerArc.startDegree.radians, endAngle: innerArc.endDegree.radians, clockwise: false)
        path.addLine(to: translatedEnd)
        path.addArc(center: offset, radius: outerArc.radius, startAngle: outerArc.endDegree.radians, endAngle: outerArc.startDegree.radians, clockwise: true)
        path.closeSubpath()
        
        return path
    }
}

#endif
