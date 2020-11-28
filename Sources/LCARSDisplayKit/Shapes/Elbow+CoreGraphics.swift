import GraphPoint
import Swift2D
#if canImport(CoreGraphics)
import CoreGraphics

extension Elbow: ExpressibleByPath {
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        switch (top, left) {
        case (true, true): // Upper Left
            if rounded {
                path.addArc(center: upperLeftOuterCenter, radius: outerRadius, startDegree: 180.0, endDegree: 270.0, clockwise: false)
            } else {
                path.move(to: CartesianPoint.zero)
            }
            path.addLine(to: CartesianPoint(x: _size.width, y: 0.0))
            path.addLine(to: CartesianPoint(x: _size.width, y: horizontalHeight))
            if rounded {
                path.addLine(to: CartesianPoint(x: verticalWidth + innerRadius, y: horizontalHeight))
                path.addArc(center: upperLeftInnerCenter, radius: innerRadius, startDegree: 270.0, endDegree: 180.0, clockwise: true)
            } else {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: _size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: _size.width, y: _size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: _size.width, y: _size.height))
            } else {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: _size.height))
            }
            path.addLine(to: CartesianPoint(x: 0.0, y: _size.height))
            path.closeSubpath()
        case (false, true): // Lower Left
            if rounded {
                path.addArc(center: CartesianPoint(x: upperLeftOuterCenter.x, y: lowerRightOuterCenter.y), radius: outerRadius, startDegree: 180.0, endDegree: 90.0, clockwise: true)
            } else {
                path.move(to: CartesianPoint(x: 0, y: _size.height))
            }
            path.addLine(to: CartesianPoint(x: _size.width, y: _size.height))
            path.addLine(to: CartesianPoint(x: _size.width, y: _size.height - horizontalHeight))
            if rounded {
                path.addLine(to: CartesianPoint(x: verticalWidth + innerRadius, y: _size.height - horizontalHeight))
                path.addArc(center: CartesianPoint(x: upperLeftInnerCenter.x, y: lowerRightInnerCenter.y), radius: innerRadius, startDegree: 90.0, endDegree: 180.0, clockwise: false)
            } else {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: _size.height - horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: closedHeight))
                path.addLine(to: CartesianPoint(x: _size.width, y: closedHeight))
                path.addLine(to: CartesianPoint(x: _size.width, y: 0.0))
            } else {
                path.addLine(to: CartesianPoint(x: verticalWidth, y: 0.0))
            }
            path.addLine(to: CartesianPoint.zero)
            path.closeSubpath()
        case (true, false): // Upper Right
            if rounded {
                path.addArc(center: CartesianPoint(x: lowerRightOuterCenter.x, y: upperLeftOuterCenter.y), radius: outerRadius, startDegree: 0.0, endDegree: 270.0, clockwise: true)
            } else {
                path.move(to: CartesianPoint(x: _size.width, y: 0))
            }
            path.addLine(to: CartesianPoint.zero)
            path.addLine(to: CartesianPoint(x: 0.0, y: horizontalHeight))
            if rounded {
                path.addLine(to: CartesianPoint(x: _size.width - verticalWidth - innerRadius, y: horizontalHeight))
                path.addArc(center: CartesianPoint(x: lowerRightInnerCenter.x, y: upperLeftInnerCenter.y), radius: innerRadius, startDegree: 270.0, endDegree: 0.0, clockwise: false)
            } else {
                path.addLine(to: CartesianPoint(x: _size.width - verticalWidth, y: horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: _size.width - verticalWidth, y: _size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: 0, y: _size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: 0, y: _size.height))
            } else {
                path.addLine(to: CartesianPoint(x: _size.width - verticalWidth, y: _size.height))
            }
            path.addLine(to: CartesianPoint(x: _size.width, y: _size.height))
            path.closeSubpath()
        case (false, false): // Lower Right
            if rounded {
                path.addArc(center: lowerRightOuterCenter, radius: outerRadius, startDegree: 0.0, endDegree: 90.0, clockwise: false)
            } else {
                path.move(to: CartesianPoint(x: _size.width, y: _size.height))
            }
            path.addLine(to: CartesianPoint(x: 0, y: _size.height))
            path.addLine(to: CartesianPoint(x: 0, y: _size.height - horizontalHeight))
            if rounded {
                path.addLine(to: CartesianPoint(x: _size.width - verticalWidth - innerRadius, y: _size.height - horizontalHeight))
                path.addArc(center: lowerRightInnerCenter, radius: innerRadius, startDegree: 90.0, endDegree: 0.0, clockwise: true)
            } else {
                path.addLine(to: CartesianPoint(x: _size.width - verticalWidth, y: _size.height - horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: _size.width - verticalWidth, y: closedHeight))
                path.addLine(to: CartesianPoint(x: 0.0, y: closedHeight))
                path.addLine(to: CartesianPoint.zero)
            } else {
                path.addLine(to: CartesianPoint(x: _size.width - verticalWidth, y: 0.0))
            }
            path.addLine(to: CartesianPoint(x: _size.width, y: 0.0))
            path.closeSubpath()
        }
        
        return path
    }
    
    public var subpaths: [CGMutablePath]? {
        return nil
    }
}
#endif
