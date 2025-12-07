#if canImport(CoreGraphics)
import CoreGraphics
import GraphPoint

extension Elbow: PathConvertible {
    private var outerRadius: Radius {
        max(bodyHeight, stemWidth) / 2
    }

    private var innerRadius: Radius {
        (interiorRounding != nil) ? outerRadius : (outerRadius / 2.4)
    }

    private var upperLeftOuterCenter: CartesianPoint {
        CartesianPoint(x: outerRadius, y: outerRadius)
    }

    private var upperLeftInnerCenter: CartesianPoint {
        CartesianPoint(x: stemWidth + innerRadius, y: bodyHeight + innerRadius)
    }

    private var lowerRightOuterCenter: CartesianPoint {
        CartesianPoint(x: size.width - outerRadius, y: size.height - outerRadius)
    }

    private var lowerRightInnerCenter: CartesianPoint {
        CartesianPoint(x: size.width - stemWidth - innerRadius, y: size.height - bodyHeight - innerRadius)
    }

    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()
        let size = size

        switch alignment {
        case .topLeft:
            if exteriorRounding != nil {
                path.addArc(center: upperLeftOuterCenter, radius: outerRadius, startDegree: 180.0, endDegree: 270.0, clockwise: false)
            } else {
                path.move(to: CartesianPoint.zero)
            }
            path.addLine(to: CartesianPoint(x: size.width, y: 0.0))
            path.addLine(to: CartesianPoint(x: size.width, y: bodyHeight))
            if exteriorRounding != nil {
                path.addLine(to: CartesianPoint(x: stemWidth + innerRadius, y: bodyHeight))
                path.addArc(center: upperLeftInnerCenter, radius: innerRadius, startDegree: 270.0, endDegree: 180.0, clockwise: true)
            } else {
                path.addLine(to: CartesianPoint(x: stemWidth, y: bodyHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: stemWidth, y: size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: size.width, y: size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: size.width, y: size.height))
            } else {
                path.addLine(to: CartesianPoint(x: stemWidth, y: size.height))
            }
            path.addLine(to: CartesianPoint(x: 0.0, y: size.height))
            path.closeSubpath()
        case .bottomLeft:
            if exteriorRounding != nil {
                path.addArc(center: CartesianPoint(x: upperLeftOuterCenter.x, y: lowerRightOuterCenter.y), radius: outerRadius, startDegree: 180.0, endDegree: 90.0, clockwise: true)
            } else {
                path.move(to: CartesianPoint(x: 0, y: size.height))
            }
            path.addLine(to: CartesianPoint(x: size.width, y: size.height))
            path.addLine(to: CartesianPoint(x: size.width, y: size.height - bodyHeight))
            if exteriorRounding != nil {
                path.addLine(to: CartesianPoint(x: stemWidth + innerRadius, y: size.height - bodyHeight))
                path.addArc(center: CartesianPoint(x: upperLeftInnerCenter.x, y: lowerRightInnerCenter.y), radius: innerRadius, startDegree: 90.0, endDegree: 180.0, clockwise: false)
            } else {
                path.addLine(to: CartesianPoint(x: stemWidth, y: size.height - bodyHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: stemWidth, y: closedHeight))
                path.addLine(to: CartesianPoint(x: size.width, y: closedHeight))
                path.addLine(to: CartesianPoint(x: size.width, y: 0.0))
            } else {
                path.addLine(to: CartesianPoint(x: stemWidth, y: 0.0))
            }
            path.addLine(to: CartesianPoint.zero)
            path.closeSubpath()
        case .topRight:
            if exteriorRounding != nil {
                path.addArc(center: CartesianPoint(x: lowerRightOuterCenter.x, y: upperLeftOuterCenter.y), radius: outerRadius, startDegree: 0.0, endDegree: 270.0, clockwise: true)
            } else {
                path.move(to: CartesianPoint(x: size.width, y: 0))
            }
            path.addLine(to: CartesianPoint.zero)
            path.addLine(to: CartesianPoint(x: 0.0, y: bodyHeight))
            if exteriorRounding != nil {
                path.addLine(to: CartesianPoint(x: size.width - stemWidth - innerRadius, y: bodyHeight))
                path.addArc(center: CartesianPoint(x: lowerRightInnerCenter.x, y: upperLeftInnerCenter.y), radius: innerRadius, startDegree: 270.0, endDegree: 0.0, clockwise: false)
            } else {
                path.addLine(to: CartesianPoint(x: size.width - stemWidth, y: bodyHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: size.width - stemWidth, y: size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: 0, y: size.height - closedHeight))
                path.addLine(to: CartesianPoint(x: 0, y: size.height))
            } else {
                path.addLine(to: CartesianPoint(x: size.width - stemWidth, y: size.height))
            }
            path.addLine(to: CartesianPoint(x: size.width, y: size.height))
            path.closeSubpath()
        case .bottomRight:
            if exteriorRounding != nil {
                path.addArc(center: lowerRightOuterCenter, radius: outerRadius, startDegree: 0.0, endDegree: 90.0, clockwise: false)
            } else {
                path.move(to: CartesianPoint(x: size.width, y: size.height))
            }
            path.addLine(to: CartesianPoint(x: 0, y: size.height))
            path.addLine(to: CartesianPoint(x: 0, y: size.height - bodyHeight))
            if exteriorRounding != nil {
                path.addLine(to: CartesianPoint(x: size.width - stemWidth - innerRadius, y: size.height - bodyHeight))
                path.addArc(center: lowerRightInnerCenter, radius: innerRadius, startDegree: 90.0, endDegree: 0.0, clockwise: true)
            } else {
                path.addLine(to: CartesianPoint(x: size.width - stemWidth, y: size.height - bodyHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CartesianPoint(x: size.width - stemWidth, y: closedHeight))
                path.addLine(to: CartesianPoint(x: 0.0, y: closedHeight))
                path.addLine(to: CartesianPoint.zero)
            } else {
                path.addLine(to: CartesianPoint(x: size.width - stemWidth, y: 0.0))
            }
            path.addLine(to: CartesianPoint(x: size.width, y: 0.0))
            path.closeSubpath()
        }

        return path
    }
}
#endif
