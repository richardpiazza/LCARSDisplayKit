import GraphPoint
import Swift2D

public protocol ExpressibleByCartesianPoints {
    /// The points that define the shape of the object.
    var cartesianPoints: [CartesianPoint] { get }
    /// The rectangle of the plane which contains all of the points.
    var cartesianFrame: CartesianFrame { get }
    
}

public extension ExpressibleByCartesianPoints {
    var cartesianFrame: CartesianFrame {
        return CartesianFrame.make(for: cartesianPoints)
    }
}
