import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics
#endif

/// An interior `Arc` extended with straight lines to additional points
public struct EdgedCrescent {
    public var size: CGSize = CGSize.zero
    public var arc: Arc
    public var edgePoints: [CartesianPoint]
    
    public init(arc: Arc = Arc(), edgePoints: [CartesianPoint] = []) {
        self.arc = arc
        self.edgePoints = edgePoints
    }
}

extension EdgedCrescent: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return [arc.cartesianPoints, edgePoints].flatMap { $0 }
    }
}

#if canImport(CoreGraphics)
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

extension EdgedCrescent: Graphable {
    @available(*, deprecated)
    public var graphPoints: [GraphPoint] {
        var points = [GraphPoint]()
        points.append(contentsOf: arc.graphPoints)
        points.append(contentsOf: additionalPoints)
        return points
    }
    
    @available(*, deprecated)
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: CGFloat(arc.radius), startDegree: CGFloat(arc.startDegree), endDegree: CGFloat(arc.endDegree))
    }
}

extension EdgedCrescent {
    @available(*, deprecated)
    public init(arc: Arc = Arc(), additionalPoints: [GraphPoint]) {
        self.init(arc: arc, edgePoints: [])
        self.additionalPoints = additionalPoints
    }
    
    @available(*, deprecated)
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
