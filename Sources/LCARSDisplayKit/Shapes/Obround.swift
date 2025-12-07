import GraphPoint
import Swift2D

/// A rectangle with optionally rounded ends
public struct Obround: Hashable, Sendable, SizeConvertible {

    public static let intrinsicSize: Size = Size(width: 144.0, height: 60.0)

    public let size: Size
    public let roundLeading: Bool
    public let roundTrailing: Bool
    public let rounding: Rounding

    /// Initialize a `Obround`.
    ///
    /// - parameters:
    ///   - size: The size of the shape - modifiable through intrinsic values
    ///   - roundLeading: Indicates the leading edge of the shape should be rounded.
    ///   - roundTrailing: Indicates the trailing edge of the shape should be rounded.
    ///   - rounding: How the corner rounding is applied.
    public init(
        size: Size = Self.intrinsicSize,
        roundLeading: Bool = true,
        roundTrailing: Bool = true,
        rounding: Rounding = .half
    ) {
        self.size = size
        self.roundLeading = roundLeading
        self.roundTrailing = roundTrailing
        self.rounding = rounding
    }

    public init(
        scale: Double,
        roundLeading: Bool = true,
        roundTrailing: Bool = true,
        rounding: Rounding = .half
    ) {
        size = Size(
            width: Self.intrinsicSize.width * scale,
            height: Self.intrinsicSize.height * scale
        )
        self.roundLeading = roundLeading
        self.roundTrailing = roundTrailing
        self.rounding = rounding
    }
}
