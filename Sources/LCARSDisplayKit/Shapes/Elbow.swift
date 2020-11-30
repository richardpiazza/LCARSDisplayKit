import GraphPoint
import Swift2D

public struct Elbow {
    
    public static let defaultHorizontalHeight: Float = 120.0
    public static let defaultVerticalWidth: Float = 30.0
    public static let defaultClosedHeight: Float = 0.0
    
    /// The size of the shape - modifiable through intrinsic values
    public var size: Size
    
    public var top: Bool
    public var left: Bool
    /// Specifies if the corner specified by `top` and `left` should be rounded.
    public var rounded: Bool
    public var horizontalHeight: Float
    public var verticalWidth: Float
    /// If closedHeight > 0, an additional area is drawn parallel to the horizontalHeight area.
    public var closedHeight: Float
    /// If true, the interior radius will match the exterior radius.
    public var shouldMatchRadius: Bool
    
    public init() {
        size = .zero
        top = true
        left = true
        rounded = true
        horizontalHeight = Self.defaultHorizontalHeight
        verticalWidth = Self.defaultVerticalWidth
        closedHeight = Self.defaultClosedHeight
        shouldMatchRadius = false
    }
    
    public init(
        size: Size,
        top: Bool = true,
        left: Bool = true,
        rounded: Bool = true,
        horizontalHeight: Float = Self.defaultHorizontalHeight,
        verticalWidth: Float = Self.defaultVerticalWidth,
        closedHeight: Float = Self.defaultClosedHeight,
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
}

public extension Elbow {
    var outerRadius: Radius {
        return max(horizontalHeight, verticalWidth) / 2
    }
    
    var innerRadius: Radius {
        shouldMatchRadius ? outerRadius : (outerRadius / 2.4)
    }
    
    var upperLeftOuterCenter: CartesianPoint {
        .init(x: outerRadius, y: outerRadius)
    }
    
    var upperLeftInnerCenter: CartesianPoint {
        .init(x: verticalWidth + innerRadius, y: horizontalHeight + innerRadius)
    }
    
    var lowerRightOuterCenter: CartesianPoint {
        .init(x: size.width - outerRadius, y: size.height - outerRadius)
    }
    
    var lowerRightInnerCenter: CartesianPoint {
        .init(x: size.width - verticalWidth - innerRadius, y: size.height - horizontalHeight - innerRadius)
    }
}

extension Elbow: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return []
    }
}
