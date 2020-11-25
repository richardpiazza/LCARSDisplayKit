import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics

public struct Elbow: Graphable {
    public var size: CGSize = CGSize.zero
    public var top: Bool = true
    public var left: Bool = true
    /// Specifies if the corner specified by `top` and `left` should be rounded.
    public var rounded: Bool = true
    public var horizontalHeight: CGFloat = CGFloat(120)
    public var verticalWidth: CGFloat = CGFloat(30)
    /// If closedHeight > 0, an additional area is drawn parallel to the horizontalHeight area.
    public var closedHeight: CGFloat = CGFloat(0)
    /// If true, the interior radius will match the exterior radius.
    public var shouldMatchRadius: Bool = false
    
    public init() {
    }
    
    // - MARK: Graphable
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let outerRadius = fmax(horizontalHeight, verticalWidth) / 2
        let innerRadius = shouldMatchRadius ? outerRadius : (outerRadius / 2.4)
        let upperLeftOuterCenter = CGPoint(x: outerRadius, y: outerRadius)
        let upperLeftInnerCenter = CGPoint(x: verticalWidth + innerRadius, y: horizontalHeight + innerRadius)
        let lowerRightOuterCenter = CGPoint(x: size.width - outerRadius, y: size.height - outerRadius)
        let lowerRightInnerCenter = CGPoint(x: size.width - verticalWidth - innerRadius, y: size.height - horizontalHeight - innerRadius)
        
        if top && left {
            // Upper Left
            if rounded {
                path.addArc(center: upperLeftOuterCenter, radius: outerRadius, startAngle: CGFloat(180).radians, endAngle: CGFloat(270).radians, clockwise: false)
            } else {
                path.move(to: CGPoint.zero)
            }
            path.addLine(to: CGPoint(x: size.width, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: horizontalHeight))
            if rounded {
                path.addLine(to: CGPoint(x: verticalWidth + innerRadius, y: horizontalHeight))
                path.addArc(center: upperLeftInnerCenter, radius: innerRadius, startAngle: CGFloat(270).radians, endAngle: CGFloat(180).radians, clockwise: true)
            } else {
                path.addLine(to: CGPoint(x: verticalWidth, y: horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CGPoint(x: verticalWidth, y: size.height - closedHeight))
                path.addLine(to: CGPoint(x: size.width, y: size.height - closedHeight))
                path.addLine(to: CGPoint(x: size.width, y: size.height))
            } else {
                path.addLine(to: CGPoint(x: verticalWidth, y: size.height))
            }
            path.addLine(to: CGPoint(x: 0, y: size.height))
            path.closeSubpath()
        } else if !top && left {
            // Lower Left
            if rounded {
                path.addArc(center: CGPoint(x: upperLeftOuterCenter.x, y: lowerRightOuterCenter.y), radius: outerRadius, startAngle: CGFloat(180).radians, endAngle: CGFloat(90).radians, clockwise: true)
            } else {
                path.move(to: CGPoint(x: 0, y: size.height))
            }
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.addLine(to: CGPoint(x: size.width, y: size.height - horizontalHeight))
            if rounded {
                path.addLine(to: CGPoint(x: verticalWidth + innerRadius, y: size.height - horizontalHeight))
                path.addArc(center: CGPoint(x: upperLeftInnerCenter.x, y: lowerRightInnerCenter.y), radius: innerRadius, startAngle: CGFloat(90).radians, endAngle: CGFloat(180).radians, clockwise: false)
            } else {
                path.addLine(to: CGPoint(x: verticalWidth, y: size.height - horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CGPoint(x: verticalWidth, y: closedHeight))
                path.addLine(to: CGPoint(x: size.width, y: closedHeight))
                path.addLine(to: CGPoint(x: size.width, y: 0))
            } else {
                path.addLine(to: CGPoint(x: verticalWidth, y: 0))
            }
            path.addLine(to: CGPoint.zero)
            path.closeSubpath()
        } else if top && !left {
            // Upper Right
            if rounded {
                path.addArc(center: CGPoint(x: lowerRightOuterCenter.x, y: upperLeftOuterCenter.y), radius: outerRadius, startAngle: CGFloat(0).radians, endAngle: CGFloat(270).radians, clockwise: true)
            } else {
                path.move(to: CGPoint(x: size.width, y: 0))
            }
            path.addLine(to: CGPoint.zero)
            path.addLine(to: CGPoint(x: 0, y: horizontalHeight))
            if rounded {
                path.addLine(to: CGPoint(x: size.width - verticalWidth - innerRadius, y: horizontalHeight))
                path.addArc(center: CGPoint(x: lowerRightInnerCenter.x, y: upperLeftInnerCenter.y), radius: innerRadius, startAngle: CGFloat(270).radians, endAngle: CGFloat(0).radians, clockwise: false)
            } else {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: size.height - closedHeight))
                path.addLine(to: CGPoint(x: 0, y: size.height - closedHeight))
                path.addLine(to: CGPoint(x: 0, y: size.height))
            } else {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: size.height))
            }
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.closeSubpath()
        } else if !top && !left {
            // Lower Right
            if rounded {
                path.addArc(center: lowerRightOuterCenter, radius: outerRadius, startAngle: CGFloat(0).radians, endAngle: CGFloat(90).radians, clockwise: false)
            } else {
                path.move(to: CGPoint(x: size.width, y: size.height))
            }
            path.addLine(to: CGPoint(x: 0, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height - horizontalHeight))
            if rounded {
                path.addLine(to: CGPoint(x: size.width - verticalWidth - innerRadius, y: size.height - horizontalHeight))
                path.addArc(center: lowerRightInnerCenter, radius: innerRadius, startAngle: CGFloat(90).radians, endAngle: CGFloat(0).radians, clockwise: true)
            } else {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: size.height - horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: closedHeight))
                path.addLine(to: CGPoint(x: 0, y: closedHeight))
                path.addLine(to: CGPoint.zero)
            } else {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: 0))
            }
            path.addLine(to: CGPoint(x: size.width, y: 0))
            path.closeSubpath()
        }
        
        return path
    }
}

#endif