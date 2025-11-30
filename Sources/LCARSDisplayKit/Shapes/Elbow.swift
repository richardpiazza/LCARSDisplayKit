import GraphPoint
import Swift2D

/// A large container element that 'wraps' around other content.
public struct Elbow: Hashable, Sendable {

    public static let defaultHorizontalHeight: Double = 120.0
    public static let defaultVerticalWidth: Double = 30.0
    public static let defaultClosedHeight: Double = 0.0

    public let size: Size
    public let top: Bool
    public let left: Bool
    public let rounded: Bool
    public let horizontalHeight: Double
    public let verticalWidth: Double
    public let closedHeight: Double
    public let shouldMatchRadius: Bool

    /// Initialize a `Elbow` Cartesian Shape.
    ///
    /// - parameters:
    ///   - size: The size of the shape.
    ///   - top: Indicates the 'elbow' is drawn at the 'top' of the frame.
    ///   - left: Indicates the 'stem' is drawn at the 'left' of the frame.
    ///   - rounded: Specifies if the corner specified by `top` and `left` should be rounded.
    ///   - horizontalHeight: The height of the 'elbow'.
    ///   - verticalWidth: The width of the 'stem'.
    ///   - closedHeight: If closedHeight > 0, an additional area is drawn parallel to the horizontalHeight area.
    ///   - shouldMatchRadius: If true, the interior radius will match the exterior radius.
    public init(
        size: Size = .zero,
        top: Bool = true,
        left: Bool = true,
        rounded: Bool = true,
        horizontalHeight: Double = Self.defaultHorizontalHeight,
        verticalWidth: Double = Self.defaultVerticalWidth,
        closedHeight: Double = Self.defaultClosedHeight,
        shouldMatchRadius: Bool = false
    ) {
        self.size = size
        self.top = top
        self.left = left
        self.rounded = rounded
        self.horizontalHeight = horizontalHeight
        self.verticalWidth = verticalWidth
        self.closedHeight = closedHeight
        self.shouldMatchRadius = shouldMatchRadius
    }

    @available(*, deprecated)
    public init(
        identifier: CartesianIdentifier?,
        size: Size = .zero,
        top: Bool = true,
        left: Bool = true,
        rounded: Bool = true,
        horizontalHeight: Double = Self.defaultHorizontalHeight,
        verticalWidth: Double = Self.defaultVerticalWidth,
        closedHeight: Double = Self.defaultClosedHeight,
        shouldMatchRadius: Bool = false
    ) {
        self.size = size
        self.top = top
        self.left = left
        self.rounded = rounded
        self.horizontalHeight = horizontalHeight
        self.verticalWidth = verticalWidth
        self.closedHeight = closedHeight
        self.shouldMatchRadius = shouldMatchRadius
    }

    public var identifier: CartesianIdentifier? { nil }
}

extension Elbow: SizeConvertible {}
