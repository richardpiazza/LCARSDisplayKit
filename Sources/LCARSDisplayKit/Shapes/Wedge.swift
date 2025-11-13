#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

/// A `Arc` that uses it's `pivotPoint` to draw a wedge.
public struct Wedge: Hashable, Sendable {
    
    public var exteriorArc: Arc
    
    public init() {
        exteriorArc = Arc()
    }
    
    public init(exteriorArc: Arc) {
        self.exteriorArc = exteriorArc
    }
    
    public init(_ sector: DPad.Sector, radius: Radius) {
        exteriorArc = Arc(radius: radius, sector: sector)
    }
}

extension Wedge: CartesianPointConvertible {
    public var cartesianPoints: [CartesianPoint] {
        [exteriorArc.startingPoint, exteriorArc.endingPoint]
    }
}

#if canImport(CoreGraphics)
extension Wedge: PathConvertible {
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let pivot = frame.relativePointForCartesianPoint(exteriorArc.pivotPoint)
        
        path.addArc(arc: exteriorArc, center: center, clockwise: false)
        path.addLine(to: pivot)
        path.closeSubpath()
        
        return path
    }
}
#endif
