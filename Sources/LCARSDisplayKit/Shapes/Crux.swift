#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

/// The central element of any cardinal direction cluster.
public struct Crux: Hashable, Sendable {

    public static let intrinsicSize: Size = Size(width: 60.0, height: 60.0)

    public let identifier: CartesianShapeIdentifier?
    public let size: Size

    private var radius: Radius {
        max(size.width, size.height) / 2.0
    }

    /// Initialize a `Crux` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianShapeIdentifier`.
    ///   - size: The `CGSize` that the element should have.
    public init(
        identifier: CartesianShapeIdentifier? = nil,
        size: Size = Self.intrinsicSize
    ) {
        self.identifier = identifier
        self.size = size
    }

    /// Initialize a `Crux` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianShapeIdentifier`.
    ///   - radius: The radius used to calculate the `size` of the element.
    public init(
        identifier: CartesianShapeIdentifier? = nil,
        radius: Radius
    ) {
        self.identifier = identifier
        size = Size(width: radius * 2.0, height: radius * 2.0)
    }
}

extension Crux: CartesianShape {
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

    #if canImport(CoreGraphics)
    public var path: CGPath {
        let path = CGMutablePath()

        path.move(to: .zero)
        path.addRect(Rect(origin: .zero, size: size))
        path.closeSubpath()

        return path
    }
    #endif
}
