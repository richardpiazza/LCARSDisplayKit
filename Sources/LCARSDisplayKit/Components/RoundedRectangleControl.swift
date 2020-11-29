import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

@IBDesignable open class RoundedRectangleControl: InteractiveControl<RoundedRectangle> {

    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 144, height: 60)
    }
    
    @IBInspectable open var roundLeft: Bool {
        get { shape?.leftRounded ?? true }
        set { shape?.leftRounded = newValue }
    }
    
    @IBInspectable open var roundRight: Bool {
        get { shape?.rightRounded ?? true }
        set { shape?.rightRounded = newValue }
    }
    
    @IBInspectable open var isFrame: Bool {
        get { shape?.cornersOnly ?? false }
        set { shape?.cornersOnly = newValue }
    }
}

extension RoundedRectangle: ExpressibleByPath {
    public var path: CGMutablePath {
        let path = CGMutablePath()
        
        switch (leftRounded, rightRounded, cornersOnly) {
        case (true, true, true):
            path.addArc(center: upperLeftCenter, radius: Radius(radius), startDegree: 180.0, endDegree: 270.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: lowerRightCenter.x, y: 0.0))
            path.addArc(center: CartesianPoint(x: lowerRightCenter.x, y: upperLeftCenter.y), radius: radius, startDegree: 270.0, endDegree: 0.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: _size.width, y: lowerRightCenter.y))
            path.addArc(center: lowerRightCenter, radius: radius, startDegree: 0.0, endDegree: 90.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: upperLeftCenter.x, y: _size.height))
            path.addArc(center: CartesianPoint(x: upperLeftCenter.x, y: lowerRightCenter.y), radius: radius, startDegree: 90.0, endDegree: 180.0, clockwise: false)
            path.closeSubpath()
        case (true, true, false):
            path.addArc(center: upperLeftCenter, radius: radius, startDegree: 90.0, endDegree: 270.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: lowerRightCenter.x, y: 0))
            path.addArc(center: lowerRightCenter, radius: radius, startDegree: 270.0, endDegree: 90.0, clockwise: false)
            path.closeSubpath()
        case (true, false, true):
            path.addArc(center: upperLeftCenter, radius: radius, startDegree: 180.0, endDegree: 270.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: _size.width, y: 0))
            path.addLine(to: CartesianPoint(x: _size.width, y: _size.height))
            path.addLine(to: CartesianPoint(x: upperLeftCenter.x, y: _size.height))
            path.addArc(center: CartesianPoint(x: upperLeftCenter.x, y: lowerRightCenter.y), radius: radius, startDegree: 90.0, endDegree: 170.0, clockwise: false)
            path.closeSubpath()
        case (true, false, false):
            path.addArc(center: upperLeftCenter, radius: radius, startDegree: 90.0, endDegree: 270.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: _size.width, y: 0))
            path.addLine(to: CartesianPoint(x: _size.width, y: _size.height))
            path.closeSubpath()
        case (false, true, true):
            path.addArc(center: CartesianPoint(x: lowerRightCenter.x, y: upperLeftCenter.y), radius: radius, startDegree: 270.0, endDegree: 0.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: _size.width, y: lowerRightCenter.y))
            path.addArc(center: lowerRightCenter, radius: radius, startDegree: 0.0, endDegree: 90.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: 0.0, y: _size.height))
            path.addLine(to: CartesianPoint.zero)
            path.closeSubpath()
        case (false, true, false):
            path.addArc(center: lowerRightCenter, radius: radius, startDegree: 270.0, endDegree: 90.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: 0.0, y: _size.height))
            path.addLine(to: CartesianPoint.zero)
            path.closeSubpath()
        default:
            path.addRect(CartesianFrame(origin: .zero, size: _size))
        }
        
        return path
    }
}
#endif
