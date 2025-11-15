#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint

public protocol CartesianShape: Hashable, Identifiable<CartesianShapeIdentifier> {
    var identifier: CartesianShapeIdentifier? { get }

    /// The points that define the shape of the object.
    var cartesianPoints: [CartesianPoint] { get }

    /// The rectangle of the plane which contains all of the points.
    var cartesianFrame: CartesianFrame { get }

    #if canImport(CoreGraphics)
    /// A `CoreGraphics` representation of the object.
    var path: CGPath { get }

    /// Collection of self-contained paths that comprise the full `path`.
    var subpaths: [CGPath]? { get }
    #endif
}

public extension CartesianShape {
    var identifier: CartesianShapeIdentifier? {
        nil
    }

    var id: CartesianShapeIdentifier {
        identifier ?? CartesianShapeIdentifier(stringLiteral: hashValue.formatted())
    }

    var cartesianFrame: CartesianFrame {
        CartesianFrame.make(for: cartesianPoints)
    }

    #if canImport(CoreGraphics)
    var subpaths: [CGPath]? {
        nil
    }
    #endif
}
