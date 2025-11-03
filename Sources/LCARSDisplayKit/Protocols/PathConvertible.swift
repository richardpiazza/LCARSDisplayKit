#if canImport(CoreGraphics)
import CoreGraphics

@available(*, deprecated, renamed: "PathConvertible")
public typealias ExpressibleByPath = PathConvertible

public protocol PathConvertible {
    /// A `CoreGraphics` representation of the object.
    var path: CGPath { get }
    /// Collection of self-contained paths that comprise the full `path`.
    var subpaths: [CGPath]? { get }
}

public extension PathConvertible {
    var subpaths: [CGPath]? {
        return nil
    }
}
#endif
