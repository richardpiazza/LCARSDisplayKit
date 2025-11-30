#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

public struct ObroundControl: CartesianPlaceable {
    public let obround: Obround
    public let point: CartesianPoint
    public let identifier: CartesianIdentifier?

    public init(
        obround: Obround,
        at point: Point,
        identifier: CartesianIdentifier? = nil
    ) {
        self.obround = obround
        self.point = point
        self.identifier = identifier
    }

    public var cartesianPoints: [CartesianPoint] {
        [
            point,
            CartesianPoint(
                x: point.x + obround.size.width,
                y: point.y - obround.size.height
            ),
        ]
    }
}

#if canImport(CoreGraphics)
extension ObroundControl: PathConvertible {
    public var path: CGPath { obround.path }
}
#endif
