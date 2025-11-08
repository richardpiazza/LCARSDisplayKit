#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint

/// An interior `Arc` extended with straight lines to additional points
public struct EdgedCrescent {
    public var interiorArc: Arc
    public var edgePoints: [CartesianPoint]
    
    public init() {
        interiorArc = Arc()
        edgePoints = []
    }
    
    public init(interiorArc: Arc, edgePoints: [CartesianPoint] = []) {
        self.interiorArc = interiorArc
        self.edgePoints = edgePoints
    }
    
    public init(
        interiorRadius: Radius,
        exteriorRadius: Radius,
        startingDegree: Degree,
        endingDegree: Degree
    ) {
        let iArc = Arc(radius: interiorRadius, startingDegree: startingDegree, endingDegree: endingDegree)
        let eArc = Arc(radius: exteriorRadius, startingDegree: startingDegree, endingDegree: endingDegree)

        switch (startingDegree, endingDegree) {
        case (let s, let e) where s >= 270 && s < 360 && e >= 270 && e < 360:
            fallthrough
        case (let s, let e) where s >= 180 && s < 270 && e >= 180 && e < 270:
            fallthrough
        case (let s, let e) where s >= 90 && s < 180 && e >= 90 && e < 180:
            fallthrough
        case (let s, let e) where s >= 0 && s < 90 && e >= 0 && e < 180:
            fallthrough
        default:
            interiorArc = iArc
            edgePoints = []
        }
    }
}

extension EdgedCrescent: CartesianPointConvertible {
    public var cartesianPoints: [CartesianPoint] {
        let arcPoints = [interiorArc.startingPoint, interiorArc.endingPoint]
        return [arcPoints, edgePoints].flatMap { $0 }
    }
}

#if canImport(CoreGraphics)
extension EdgedCrescent: PathConvertible {
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        
        path.addArc(arc: interiorArc, center: center, clockwise: false)
        
        edgePoints.reversed().forEach { (point) in
            let translated = frame.relativePointForCartesianPoint(point)
            path.addLine(to: translated)
        }
        
        path.closeSubpath()
        
        return path
    }
}
#endif
