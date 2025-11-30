#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

public struct WedgeControl: CartesianPlaceable {
    public let wedge: Wedge
    public let identifier: CartesianIdentifier?

    public init(
        wedge: Wedge,
        identifier: CartesianIdentifier? = nil
    ) {
        self.wedge = wedge
        self.identifier = identifier
    }

    public var cartesianPoints: [CartesianPoint] {
        [
            wedge.exteriorArc.startingPoint,
            wedge.exteriorArc.endingPoint,
        ]
    }
}

#if canImport(CoreGraphics)
extension WedgeControl: PathConvertible {
    public var path: CGPath {
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let pivot = frame.relativePointForCartesianPoint(wedge.exteriorArc.pivotPoint)

        let path = CGMutablePath()
        path.addArc(arc: wedge.exteriorArc, center: center, clockwise: false)
        path.addLine(to: pivot)
        path.closeSubpath()

        return path
    }
}
#endif
