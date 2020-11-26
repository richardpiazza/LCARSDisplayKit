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
    public var arc: Arc
    public var innerRadius: Radius
    
    public init(_ cardinal: Cardinal = .right, arc: Arc = Arc(), innerRadius: Radius = 0.0) {
        self.cardinal = cardinal
        self.arc = arc
        self.innerRadius = innerRadius
    }
    
    public var _size: Size {
        let frame = cartesianFrame
        let width: Float
        let height: Float
        
        switch cardinal {
        case .right:
            width = (frame.x - innerRadius) + frame.width
            height = max(frame.width, frame.height)
        case .down:
            width = max(frame.width, frame.height)
            height = (abs(frame.y) - innerRadius) + frame.height
        case .left:
            width = (abs(frame.x) - innerRadius) + frame.width
            height = max(frame.width, frame.height)
        case .up:
            width = max(frame.width, frame.height)
            height = (frame.y - innerRadius) + frame.height
        }
        
        return Size(width: width, height: height)
    }
}

extension Direction: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return []
    }
    
    public var cartesianFrame: CartesianFrame {
        return (try? CartesianFrame.make(for: arc.startingPoint, point2: arc.endingPoint, radius: arc.radius)) ?? .zero
    }
}
