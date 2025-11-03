#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint

/// Two `Arc`s connected by straight lines at their end points.
public struct Crescent {
    /// Arc with radius closest to the cartesian origin.
    public var interiorArc: Arc
    /// Arc with radius farthest from the cartesian origin.
    public var exteriorArc: Arc
    /// Uses the interior starting point to extend the exterior starting point, creating a straight line.
    public var extendExteriorStart: Bool
    /// Uses the interior ending point to extend the exterior ending point, creating a straight line.
    public var extendExteriorEnd: Bool
    
    public var interiorRadius: Radius {
        min(interiorArc.radius, exteriorArc.radius)
    }
    
    public var exteriorRadius: Radius {
        max(exteriorArc.radius, interiorArc.radius)
    }
    
    public var startDegree: Degree {
        min(interiorArc.startingDegree, exteriorArc.startingDegree)
    }
    
    public var endDegree: Degree {
        max(interiorArc.endingDegree, exteriorArc.endingDegree)
    }
    
    public var interiorArcStartingPoint: CartesianPoint {
        interiorArc.startingPoint
    }
    
    public var interiorArcEndingPoint: CartesianPoint {
        interiorArc.endingPoint
    }
    
    public var exteriorArcStartingPoint: CartesianPoint {
        do {
            switch extendExteriorStart {
            case true:
                return try CartesianPoint.make(for: exteriorRadius, degree: startDegree, modifier: interiorArc.startingPoint)
            case false:
                return exteriorArc.startingPoint
            }
        } catch {
            return .zero
        }
    }
    
    public var exteriorArcEndingPoint: CartesianPoint {
        do {
            switch extendExteriorEnd {
            case true:
                return try CartesianPoint.make(for: exteriorRadius, degree: endDegree, modifier: interiorArc.endingPoint)
            case false:
                return exteriorArc.endingPoint
            }
        } catch {
            return .zero
        }
    }
    
    public init() {
        interiorArc = Arc()
        exteriorArc = Arc()
        extendExteriorStart = false
        extendExteriorEnd = false
    }
    
    public init(interiorArc: Arc, exteriorArc: Arc, extendExteriorStart: Bool = false, extendExteriorEnd: Bool = false) {
        self.interiorArc = interiorArc
        self.exteriorArc = exteriorArc
        self.extendExteriorStart = extendExteriorStart
        self.extendExteriorEnd = extendExteriorEnd
    }
}

extension Crescent: CartesianPointConvertible {
    public var cartesianPoints: [CartesianPoint] {
        return [
            interiorArcStartingPoint, interiorArcEndingPoint,
            exteriorArcStartingPoint, exteriorArcEndingPoint
        ]
    }
    
    public var cartesianFrame: CartesianFrame {
        do {
            return try .make(for: exteriorArc, points: cartesianPoints)
        } catch {
            return .zero
        }
    }
}

#if canImport(CoreGraphics)
extension Crescent: PathConvertible {
    public var path: CGPath {
        let path = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let translated = frame.relativePointForCartesianPoint(exteriorArcEndingPoint)
        
        path.addArc(arc: interiorArc, center: center, clockwise: false)
        path.addLine(to: translated)
        path.addArc(arc: exteriorArc.reversed, center: center, clockwise: true)
        path.closeSubpath()
        
        return path
    }
}
#endif
