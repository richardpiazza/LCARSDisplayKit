import GraphPoint
import Swift2D

/// The central element of any cardinal direction cluster.
public struct Crux: Hashable, Sendable {

    public static let intrinsicSize: Size = Size(width: 60.0, height: 60.0)

    public let size: Size

    private var radius: Radius {
        max(size.width, size.height) / 2.0
    }

    /// Initialize a `Crux` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianIdentifier`.
    ///   - size: The `Size` that the element should have.
    public init(
        size: Size = Self.intrinsicSize
    ) {
        self.size = size
    }

    /// Initialize a `Crux` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianIdentifier`.
    ///   - radius: The radius used to calculate the `size` of the element.
    public init(
        radius: Radius
    ) {
        size = Size(width: radius * 2.0, height: radius * 2.0)
    }

    @available(*, deprecated)
    public init(
        identifier: CartesianIdentifier?,
        size: Size = Self.intrinsicSize
    ) {
        self.size = size
    }

    @available(*, deprecated)
    public init(
        identifier: CartesianIdentifier?,
        radius: Radius
    ) {
        size = Size(width: radius * 2.0, height: radius * 2.0)
    }

    @available(*, deprecated, message: "Use `CruxControl`")
    public var identifier: CartesianIdentifier? { nil }
}

extension Crux: SizeConvertible {}
