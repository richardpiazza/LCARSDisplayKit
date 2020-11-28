import GraphPoint

/// An interior `Arc` extended with straight lines to additional points
public struct EdgedCrescent {
    public var interiorArc: Arc
    public var edgePoints: [CartesianPoint]
    
    public init(interiorArc: Arc = Arc(), edgePoints: [CartesianPoint] = []) {
        self.interiorArc = interiorArc
        self.edgePoints = edgePoints
    }
}

extension EdgedCrescent: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return [interiorArc.cartesianPoints, edgePoints].flatMap { $0 }
    }
}
