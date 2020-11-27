import GraphPoint

/// An interior `Arc` extended with straight lines to additional points
public struct EdgedCrescent {
    public var interiorArc: Arc
    public var edgePoints: [CartesianPoint]
    
    @available(*, deprecated, renamed: "interiorArc")
    public var arc: ModifiedArc {
        get { ModifiedArc(radius: interiorArc.radius, startDegree: interiorArc.startingDegree, endDegree: interiorArc.endingDegree) }
        set { interiorArc = .init(radius: newValue.radius, startingDegree: newValue.startDegree, endingDegree: newValue.endDegree) }
    }
    
    public init(interiorArc: Arc = Arc(), edgePoints: [CartesianPoint] = []) {
        self.interiorArc = interiorArc
        self.edgePoints = edgePoints
    }
    
    @available(*, deprecated, renamed: "init(interiorArc:edgePoints:)")
    public init(arc: ModifiedArc, edgePoints: [CartesianPoint] = []) {
        self.interiorArc = .init(radius: arc.radius, startingDegree: arc.startDegree, endingDegree: arc.endDegree)
        self.edgePoints = edgePoints
    }
}

extension EdgedCrescent: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return [arc.cartesianPoints, edgePoints].flatMap { $0 }
    }
}
