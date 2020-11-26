import GraphPoint

/// Arc of a circle (a continuous length around the circumference)
public struct Arc {
    public var radius: Radius
    public var startDegree: Degree
    public var endDegree: Degree
    
    public var startLimiter: CartesianPoint?
    public var endLimiter: CartesianPoint?
    
    public init(radius: Radius = 0.0, startDegree: Degree = 0.0, endDegree: Degree = 0.0) {
        self.radius = radius
        self.startDegree = startDegree
        self.endDegree = endDegree
    }
    
    public init(radius: Radius, dPad: DPad) {
        self.radius = radius
        self.startDegree = Degree(dPad.start)
        self.endDegree = Degree(dPad.end)
    }
}

public extension Arc {
    var startingPoint: CartesianPoint {
        if let modifier = startLimiter {
            return (try? CartesianPoint.make(for: radius, degree: startDegree, modifier: modifier)) ?? .zero
        }
        
        return (try? CartesianPoint.make(for: radius, degree: startDegree)) ?? .zero
    }
    
    var endingPoint: CartesianPoint {
        if let modifier = endLimiter {
            return (try? CartesianPoint.make(for: radius, degree: endDegree, modifier: modifier)) ?? .zero
        }
        
        return (try? CartesianPoint.make(for: radius, degree: endDegree)) ?? .zero
    }
    
    var pivotPoint: CartesianPoint {
        let start = self.startingPoint
        let end = self.endingPoint
        var pivot = CartesianPoint()
        
        if startDegree < 90 {
            pivot.x = end.x
            pivot.y = start.y
        } else if startDegree < 180 {
            pivot.x = start.x
            pivot.y = end.y
        } else if startDegree < 270 {
            pivot.x = end.x
            pivot.y = start.y
        } else {
            pivot.x = start.x
            pivot.y = end.y
        }
        
        return pivot
    }
}

extension Arc: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        [startingPoint, endingPoint]
    }
}
