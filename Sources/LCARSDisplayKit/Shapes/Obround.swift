import GraphPoint
import Swift2D

/// A rectangle with optionally rounded ends
public struct Obround: Hashable, Sendable {

    public static let intrinsicSize: Size = Size(width: 144.0, height: 60.0)

    public let size: Size
    public let leftRounded: Bool
    public let rightRounded: Bool
    public let cornersOnly: Bool

    /// Initialize a `Obround` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianIdentifier`.
    ///   - size: The size of the shape - modifiable through intrinsic values
    ///   - point: Indicates where in a `CartesianPlane` the shape is drawn. (top, left)
    ///   - roundLeading: Indicates the leading edge of the shape should be rounded.
    ///   - roundTrailing: Indicates the trailing edge of the shape should be rounded.
    ///   - cornersOnly: Limits the radius of the corners to '1/4' instead of '1/2'.
    public init(
        size: Size = Self.intrinsicSize,
        roundLeading: Bool = true,
        roundTrailing: Bool = true,
        cornersOnly: Bool = false
    ) {
        self.size = size
        leftRounded = roundLeading
        rightRounded = roundTrailing
        self.cornersOnly = cornersOnly
    }

    @available(*, deprecated)
    public init(
        identifier: CartesianIdentifier? = nil,
        size: Size = Self.intrinsicSize,
        at point: CartesianPoint = .zero,
        roundLeading: Bool = true,
        roundTrailing: Bool = true,
        cornersOnly: Bool = false
    ) {
        self.size = size
        leftRounded = roundLeading
        rightRounded = roundTrailing
        self.cornersOnly = cornersOnly
    }

    @available(*, deprecated, message: "Use `ObroundControl`")
    public var identifier: CartesianIdentifier? { nil }

    @available(*, deprecated, message: "Use `ObroundControl`")
    public var cartesianPoints: [CartesianPoint] { [] }
}

extension Obround: SizeConvertible {}
