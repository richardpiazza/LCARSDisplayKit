#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

public struct ElbowControl: CartesianPlaceable {
    public let elbow: Elbow
    public let identifier: CartesianIdentifier?

    public init(
        elbow: Elbow,
        identifier: CartesianIdentifier? = nil
    ) {
        self.elbow = elbow
        self.identifier = identifier
    }

    public var cartesianPoints: [CartesianPoint] {
        [
            CartesianPoint(x: -(elbow.size.width / 2.0), y: -(elbow.size.height / 2.0)),
            CartesianPoint(x: elbow.size.width / 2.0, y: elbow.size.height / 2.0),
        ]
    }
}

#if canImport(CoreGraphics)
extension ElbowControl: PathConvertible {
    public var path: CGPath { elbow.path }
}
#endif
