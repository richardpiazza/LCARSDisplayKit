#if (os(macOS) || os(iOS) || os(tvOS) || os(watchOS))

import CoreGraphics
import GraphPoint

/// A rectangle with optionally rounded ends
public struct RoundedRectangle: Graphable {
    public var size: CGSize = CGSize.zero
    public var leftRounded: Bool = false
    public var rightRounded: Bool = false
    public var cornersOnly: Bool = false
    
    public init() {}
    public init(size: CGSize, leftRounded: Bool, rightRounded: Bool, cornersOnly: Bool) {
        self.size = size
        self.leftRounded = leftRounded
        self.rightRounded = rightRounded
        self.cornersOnly = cornersOnly
    }
    
    /// Caluclates the radius of the arcs depending on `cornersOnly`
    var radius: CGFloat {
        return (cornersOnly) ? size.height * 0.25 : size.height * 0.5
    }
    
    var upperLeftCenter: CGPoint {
        return CGPoint(x: radius, y: radius)
    }
    
    var lowerRightCenter: CGPoint {
        return CGPoint(x: size.width - radius, y: size.height - radius)
    }
    
    // MARK: - Graphable
    public var path: CGMutablePath {
        let path = CGMutablePath()
        
        guard leftRounded == true || rightRounded == true else {
            path.addRect(CGRect(origin: CGPoint.zero, size: size))
            return path
        }
        
        if leftRounded && rightRounded {
            if cornersOnly {
                path.addArc(center: upperLeftCenter, radius: radius, startAngle: CGFloat(180).radians, endAngle: CGFloat(270).radians, clockwise: false)
                path.addLine(to: CGPoint(x: lowerRightCenter.x, y: 0))
                path.addArc(center: CGPoint(x: lowerRightCenter.x, y: upperLeftCenter.y), radius: radius, startAngle: CGFloat(270).radians, endAngle: CGFloat(0).radians, clockwise: false)
                path.addLine(to: CGPoint(x: size.width, y: lowerRightCenter.y))
                path.addArc(center: lowerRightCenter, radius: radius, startAngle: CGFloat(0).radians, endAngle: CGFloat(90).radians, clockwise: false)
                path.addLine(to: CGPoint(x: upperLeftCenter.x, y: size.height))
                path.addArc(center: CGPoint(x: upperLeftCenter.x, y:lowerRightCenter.y), radius: radius, startAngle: CGFloat(90).radians, endAngle: CGFloat(180).radians, clockwise: false)
                path.closeSubpath()
            } else {
                path.addArc(center: upperLeftCenter, radius: radius, startAngle: CGFloat(90).radians, endAngle: CGFloat(270).radians, clockwise: false)
                path.addLine(to: CGPoint(x: lowerRightCenter.x, y: 0))
                path.addArc(center: lowerRightCenter, radius: radius, startAngle: CGFloat(270).radians, endAngle: CGFloat(90).radians, clockwise: false)
                path.closeSubpath()
            }
        } else if leftRounded {
            if cornersOnly {
                path.addArc(center: upperLeftCenter, radius: radius, startAngle: CGFloat(180).radians, endAngle: CGFloat(270).radians, clockwise: false)
                path.addLine(to: CGPoint(x: size.width, y: 0))
                path.addLine(to: CGPoint(x: size.width, y: size.height))
                path.addLine(to: CGPoint(x: upperLeftCenter.x, y: size.height))
                path.addArc(center: CGPoint(x: upperLeftCenter.x, y: lowerRightCenter.y), radius: radius, startAngle: CGFloat(90).radians, endAngle: CGFloat(180).radians, clockwise: false)
                path.closeSubpath()
            } else {
                path.addArc(center: upperLeftCenter, radius: radius, startAngle: CGFloat(90).radians, endAngle: CGFloat(270).radians, clockwise: false)
                path.addLine(to: CGPoint(x: size.width, y: 0))
                path.addLine(to: CGPoint(x: size.width, y: size.height))
                path.closeSubpath()
            }
        } else if rightRounded {
            if cornersOnly {
                path.addArc(center: CGPoint(x: lowerRightCenter.x, y: upperLeftCenter.y), radius: radius, startAngle: CGFloat(270).radians, endAngle: CGFloat(0).radians, clockwise: false)
                path.addLine(to: CGPoint(x: size.width, y: lowerRightCenter.y))
                path.addArc(center: lowerRightCenter, radius: radius, startAngle: CGFloat(0).radians, endAngle: CGFloat(90).radians, clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: size.height))
                path.addLine(to: CGPoint.zero)
                path.closeSubpath()
            } else {
                path.addArc(center: lowerRightCenter, radius: radius, startAngle: CGFloat(270).radians, endAngle: CGFloat(90).radians, clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: size.height))
                path.addLine(to: CGPoint.zero)
                path.closeSubpath()
            }
        }
        
        return path
    }
}

#endif
