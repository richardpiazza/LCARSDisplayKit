#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

/// A `Arc` that uses it's `pivotPoint` to draw a wedge.
public struct Wedge: Hashable, Sendable {
    
    public enum Sector: Hashable, Sendable, CaseIterable {
        case sector01
        case sector02
        case sector03
        case sector04
        
        public var start: Degree {
            switch self {
            case .sector01: return 12
            case .sector02: return 102
            case .sector03: return 192
            case .sector04: return 282
            }
        }
        
        public var end: Degree {
            switch self {
            case .sector01: return 78
            case .sector02: return 168
            case .sector03: return 258
            case .sector04: return 348
            }
        }
    }
    
    public let exteriorArc: Arc
    
    public init(
        exteriorArc: Arc = Arc()
    ) {
        self.exteriorArc = exteriorArc
    }
    
    public init(
        sector: Sector,
        radius: Radius
    ) {
        exteriorArc = Arc(
            radius: radius,
            startingDegree: sector.start,
            endingDegree: sector.end
        )
    }
}

extension Wedge: CartesianShape {
    public var cartesianPoints: [CartesianPoint] {
        [
            exteriorArc.startingPoint,
            exteriorArc.endingPoint,
        ]
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
