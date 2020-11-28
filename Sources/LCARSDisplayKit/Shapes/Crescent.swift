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
    
    public init(interiorArc: Arc = Arc(), exteriorArc: Arc = Arc(), extendExteriorStart: Bool = false, extendExteriorEnd: Bool = false) {
        self.interiorArc = interiorArc
        self.exteriorArc = exteriorArc
        self.extendExteriorStart = extendExteriorStart
        self.extendExteriorEnd = extendExteriorEnd
    }
}

public extension Crescent {
    var interiorRadius: Radius {
        return min(interiorArc.radius, exteriorArc.radius)
    }
    
    var exteriorRadius: Radius {
        return max(exteriorArc.radius, interiorArc.radius)
    }
    
    var startDegree: Degree {
        return min(interiorArc.startingDegree, exteriorArc.startingDegree)
    }
    
    var endDegree: Degree {
        return max(interiorArc.endingDegree, exteriorArc.endingDegree)
    }
    
    var interiorArcStartingPoint: CartesianPoint {
        return interiorArc.startingPoint
    }
    
    var interiorArcEndingPoint: CartesianPoint {
        return interiorArc.endingPoint
    }
    
    var exteriorArcStartingPoint: CartesianPoint {
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
    
    var exteriorArcEndingPoint: CartesianPoint {
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
}

extension Crescent: ExpressibleByCartesianPoints {
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
