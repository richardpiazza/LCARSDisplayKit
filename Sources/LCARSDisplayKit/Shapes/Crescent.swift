#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint

/// Two `Arc`s connected by straight lines at their end points.
public struct Crescent: Hashable, Sendable {
    public let identifier: CartesianShapeIdentifier?
    public let interiorArc: Arc
    public let exteriorArc: Arc

    /// Initialize a `Crescent` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianShapeIdentifier`.
    ///   - interiorArc: Arc with radius closest to the cartesian origin.
    ///   - exteriorArc: Arc with radius farthest from the cartesian origin.
    public init(
        identifier: CartesianShapeIdentifier? = nil,
        interiorArc: Arc = Arc(),
        exteriorArc: Arc = Arc()
    ) {
        self.identifier = identifier
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
        let exteriorReversed = Arc(radius: exteriorArc.radius, startingDegree: exteriorArc.endingDegree, endingDegree: exteriorArc.startingDegree)

        let path = CGMutablePath()
        path.addArc(arc: interiorArc, center: center, clockwise: false)
        path.addLine(to: translated)
        path.addArc(arc: exteriorReversed, center: center, clockwise: true)
        path.closeSubpath()

        return path
    }
    #endif
}
