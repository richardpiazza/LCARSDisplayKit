import GraphPoint
import Swift2D

/// A rectangle with optionally rounded ends
public struct RoundedRectangle {
    
    /// Points used to define the frame of the shaped.
    public var cartesianPoints: [CartesianPoint]
    /// The size of the shape - modifiable through intrinsic values
    public var size: Size
    
    public var leftRounded: Bool
    public var rightRounded: Bool
    public var cornersOnly: Bool
    
    public init() {
        cartesianPoints = []
        size = .zero
        leftRounded = false
        rightRounded = false
        cornersOnly = false
    }
    
    public init(cartesianPoints: [CartesianPoint], leftRounded: Bool = false, rightRounded: Bool = false, cornersOnly: Bool = false) {
        self.cartesianPoints = cartesianPoints
        self.size = CartesianFrame.make(for: cartesianPoints).size
        self.leftRounded = leftRounded
        self.rightRounded = rightRounded
        self.cornersOnly = cornersOnly
    }
}

public extension RoundedRectangle {
    /// Calculates the radius of the arcs depending on `cornersOnly`
    var radius: Radius {
        return (cornersOnly) ? size.height * 0.25 : size.height * 0.5
    }
    
    var upperLeftCenter: Point {
        return Point(x: radius, y: radius)
    }
    
    var lowerRightCenter: Point {
        return Point(x: size.width - radius, y: size.height - radius)
    }
}

extension RoundedRectangle: ExpressibleByCartesianPoints {
}
