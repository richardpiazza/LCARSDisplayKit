import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics

/// An interior `Arc` extended with straight lines to additional points
public struct EdgedCrescent: Graphable {
    public var size: CGSize = CGSize.zero
    public var arc: Arc = Arc()
    public var additionalPoints: [GraphPoint] = [GraphPoint]()
    
    public init() {
    }
    
    public init(arc: Arc, additionalPoints: [GraphPoint]) {
        self.init()
        self.arc = arc
        self.additionalPoints = additionalPoints
    }
    
    // MARK: - Graphable
    public var graphPoints: [GraphPoint] {
        var points = [GraphPoint]()
        points.append(contentsOf: arc.graphPoints)
        points.append(contentsOf: additionalPoints)
        return points
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
    }
    
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let gf = graphFrame
        let offset = gf.graphOriginOffset
        
        path.addArc(center: offset, radius: arc.radius, startAngle: arc.startDegree.radians, endAngle: arc.endDegree.radians, clockwise: false)
        
        for point in Array(additionalPoints.reversed()) {
            let translatedPoint = gf.boundedPoint(graphPoint: point)
            path.addLine(to: translatedPoint)
        }
        
        path.closeSubpath()
        
        return path
    }
}

#endif
