#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint

/// An `Arc` extended with straight lines to additional points
public struct EdgedCrescent {
    public var interiorArc: Arc
    public var edgePoints: [CartesianPoint]
    
    public init() {
        interiorArc = Arc()
        edgePoints = []
    }
    
    public init(
        interiorArc: Arc,
        edgePoints: [CartesianPoint] = []
    ) {
        self.interiorArc = interiorArc
        self.edgePoints = edgePoints
    }
}

extension EdgedCrescent: CartesianPointConvertible {
    public var cartesianPoints: [CartesianPoint] {
        [interiorArc.startingPoint, interiorArc.endingPoint] + edgePoints
    }
}

#if canImport(CoreGraphics)
extension EdgedCrescent: PathConvertible {
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
}
#endif
