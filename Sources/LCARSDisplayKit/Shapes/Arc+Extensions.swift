import GraphPoint
import Swift2D

public extension Arc {
    init(radius: Radius, dPad: DPad) {
        self.init(radius: radius, startingDegree: Degree(dPad.start), endingDegree: Degree(dPad.end))
    }
}

extension Arc: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return [startingPoint, endingPoint]
    }
}

#if canImport(CoreGraphics)
import CoreGraphics

extension Arc: ExpressibleByPath {
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let pivot = frame.originModifiedBy(pivotPoint)
        
        path.addArc(center: center, radius: radius, startDegree: startingDegree, endDegree: endingDegree, clockwise: false)
        path.addLine(to: pivot)
        path.closeSubpath()
        
        return path
    }
    
    public var subpaths: [CGMutablePath]? {
        return nil
    }
}
#endif
