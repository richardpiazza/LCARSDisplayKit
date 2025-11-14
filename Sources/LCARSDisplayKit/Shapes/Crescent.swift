#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint

/// Two `Arc`s connected by straight lines at their end points.
public struct Crescent: Hashable, Sendable {
    
    /// Arc with radius closest to the cartesian origin.
    public let interiorArc: Arc
    /// Arc with radius farthest from the cartesian origin.
    public let exteriorArc: Arc
    
    public init(
        interiorArc: Arc = Arc(),
        exteriorArc: Arc = Arc()
    ) {
        self.interiorArc = interiorArc
        self.exteriorArc = exteriorArc
    }
}

extension Crescent: CartesianShape {
    public var cartesianPoints: [CartesianPoint] {
        [
            interiorArc.startingPoint,
            interiorArc.endingPoint,
            exteriorArc.startingPoint,
            exteriorArc.endingPoint,
        ]
    }
    
    public var cartesianFrame: CartesianFrame {
        (try? .make(for: exteriorArc, points: cartesianPoints)) ?? .zero
    }
    
    #if canImport(CoreGraphics)
    public var path: CGPath {
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let translated = frame.relativePointForCartesianPoint(exteriorArc.endingPoint)
        
        let path = CGMutablePath()
        path.addArc(arc: interiorArc, center: center, clockwise: false)
        path.addLine(to: translated)
        path.addArc(arc: exteriorArc.reversed, center: center, clockwise: true)
        path.closeSubpath()
        
        return path
    }
    #endif
}
