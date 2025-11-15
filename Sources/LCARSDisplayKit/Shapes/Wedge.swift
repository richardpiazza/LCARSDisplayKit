#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

/// A `Arc` that uses it's `pivotPoint` to draw a wedge.
public struct Wedge: Hashable, Sendable {

    public enum Sector: CartesianShapeIdentifier, Hashable, Sendable, CaseIterable {
        case sector1
        case sector2
        case sector3
        case sector4

        public var start: Degree {
            switch self {
            case .sector1: 12
            case .sector2: 102
            case .sector3: 192
            case .sector4: 282
            }
        }

        public var end: Degree {
            switch self {
            case .sector1: 78
            case .sector2: 168
            case .sector3: 258
            case .sector4: 348
            }
        }
    }

    public let identifier: CartesianShapeIdentifier?
    public let exteriorArc: Arc

    /// Initialize a `Wedge` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianShapeIdentifier`.
    ///   - exteriorArc:
    public init(
        identifier: CartesianShapeIdentifier? = nil,
        exteriorArc: Arc = Arc()
    ) {
        self.identifier = identifier
        self.exteriorArc = exteriorArc
    }

    /// Initialize a `Wedge` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianShapeIdentifier`.
    ///   - sector:
    ///   - radius:
    public init(
        identifier: CartesianShapeIdentifier? = nil,
        sector: Sector,
        radius: Radius
    ) {
        self.identifier = identifier
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
