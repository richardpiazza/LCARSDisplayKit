import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics

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

@available(*, deprecated)
extension Crescent: Graphable {
    public var size: CGSize {
        get { .zero }
        set { }
    }
    
    public var graphPoints: [GraphPoint] {
        var points = [GraphPoint]()
        points.append(contentsOf: innerArc.graphPoints)
        points.append(contentsOf: outerArc.graphPoints)
        return points
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: CGFloat(outerRadius), startDegree: CGFloat(startDegree), endDegree: CGFloat(endDegree))
    }
}

@available(*, deprecated)
extension Crescent {
    public init(innerRadius: CGFloat, outerRadius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, boundedStart: Bool = false, boundedEnd: Bool = false) {
        let innerArc = Arc(radius: innerRadius, startDegree: startDegree, endDegree: endDegree)
        let outerArc = Arc(radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
        self.init(innerArc: innerArc, outerArc: outerArc, boundedStart: boundedStart, boundedEnd: boundedEnd)
    }
}
#endif
