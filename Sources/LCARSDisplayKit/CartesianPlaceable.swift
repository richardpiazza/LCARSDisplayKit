import GraphPoint

public protocol CartesianPlaceable: CartesianIdentifiable {
    /// The points that define the shape of the object.
    var cartesianPoints: [CartesianPoint] { get }

    /// The rectangle of the plane which contains all of the points.
    var cartesianFrame: CartesianFrame { get }
}

public extension CartesianPlaceable {
    var cartesianFrame: CartesianFrame {
        CartesianFrame.make(for: cartesianPoints)
    }
}
