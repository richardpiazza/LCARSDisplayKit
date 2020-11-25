import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics
#endif

/// Two `Arc`s connected by straight lines at their end points.
public struct Crescent {
    public var size: CGSize = CGSize.zero
    public var innerArc: Arc
    public var outerArc: Arc
    
    public init(innerArc: Arc = Arc(), outerArc: Arc = Arc(), boundedStart: Bool = false, boundedEnd: Bool = false) {
        self.innerArc = innerArc
        self.outerArc = outerArc
        if boundedStart {
            self.outerArc.startLimiter = self.innerArc.startingPoint
        }
        if boundedEnd {
            self.outerArc.endLimiter = self.innerArc.endingPoint
        }
    }
    
    var boundStart: Bool = false {
        didSet {
            if boundStart {
                outerArc.startLimiter = innerArc.startingPoint
            } else {
                outerArc.startLimiter = nil
            }
        }
    }
    
    var boundEnd: Bool = false {
        didSet {
            if boundEnd {
                outerArc.endLimiter = innerArc.endingPoint
            } else {
                outerArc.endLimiter = nil
            }
        }
    }
}

public extension Crescent {
    var innerRadius: Radius {
        return min(innerArc.radius, outerArc.radius)
    }
    
    var outerRadius: Radius {
        return max(outerArc.radius, innerArc.radius)
    }
    
    var startDegree: Degree {
        return min(innerArc.startDegree, outerArc.startDegree)
    }
    
    var endDegree: Degree {
        return max(innerArc.endDegree, outerArc.endDegree)
    }
}

extension Crescent: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return [innerArc.cartesianPoints, outerArc.cartesianPoints].flatMap { $0 }
    }
}

#if canImport(CoreGraphics)
extension Crescent: ExpressibleByPath {
    public var path: CGMutablePath {
        let path = CGMutablePath()
        
        let gf = graphFrame
        let offset = gf.graphOriginOffset
        let translatedEnd = gf.boundedPoint(graphPoint: outerArc.endPoint)

        path.addArc(center: offset, radius: CGFloat(innerArc.radius), startAngle: CGFloat(innerArc.startDegree.radians), endAngle: CGFloat(innerArc.endDegree.radians), clockwise: false)
        path.addLine(to: translatedEnd)
        path.addArc(center: offset, radius: CGFloat(outerArc.radius), startAngle: CGFloat(outerArc.endDegree.radians), endAngle: CGFloat(outerArc.startDegree.radians), clockwise: true)
        path.closeSubpath()
        
        #warning("Producing flat sides when crossing some axes.")
//        let frame = cartesianFrame
//        let center = frame.offsetToCartesianOrigin
//        let translated = frame.originModifiedBy(outerArc.endingPoint)
//
//        path.addArc(center: center, radius: innerRadius, startAngle: innerArc.startDegree, endAngle: innerArc.endDegree, clockwise: false)
//        path.addLine(to: translated)
//        path.addArc(center: center, radius: outerRadius, startAngle: outerArc.endDegree, endAngle: outerArc.startDegree, clockwise: true)
//        path.closeSubpath()
        
        return path
    }
    
    public var subpaths: [CGMutablePath]? {
        return nil
    }
}

extension Crescent: Graphable {
    @available(*, deprecated)
    public var graphPoints: [GraphPoint] {
        var points = [GraphPoint]()
        points.append(contentsOf: innerArc.graphPoints)
        points.append(contentsOf: outerArc.graphPoints)
        return points
    }
    
    @available(*, deprecated)
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: CGFloat(outerRadius), startDegree: CGFloat(startDegree), endDegree: CGFloat(endDegree))
    }
}

extension Crescent {
    @available(*, deprecated)
    public init(innerRadius: CGFloat, outerRadius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, boundedStart: Bool = false, boundedEnd: Bool = false) {
        let innerArc = Arc(radius: innerRadius, startDegree: startDegree, endDegree: endDegree)
        let outerArc = Arc(radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
        self.init(innerArc: innerArc, outerArc: outerArc, boundedStart: boundedStart, boundedEnd: boundedEnd)
    }
}
#endif
