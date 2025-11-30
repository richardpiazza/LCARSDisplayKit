#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

public struct CruxControl: CartesianPlaceable {
    public let crux: Crux
    public let identifier: CartesianIdentifier?

    public init(
        crux: Crux,
        identifier: CartesianIdentifier? = nil
    ) {
        self.crux = crux
        self.identifier = identifier
    }

    private var radius: Radius {
        max(crux.size.width, crux.size.height) / 2.0
    }

    public var cartesianPoints: [CartesianPoint] {
        [
            CartesianPoint(x: -radius, y: -radius),
            CartesianPoint(x: radius, y: -radius),
            CartesianPoint(x: -radius, y: radius),
            CartesianPoint(x: radius, y: radius),
        ]
    }

    public var cartesianFrame: CartesianFrame {
        CartesianFrame.make(for: cartesianPoints)
    }
}

#if canImport(CoreGraphics)
extension CruxControl: PathConvertible {
    public var path: CGPath {
        let path = CGMutablePath()

        path.move(to: .zero)
        path.addRect(Rect(origin: .zero, size: crux.size))
        path.closeSubpath()

        return path
    }
}
#endif
