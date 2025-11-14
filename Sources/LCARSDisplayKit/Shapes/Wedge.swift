#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

/// A `Arc` that uses it's `pivotPoint` to draw a wedge.
public struct Wedge: Hashable, Sendable {
    
    public let exteriorArc: Arc
    
    public init(
        exteriorArc: Arc = Arc()
    ) {
        self.exteriorArc = exteriorArc
    }
}

extension Wedge: CartesianShape {
    public var cartesianPoints: [CartesianPoint] {
        [exteriorArc.startingPoint, exteriorArc.endingPoint]
    }
    
    #if canImport(CoreGraphics)
    public var path: CGPath {
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let pivot = frame.relativePointForCartesianPoint(exteriorArc.pivotPoint)
        
        let path = CGMutablePath()
        path.addArc(arc: exteriorArc, center: center, clockwise: false)
        path.addLine(to: pivot)
        path.closeSubpath()
        
        return path
    }
    #endif
}
