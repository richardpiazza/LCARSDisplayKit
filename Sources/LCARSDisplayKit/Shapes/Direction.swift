import GraphPoint
import Swift2D

public struct Direction {
    
    public enum Cardinal: Degree {
        case right = 0.0
        case down = 90.0
        case left = 180.0
        case up = 270.0
    }
    
    public var cardinal: Cardinal
    public var interiorRadius: Radius
    public var exteriorArc: Arc
    
    @available(*, deprecated, renamed: "exteriorArc")
    public var arc: ModifiedArc {
        get { ModifiedArc(radius: exteriorArc.radius, startDegree: exteriorArc.startingDegree, endDegree: exteriorArc.endingDegree) }
        set { exteriorArc = .init(radius: newValue.radius, startingDegree: newValue.startDegree, endingDegree: newValue.endDegree) }
    }
    
    @available(*, deprecated, renamed: "interiorRadius")
    public var innerRadius: Radius {
        get {  interiorRadius }
        set { interiorRadius = newValue }
    }
    
    public init(_ cardinal: Cardinal = .right, interiorRadius: Radius = 0, exteriorArc: Arc = Arc()) {
        self.cardinal = cardinal
        self.interiorRadius = interiorRadius
        self.exteriorArc = exteriorArc
    }
    
    @available(*, deprecated, renamed: "init(_:interiorRadius:exteriorArc:)")
    public init(_ cardinal: Cardinal = .right, arc: ModifiedArc = ModifiedArc(), innerRadius: Radius) {
        self.cardinal = cardinal
        self.interiorRadius = innerRadius
        self.exteriorArc = Arc(radius: arc.radius, startingDegree: arc.startDegree, endingDegree: arc.endDegree)
    }
    
    public var _size: Size {
        let frame = cartesianFrame
        let width: Float
        let height: Float
        
        switch cardinal {
        case .right:
            width = (frame.x - interiorRadius) + frame.width
            height = max(frame.width, frame.height)
        case .down:
            width = max(frame.width, frame.height)
            height = (abs(frame.y) - interiorRadius) + frame.height
        case .left:
            width = (abs(frame.x) - interiorRadius) + frame.width
            height = max(frame.width, frame.height)
        case .up:
            width = max(frame.width, frame.height)
            height = (frame.y - interiorRadius) + frame.height
        }
        
        return Size(width: width, height: height)
    }
}

extension Direction: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return arc.cartesianPoints
    }
    
    public var cartesianFrame: CartesianFrame {
        let outerArc = Arc(radius: arc.radius, startingDegree: arc.startDegree, endingDegree: arc.endDegree)
        return (try? CartesianFrame.make(for: outerArc, points: cartesianPoints)) ?? .zero
    }
}
