import GraphPoint
import Swift2D

public struct Elbow {
    public var _size: Size
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
    
    public init(
        size: Size,
        top: Bool = true,
        left: Bool = true,
        rounded: Bool = true,
        horizontalHeight: Float = 120.0,
        verticalWidth: Float = 30.0,
        closedHeight: Float = 0.0,
        shouldMatchRadius: Bool = false
    ) {
        self._size = size
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
        .init(x: _size.width - outerRadius, y: _size.height - outerRadius)
    }
    
    var lowerRightInnerCenter: CartesianPoint {
        .init(x: _size.width - verticalWidth - innerRadius, y: _size.height - horizontalHeight - innerRadius)
    }
}

extension Elbow: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return []
    }
}
