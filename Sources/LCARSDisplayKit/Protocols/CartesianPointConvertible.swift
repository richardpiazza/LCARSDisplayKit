import GraphPoint
import Swift2D

@available(*, deprecated, renamed: "CartesianPointConvertible")
public typealias ExpressibleByCartesianPoints = CartesianPointConvertible

public protocol CartesianPointConvertible {
    /// The points that define the shape of the object.
    var cartesianPoints: [CartesianPoint] { get }
    /// The rectangle of the plane which contains all of the points.
    var cartesianFrame: CartesianFrame { get }
    
}

public extension CartesianPointConvertible {
    var cartesianFrame: CartesianFrame {
        return CartesianFrame.make(for: cartesianPoints)
    }
}
