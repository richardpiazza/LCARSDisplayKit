import GraphPoint

/// Two `Arc`s connected by straight lines at their end points.
public struct Crescent {
    public var innerArc: Arc
    public var outerArc: Arc
    
    public init(innerArc: Arc = Arc(), outerArc: Arc = Arc(), boundedStart: Bool = false, boundedEnd: Bool = false) {
        self.innerArc = innerArc
        self.outerArc = outerArc
        if boundedStart {
            self.outerArc.startLimiter = self.innerArc.startingPoint
        }
        if boundedEnd {
            self.outerArc.endLimiter = self.innerArc.endingPoint
        }
    }
    
    var boundStart: Bool = false {
        didSet {
            if boundStart {
                outerArc.startLimiter = innerArc.startingPoint
            } else {
                outerArc.startLimiter = nil
            }
        }
    }
    
    var boundEnd: Bool = false {
        didSet {
            if boundEnd {
                outerArc.endLimiter = innerArc.endingPoint
            } else {
                outerArc.endLimiter = nil
            }
        }
    }
}

public extension Crescent {
    var innerRadius: Radius {
        return min(innerArc.radius, outerArc.radius)
    }
    
    var outerRadius: Radius {
        return max(outerArc.radius, innerArc.radius)
    }
    
    var startDegree: Degree {
        return min(innerArc.startDegree, outerArc.startDegree)
    }
    
    var endDegree: Degree {
        return max(innerArc.endDegree, outerArc.endDegree)
    }
}

extension Crescent: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return [innerArc.cartesianPoints, outerArc.cartesianPoints].flatMap { $0 }
    }
}
