#if canImport(CoreGraphics)
import CoreGraphics

public protocol ExpressibleByPath {
    /// A `CoreGraphics` representation of the object.
    var path: CGMutablePath { get }
    /// Collection of self-contained paths that comprise the full `path`.
    var subpaths: [CGMutablePath]? { get }
}

public extension ExpressibleByPath {
    var subpaths: [CGMutablePath]? {
        return nil
    }
}
#endif
