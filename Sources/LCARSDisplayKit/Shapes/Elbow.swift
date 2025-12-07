import GraphPoint
import Swift2D

/// A large container element that 'wraps' around other content.
public struct Elbow: Hashable, Sendable, SizeConvertible {

    public enum Alignment: Sendable {
        case bottomLeft
        case bottomRight
        case topLeft
        case topRight
    }

    public static let intrinsicSize: Size = Size(width: 340, height: 700)
    public static let intrinsicBodyHeight: Double = 240.0
    public static let intrinsicStemWidth: Double = 90.0
    public static let intrinsicClosedHeight: Double = 0.0

    public let size: Size
    public let alignment: Alignment
    public let exteriorRounding: Rounding?
    public let interiorRounding: Rounding?
    public let bodyHeight: Double
    public let stemWidth: Double
    public let closedHeight: Double

    /// Initialize a `Elbow`.
    ///
    /// - parameters:
    ///   - size: The size of the shape.
    ///   - alignment: The direction/orientation of the shape.
    ///   - exteriorRounding: The rounding that will be used on the exterior bend of the shape.
    ///   - interiorRounding: Optional rounding applied to the interior bend of the shape.
    ///   - bodyHeight: The height of the 'elbow'.
    ///   - stemWidth: The width of the 'stem'.
    ///   - closedHeight: If closedHeight > 0, an additional area is drawn parallel to the `bodyHeight` area.
    public init(
        size: Size = Self.intrinsicSize,
        alignment: Alignment = .topLeft,
        exteriorRounding: Rounding? = .half,
        interiorRounding: Rounding? = nil,
        bodyHeight: Double = Self.intrinsicBodyHeight,
        stemWidth: Double = Self.intrinsicStemWidth,
        closedHeight: Double = Self.intrinsicClosedHeight
    ) {
        self.size = size
        self.alignment = alignment
        self.exteriorRounding = exteriorRounding
        self.interiorRounding = interiorRounding
        self.bodyHeight = bodyHeight
        self.stemWidth = stemWidth
        self.closedHeight = closedHeight
    }

    public init(
        scale: Double,
        bodyHeight: Double? = nil,
        stemWidth: Double? = nil,
        closedHeight: Double? = nil,
        alignment: Alignment = .topLeft,
        exteriorRounding: Rounding? = .half,
        interiorRounding: Rounding? = nil
    ) {
        size = Size(
            width: Self.intrinsicSize.width * scale,
            height: Self.intrinsicSize.height * scale
        )
        self.bodyHeight = bodyHeight ?? Self.intrinsicBodyHeight * scale
        self.stemWidth = stemWidth ?? Self.intrinsicStemWidth * scale
        self.closedHeight = closedHeight ?? Self.intrinsicClosedHeight * scale
        self.alignment = alignment
        self.exteriorRounding = exteriorRounding
        self.interiorRounding = interiorRounding
    }
}
