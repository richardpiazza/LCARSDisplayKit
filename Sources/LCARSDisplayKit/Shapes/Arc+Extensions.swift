import GraphPoint
import Swift2D

public extension Arc {
    init() {
        self.init(radius: 0.0, startingDegree: 0.0, endingDegree: 0.0)
    }
    
    init(radius: Radius, dPad: DPad) {
        self.init(radius: radius, startingDegree: Degree(dPad.start), endingDegree: Degree(dPad.end))
    }
    
    var cartesianPoints: [CartesianPoint] {
        return [startingPoint, endingPoint]
    }
}

extension Arc: ExpressibleByCartesianPoints {
    
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

@available(*, deprecated)
extension Arc: Graphable {
    public var size: CGSize {
        get { .zero }
        set { }
    }
    
}
#endif
