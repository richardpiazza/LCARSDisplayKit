import GraphPoint

/// Two `Arc`s connected by straight lines at their end points.
public struct Crescent {
    /// Arc with radius closest to the cartesian origin.
    public var interiorArc: Arc = Arc()
    /// Arc with radius farthest from the cartesian origin.
    public var exteriorArc: Arc = Arc()
    /// Uses the interior starting point to extend the exterior starting point, creating a straight line.
    public var extendExteriorStart: Bool = false
    /// Uses the interior ending point to extend the exterior ending point, creating a straight line.
    public var extendExteriorEnd: Bool = false
    
    @available(*, deprecated, renamed: "interiorArc")
    public var innerArc: ModifiedArc
    @available(*, deprecated, renamed: "exteriorArc")
    public var outerArc: ModifiedArc
    
    public init(interiorArc: Arc, exteriorArc: Arc, extendExteriorStart: Bool = false, extendExteriorEnd: Bool = false) {
        self.interiorArc = interiorArc
        self.exteriorArc = exteriorArc
        self.extendExteriorStart = extendExteriorStart
        self.extendExteriorEnd = extendExteriorEnd
        
        self.innerArc = ModifiedArc(radius: interiorArc.radius, startDegree: interiorArc.startingDegree, endDegree: interiorArc.endingDegree)
        self.outerArc = ModifiedArc(radius: exteriorArc.radius, startDegree: exteriorArc.startingDegree, endDegree: exteriorArc.endingDegree)
        self.boundStart = extendExteriorStart
        self.boundEnd = extendExteriorEnd
    }
    
    @available(*, deprecated, renamed: "init(interiorArc:exteriorArc:extendExteriorStart:extendExteriorEnd:)")
    public init(innerArc: ModifiedArc = ModifiedArc(), outerArc: ModifiedArc = ModifiedArc(), boundedStart: Bool = false, boundedEnd: Bool = false) {
        self.interiorArc = Arc(radius: innerArc.radius, startingDegree: innerArc.startDegree, endingDegree: innerArc.endDegree)
        self.exteriorArc = Arc(radius: outerArc.radius, startingDegree: outerArc.startDegree, endingDegree: outerArc.endDegree)
        self.innerArc = innerArc
        self.outerArc = outerArc
        self.extendExteriorStart = boundedStart
        self.extendExteriorEnd = boundedEnd
        if boundedStart {
            self.outerArc.startLimiter = self.innerArc.startingPoint
        }
        if boundedEnd {
            self.outerArc.endLimiter = self.innerArc.endingPoint
        }
    }
    
    @available(*, deprecated, renamed: "extendExteriorStart")
    var boundStart: Bool = false {
        didSet {
            extendExteriorStart = boundStart
            if boundStart {
                outerArc.startLimiter = innerArc.startingPoint
            } else {
                outerArc.startLimiter = nil
            }
        }
    }
    
    @available(*, deprecated, renamed: "extendExteriorEnd")
    var boundEnd: Bool = false {
        didSet {
            extendExteriorEnd = boundEnd
            if boundEnd {
                outerArc.endLimiter = innerArc.endingPoint
            } else {
                outerArc.endLimiter = nil
            }
        }
    }
}

public extension Crescent {
    @available(*, deprecated, renamed: "interiorRadius")
    var innerRadius: Radius {
        return interiorRadius
    }
    
    @available(*, deprecated, renamed: "exteriorRadius")
    var outerRadius: Radius {
        return exteriorRadius
    }
    
    var interiorRadius: Radius {
        return min(innerArc.radius, outerArc.radius)
    }
    
    var exteriorRadius: Radius {
        return max(outerArc.radius, innerArc.radius)
    }
    
    var startDegree: Degree {
        return min(innerArc.startDegree, outerArc.startDegree)
    }
    
    var endDegree: Degree {
        return max(innerArc.endDegree, outerArc.endDegree)
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
//        return [innerArc.cartesianPoints, outerArc.cartesianPoints].flatMap { $0 }
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
