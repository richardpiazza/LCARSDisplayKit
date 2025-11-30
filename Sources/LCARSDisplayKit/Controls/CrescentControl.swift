#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

public struct CrescentControl: CartesianPlaceable {
    public let crescent: Crescent
    public let identifier: CartesianIdentifier?

    public init(
        crescent: Crescent,
        identifier: CartesianIdentifier? = nil
    ) {
        self.crescent = crescent
        self.identifier = identifier
    }

    public var cartesianPoints: [CartesianPoint] {
        [
            crescent.interiorArc.startingPoint,
            crescent.interiorArc.endingPoint,
            crescent.exteriorArc.startingPoint,
            crescent.exteriorArc.endingPoint,
        ]
    }

    public var cartesianFrame: CartesianFrame {
        (try? CartesianFrame.make(for: crescent.exteriorArc, points: cartesianPoints)) ?? .zero
    }
}

#if canImport(CoreGraphics)
extension CrescentControl: PathConvertible {
    public var path: CGPath {
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let translated = frame.relativePointForCartesianPoint(crescent.exteriorArc.endingPoint)
        let exteriorReversed = Arc(
            radius: crescent.exteriorArc.radius,
            startingDegree: crescent.exteriorArc.endingDegree,
            endingDegree: crescent.exteriorArc.startingDegree
        )

        let path = CGMutablePath()
        path.addArc(arc: crescent.interiorArc, center: center, clockwise: false)
        path.addLine(to: translated)
        path.addArc(arc: exteriorReversed, center: center, clockwise: true)
        path.closeSubpath()

        return path
    }
}
#endif
