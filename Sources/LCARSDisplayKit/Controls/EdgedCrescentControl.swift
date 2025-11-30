#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

public struct EdgedCrescentControl: CartesianPlaceable {
    public let edgedCrescent: EdgedCrescent
    public let identifier: CartesianIdentifier?

    public init(
        edgedCrescent: EdgedCrescent,
        identifier: CartesianIdentifier? = nil
    ) {
        self.edgedCrescent = edgedCrescent
        self.identifier = identifier
    }

    public var cartesianPoints: [CartesianPoint] {
        [
            edgedCrescent.interiorArc.startingPoint,
            edgedCrescent.interiorArc.endingPoint,
        ] + edgedCrescent.edgePoints
    }
}

#if canImport(CoreGraphics)
extension EdgedCrescentControl: PathConvertible {
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()

        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin

        path.addArc(arc: edgedCrescent.interiorArc, center: center, clockwise: false)

        for point in edgedCrescent.edgePoints.reversed() {
            let translated = frame.relativePointForCartesianPoint(point)
            path.addLine(to: translated)
        }

        path.closeSubpath()

        return path
    }
}
#endif
