import GraphPoint

/// An interior `Arc` extended with straight lines to additional points
public struct EdgedCrescent {
    public var arc: ModifiedArc
    public var edgePoints: [CartesianPoint]
    
    public init(arc: ModifiedArc = ModifiedArc(), edgePoints: [CartesianPoint] = []) {
        self.arc = arc
        self.edgePoints = edgePoints
    }
}

extension EdgedCrescent: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return [arc.cartesianPoints, edgePoints].flatMap { $0 }
    }
}
