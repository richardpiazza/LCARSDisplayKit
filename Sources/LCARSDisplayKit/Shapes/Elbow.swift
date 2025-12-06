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
    
    @available(*, deprecated, renamed: "intrinsicBodyHeight")
    public static var defaultHorizontalHeight: Double { intrinsicBodyHeight }
    @available(*, deprecated, renamed: "intrinsicStemWidth")
    public static var defaultVerticalWidth: Double { intrinsicStemWidth }
    @available(*, deprecated, renamed: "intrinsicClosedHeight")
    public static var defaultClosedHeight: Double { intrinsicClosedHeight }

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
    
    @available(*, deprecated, renamed: "init(size:alignment:exteriorRounding:interiorRounding:bodyHeight:stemWidth:closedHeight:)")
    public init(
        size: Size = Self.intrinsicSize,
        top: Bool = true,
        left: Bool = true,
        rounded: Bool = true,
        horizontalHeight: Double = Self.defaultHorizontalHeight,
        verticalWidth: Double = Self.defaultVerticalWidth,
        closedHeight: Double = Self.defaultClosedHeight,
        shouldMatchRadius: Bool = false
    ) {
        self.size = size
        alignment = switch (top, left) {
        case (true, true): .topLeft
        case (true, false): .topRight
        case (false, true): .bottomLeft
        case (false, false): .bottomRight
        }
        exteriorRounding = rounded ? .half : nil
        interiorRounding = shouldMatchRadius ? .half : nil
        bodyHeight = horizontalHeight
        stemWidth = verticalWidth
        self.closedHeight = closedHeight
    }
    
    @available(*, deprecated, renamed: "alignment")
    public var top: Bool { alignment == .topLeft || alignment == .topRight }
    @available(*, deprecated, renamed: "alignment")
    public var left: Bool { alignment == .topLeft || alignment == .bottomLeft }
    @available(*, deprecated, renamed: "exteriorRounding")
    public var rounded: Bool { exteriorRounding != nil }
    @available(*, deprecated, renamed: "bodyHeight")
    public var horizontalHeight: Double { bodyHeight }
    @available(*, deprecated, renamed: "stemWidth")
    public var verticalWidth: Double { stemWidth }
    @available(*, deprecated, renamed: "interiorRounding")
    public var shouldMatchRadius: Bool { interiorRounding != nil }
}
