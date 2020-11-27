import GraphPoint
import Swift2D

/// A rectangle with optionally rounded ends
public struct RoundedRectangle {
    public var _size: Size
    public var _cartesianPoints: [CartesianPoint]
    
    public var leftRounded: Bool
    public var rightRounded: Bool
    public var cornersOnly: Bool
    
    @available(*, deprecated, renamed: "init(cartesianPoints:leftRounded:rightRounded:cornersOnly:)")
    public init(size: Size, leftRounded: Bool = false, rightRounded: Bool = false, cornersOnly: Bool = false) {
        self._size = size
        self._cartesianPoints = []
        self.leftRounded = leftRounded
        self.rightRounded = rightRounded
        self.cornersOnly = cornersOnly
    }
    
    public init(cartesianPoints: [CartesianPoint] = [], leftRounded: Bool = false, rightRounded: Bool = false, cornersOnly: Bool = false) {
        self._cartesianPoints = cartesianPoints
        self._size = CartesianFrame.make(for: cartesianPoints).size
        self.leftRounded = leftRounded
        self.rightRounded = rightRounded
        self.cornersOnly = cornersOnly
    }
}

public extension RoundedRectangle {
    /// Calculates the radius of the arcs depending on `cornersOnly`
    var radius: Radius {
        return (cornersOnly) ? _size.height * 0.25 : _size.height * 0.5
    }
    
    var upperLeftCenter: Point {
        return Point(x: radius, y: radius)
    }
    
    var lowerRightCenter: Point {
        return Point(x: _size.width - radius, y: _size.height - radius)
    }
}

extension RoundedRectangle: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return _cartesianPoints
    }
}
