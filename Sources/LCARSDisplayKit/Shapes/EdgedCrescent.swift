#if canImport(CoreGraphics)
import CoreGraphics
#else
import Foundation
#endif
import GraphPoint

/// An `Arc` extended with straight lines to additional points
public struct EdgedCrescent: Hashable, Sendable {
    public let identifier: CartesianShapeIdentifier?
    public let interiorArc: Arc
    public let edgePoints: [CartesianPoint]

    /// Initialize a `EdgedCrescent` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianShapeIdentifier`.
    ///   - interiorArc:
    ///   - edgePoints:
    public init(
        identifier: CartesianShapeIdentifier? = nil,
        interiorArc: Arc = Arc(),
        edgePoints: [CartesianPoint] = []
    ) {
        self.identifier = identifier
        self.interiorArc = interiorArc
        self.edgePoints = edgePoints
    }
}

extension EdgedCrescent: CartesianShape {
    public var cartesianPoints: [CartesianPoint] {
        [interiorArc.startingPoint, interiorArc.endingPoint] + edgePoints
    }

    #if canImport(CoreGraphics) || canImport(Foundation)
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()

        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin

        path.addArc(arc: interiorArc, center: center, clockwise: false)

        for point in edgePoints.reversed() {
            let translated = frame.relativePointForCartesianPoint(point)
            path.addLine(to: translated)
        }

        path.closeSubpath()

        return path
    }
    #endif
}
