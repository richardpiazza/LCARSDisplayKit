#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

public struct Elbow {
    
    public static let defaultHorizontalHeight: Double = 120.0
    public static let defaultVerticalWidth: Double = 30.0
    public static let defaultClosedHeight: Double = 0.0
    
    /// The size of the shape - modifiable through intrinsic values
    public var size: Size
    
    public var top: Bool
    public var left: Bool
    /// Specifies if the corner specified by `top` and `left` should be rounded.
    public var rounded: Bool
    public var horizontalHeight: Double
    public var verticalWidth: Double
    /// If closedHeight > 0, an additional area is drawn parallel to the horizontalHeight area.
    public var closedHeight: Double
    /// If true, the interior radius will match the exterior radius.
    public var shouldMatchRadius: Bool
    
    @available(*, deprecated, message: "Private?")
    public var outerRadius: Radius {
        max(horizontalHeight, verticalWidth) / 2
    }
    
    @available(*, deprecated, message: "Private?")
    public var innerRadius: Radius {
        shouldMatchRadius ? outerRadius : (outerRadius / 2.4)
    }
    
    @available(*, deprecated, message: "Private?")
    public var upperLeftOuterCenter: CartesianPoint {
        CartesianPoint(x: outerRadius, y: outerRadius)
    }
    
    @available(*, deprecated, message: "Private?")
    public var upperLeftInnerCenter: CartesianPoint {
        CartesianPoint(x: verticalWidth + innerRadius, y: horizontalHeight + innerRadius)
    }
    
    @available(*, deprecated, message: "Private?")
    public var lowerRightOuterCenter: CartesianPoint {
        CartesianPoint(x: size.width - outerRadius, y: size.height - outerRadius)
    }
    
    @available(*, deprecated, message: "Private?")
    public var lowerRightInnerCenter: CartesianPoint {
        CartesianPoint(x: size.width - verticalWidth - innerRadius, y: size.height - horizontalHeight - innerRadius)
    }
    
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
}

extension Elbow: CartesianPointConvertible {
    public var cartesianPoints: [CartesianPoint] {
        return [
            CartesianPoint(x: -(size.width / 2.0), y: -(size.height / 2.0)),
            CartesianPoint(x: (size.width / 2.0), y: (size.height / 2.0)),
        ]
    }
}

#if canImport(CoreGraphics)
extension Elbow: PathConvertible {
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()
        let size = self.size
        
        switch (top, left) {
        case (true, true): // Upper Left
            if rounded {
                path.addArc(center: upperLeftOuterCenter, radius: outerRadius, startDegree: 180.0, endDegree: 270.0, clockwise: false)
            } else {
                path.move(to: CartesianPoint.zero)
            }
            path.addLine(to: CartesianPoint(x: size.width, y: 0.0))
            path.addLine(to: CartesianPoint(x: size.width, y: horizontalHeight))
            if rounded {
                path.addLine(to: CartesianPoint(x: verticalWidth + innerRadius, y: horizontalHeight))
                path.addArc(center: upperLeftInnerCenter, radius: innerRadius, startDegree: 270.0, endDegree: 180.0, clockwise: true)
            } else {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: size.width, y: size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: size.width, y: size.height))
            } else {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: size.height))
            }
            path.addLine(to: CartesianPoint(x: 0.0, y: size.height))
            path.closeSubpath()
        case (false, true): // Lower Left
            if rounded {
                path.addArc(center: CartesianPoint(x: upperLeftOuterCenter.x, y: lowerRightOuterCenter.y), radius: outerRadius, startDegree: 180.0, endDegree: 90.0, clockwise: true)
            } else {
                path.move(to: CartesianPoint(x: 0, y: size.height))
            }
            path.addLine(to: CartesianPoint(x: size.width, y: size.height))
            path.addLine(to: CartesianPoint(x: size.width, y: size.height - horizontalHeight))
            if rounded {
                path.addLine(to: CartesianPoint(x: verticalWidth + innerRadius, y: size.height - horizontalHeight))
                path.addArc(center: CartesianPoint(x: upperLeftInnerCenter.x, y: lowerRightInnerCenter.y), radius: innerRadius, startDegree: 90.0, endDegree: 180.0, clockwise: false)
            } else {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: size.height - horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: closedHeight))
                path.addLine(to: CartesianPoint(x: size.width, y: closedHeight))
                path.addLine(to: CartesianPoint(x: size.width, y: 0.0))
            } else {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: 0.0))
            }
            path.addLine(to: CartesianPoint.zero)
            path.closeSubpath()
        case (true, false): // Upper Right
            if rounded {
                path.addArc(center: CartesianPoint(x: lowerRightOuterCenter.x, y: upperLeftOuterCenter.y), radius: outerRadius, startDegree: 0.0, endDegree: 270.0, clockwise: true)
            } else {
                path.move(to: CartesianPoint(x: size.width, y: 0))
            }
            path.addLine(to: CartesianPoint.zero)
            path.addLine(to: CartesianPoint(x: 0.0, y: horizontalHeight))
            if rounded {
                path.addLine(to: CartesianPoint(x: size.width - verticalWidth - innerRadius, y: horizontalHeight))
                path.addArc(center: CartesianPoint(x: lowerRightInnerCenter.x, y: upperLeftInnerCenter.y), radius: innerRadius, startDegree: 270.0, endDegree: 0.0, clockwise: false)
            } else {
                path.addLine(to: CartesianPoint(x: size.width - verticalWidth, y: horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: size.width - verticalWidth, y: size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: 0, y: size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: 0, y: size.height))
            } else {
                path.addLine(to: CartesianPoint(x: size.width - verticalWidth, y: size.height))
            }
            path.addLine(to: CartesianPoint(x: size.width, y: size.height))
            path.closeSubpath()
        case (false, false): // Lower Right
            if rounded {
                path.addArc(center: lowerRightOuterCenter, radius: outerRadius, startDegree: 0.0, endDegree: 90.0, clockwise: false)
            } else {
                path.move(to: CartesianPoint(x: size.width, y: size.height))
            }
            path.addLine(to: CartesianPoint(x: 0, y: size.height))
            path.addLine(to: CartesianPoint(x: 0, y: size.height - horizontalHeight))
            if rounded {
                path.addLine(to: CartesianPoint(x: size.width - verticalWidth - innerRadius, y: size.height - horizontalHeight))
                path.addArc(center: lowerRightInnerCenter, radius: innerRadius, startDegree: 90.0, endDegree: 0.0, clockwise: true)
            } else {
                path.addLine(to: CartesianPoint(x: size.width - verticalWidth, y: size.height - horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: size.width - verticalWidth, y: closedHeight))
                path.addLine(to: CartesianPoint(x: 0.0, y: closedHeight))
                path.addLine(to: CartesianPoint.zero)
            } else {
                path.addLine(to: CartesianPoint(x: size.width - verticalWidth, y: 0.0))
            }
            path.addLine(to: CartesianPoint(x: size.width, y: 0.0))
            path.closeSubpath()
        }
        
        return path
    }
}
#endif
