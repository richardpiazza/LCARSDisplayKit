#if canImport(CoreGraphics)
import CoreGraphics

public protocol ExpressibleByPath {
    /// A `CoreGraphics` representation of the object.
    var path: CGPath { get }
    /// Collection of self-contained paths that comprise the full `path`.
    var subpaths: [CGPath]? { get }
}

public extension ExpressibleByPath {
    var subpaths: [CGPath]? {
        return nil
    }
}
#endif
