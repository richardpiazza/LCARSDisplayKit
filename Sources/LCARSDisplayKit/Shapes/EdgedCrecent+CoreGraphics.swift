import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics

extension EdgedCrescent: ExpressibleByPath {
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        
        path.addArc(center: center, radius: arc.radius, startAngle: arc.startDegree, endAngle: arc.endDegree, clockwise: false)
        
        edgePoints.reversed().forEach { (point) in
            let translated = frame.originModifiedBy(point)
            path.addLine(to: translated)
        }
        
        path.closeSubpath()
        
        return path
    }
    
    public var subpaths: [CGMutablePath]? {
        return nil
    }
}

@available(*, deprecated)
extension EdgedCrescent: Graphable {
    public var size: CGSize {
        get { .zero }
        set { }
    }
    
    public var graphPoints: [GraphPoint] {
        var points = [GraphPoint]()
        points.append(contentsOf: arc.graphPoints)
        points.append(contentsOf: additionalPoints)
        return points
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: CGFloat(arc.radius), startDegree: CGFloat(arc.startDegree), endDegree: CGFloat(arc.endDegree))
    }
}

@available(*, deprecated)
extension EdgedCrescent {
    public init(arc: Arc = Arc(), additionalPoints: [GraphPoint]) {
        self.init(arc: arc, edgePoints: [])
        self.additionalPoints = additionalPoints
    }
    
    public var additionalPoints: [GraphPoint] {
        get {
            edgePoints.map { GraphPoint($0) }
        }
        set {
            edgePoints = newValue.map { CartesianPoint($0) }
        }
    }
}

#endif
