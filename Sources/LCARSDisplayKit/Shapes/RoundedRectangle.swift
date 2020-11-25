import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics
#endif

/// A rectangle with optionally rounded ends
public struct RoundedRectangle {
    public var size: CGSize
    public var leftRounded: Bool
    public var rightRounded: Bool
    public var cornersOnly: Bool
    
    public init(size: CGSize = .zero, leftRounded: Bool = false, rightRounded: Bool = false, cornersOnly: Bool = false) {
        self.size = size
        self.leftRounded = leftRounded
        self.rightRounded = rightRounded
        self.cornersOnly = cornersOnly
    }
    
    /// Calculates the radius of the arcs depending on `cornersOnly`
    var radius: CGFloat {
        return (cornersOnly) ? size.height * 0.25 : size.height * 0.5
    }
    
    var upperLeftCenter: CGPoint {
        return CGPoint(x: radius, y: radius)
    }
    
    var lowerRightCenter: CGPoint {
        return CGPoint(x: size.width - radius, y: size.height - radius)
    }
}

extension RoundedRectangle: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return []
    }
}

#if canImport(CoreGraphics)
extension RoundedRectangle: ExpressibleByPath {
    public var path: CGMutablePath {
        let path = CGMutablePath()
        
        switch (leftRounded, rightRounded, cornersOnly) {
        case (true, true, true):
            path.addArc(center: CartesianPoint(upperLeftCenter), radius: Radius(radius), startAngle: 180.0, endAngle: 270.0, clockwise: false)
            path.addLine(to: CGPoint(x: lowerRightCenter.x, y: 0))
            path.addArc(center: CartesianPoint(x: Float(lowerRightCenter.x), y: Float(upperLeftCenter.y)), radius: Radius(radius), startAngle: 270.0, endAngle: 0.0, clockwise: false)
            path.addLine(to: CGPoint(x: size.width, y: lowerRightCenter.y))
            path.addArc(center: CartesianPoint(lowerRightCenter), radius: Radius(radius), startAngle: 0.0, endAngle: 90.0, clockwise: false)
            path.addLine(to: CGPoint(x: upperLeftCenter.x, y: size.height))
            path.addArc(center: CartesianPoint(x: Float(upperLeftCenter.x), y: Float(lowerRightCenter.y)), radius: Radius(radius), startAngle: 90.0, endAngle: 180.0, clockwise: false)
            path.closeSubpath()
        case (true, true, false):
            path.addArc(center: CartesianPoint(upperLeftCenter), radius: Radius(radius), startAngle: 90.0, endAngle: 270.0, clockwise: false)
            path.addLine(to: CGPoint(x: lowerRightCenter.x, y: 0))
            path.addArc(center: CartesianPoint(lowerRightCenter), radius: Radius(radius), startAngle: 270.0, endAngle: 90.0, clockwise: false)
            path.closeSubpath()
        case (true, false, true):
            path.addArc(center: CartesianPoint(upperLeftCenter), radius: Radius(radius), startAngle: 180.0, endAngle: 270.0, clockwise: false)
            path.addLine(to: CGPoint(x: size.width, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.addLine(to: CGPoint(x: upperLeftCenter.x, y: size.height))
            path.addArc(center: CartesianPoint(x: Float(upperLeftCenter.x), y: Float(lowerRightCenter.y)), radius: Radius(radius), startAngle: 90.0, endAngle: 170.0, clockwise: false)
            path.closeSubpath()
        case (true, false, false):
            path.addArc(center: CartesianPoint(upperLeftCenter), radius: Radius(radius), startAngle: 90.0, endAngle: 270.0, clockwise: false)
            path.addLine(to: CGPoint(x: size.width, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.closeSubpath()
        case (false, true, true):
            path.addArc(center: CartesianPoint(x: Float(lowerRightCenter.x), y: Float(upperLeftCenter.y)), radius: Radius(radius), startAngle: 270.0, endAngle: 0.0, clockwise: false)
            path.addLine(to: CGPoint(x: size.width, y: lowerRightCenter.y))
            path.addArc(center: CartesianPoint(lowerRightCenter), radius: Radius(radius), startAngle: 0.0, endAngle: 90.0, clockwise: false)
            path.addLine(to: CGPoint(x: 0, y: size.height))
            path.addLine(to: CGPoint.zero)
            path.closeSubpath()
        case (false, true, false):
            path.addArc(center: CartesianPoint(lowerRightCenter), radius: Radius(radius), startAngle: 270.0, endAngle: 90.0, clockwise: false)
            path.addLine(to: CGPoint(x: 0, y: size.height))
            path.addLine(to: CGPoint.zero)
            path.closeSubpath()
        default:
            path.addRect(CGRect(origin: CGPoint.zero, size: size))
        }
        
        return path
    }
    
    public var subpaths: [CGMutablePath]? {
        return nil
    }
}

extension RoundedRectangle: Graphable {
}

#endif
