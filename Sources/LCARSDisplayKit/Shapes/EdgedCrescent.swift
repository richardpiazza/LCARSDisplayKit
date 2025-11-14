#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint

/// An `Arc` extended with straight lines to additional points
public struct EdgedCrescent: Hashable, Sendable {
    public let interiorArc: Arc
    public let edgePoints: [CartesianPoint]
    
    public init(
        interiorArc: Arc = Arc(),
        edgePoints: [CartesianPoint] = []
    ) {
        self.interiorArc = interiorArc
        self.edgePoints = edgePoints
    }
}

extension EdgedCrescent: CartesianShape {
    public var cartesianPoints: [CartesianPoint] {
        [interiorArc.startingPoint, interiorArc.endingPoint] + edgePoints
    }
    
    #if canImport(CoreGraphics)
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        
        path.addArc(arc: interiorArc, center: center, clockwise: false)
        
        edgePoints.reversed().forEach { (point) in
            let translated = frame.relativePointForCartesianPoint(point)
            path.addLine(to: translated)
        }
        
        path.closeSubpath()
        
        return path
    }
    #endif
}
