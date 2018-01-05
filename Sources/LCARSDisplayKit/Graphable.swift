#if (os(macOS) || os(iOS) || os(tvOS) || os(watchOS))

import CoreGraphics
import GraphPoint

public protocol Graphable {
    /// The `GraphPoint`s that define the area of the object
    var graphPoints: [GraphPoint] { get }
    /// The `GraphFrame` required to contain all the `GraphPoint`s
    var graphFrame: GraphFrame { get }
    /// Size used in creating the `path`.
    var size: CGSize { get set }
    /// A path connecting all `GraphPoint`s
    var path: CGMutablePath { get }
    /// A collection of paths that make up the `path`
    var subpaths: [CGMutablePath]? { get }
}

extension Graphable {
    public var graphPoints: [GraphPoint] {
        return []
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints)
    }
    
    public var path: CGMutablePath {
        return CGMutablePath()
    }
    
    public var subpaths: [CGMutablePath]? {
        return nil
    }
}

#endif
