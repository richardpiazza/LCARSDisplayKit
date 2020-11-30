import GraphPoint
import Swift2D

/// A `Arc` that uses it's `pivotPoint` to draw a wedge.
public struct Wedge {
    
    public var exteriorArc: Arc
    
    public init() {
        exteriorArc = Arc()
    }
    
    public init(exteriorArc: Arc) {
        self.exteriorArc = exteriorArc
    }
}

extension Wedge: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return [exteriorArc.startingPoint, exteriorArc.endingPoint]
    }
}
