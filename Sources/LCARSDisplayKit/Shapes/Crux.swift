#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

public struct Crux: Hashable, Sendable {
    
    public static let intrinsicSize: CGSize = CGSize(width: 60.0, height: 60.0)
    
    public let radius: Radius
    
    public init(
        radius: Radius = 0.0
    ) {
        self.radius = radius
    }
}

extension Crux: CartesianShape {
    public var cartesianPoints: [CartesianPoint] {
        [
            CartesianPoint(x: -radius, y: -radius),
            CartesianPoint(x: radius, y: -radius),
            CartesianPoint(x: -radius, y: radius),
            CartesianPoint(x: radius, y: radius),
        ]
    }
    
    public var cartesianFrame: CartesianFrame {
        CartesianFrame.make(for: cartesianPoints)
    }
    
    #if canImport(CoreGraphics)
    public var path: CGPath {
        let path = CGMutablePath()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: radius * 2.0, y: 0))
        path.addLine(to: CGPoint(x: radius * 2.0, y: radius * 2.0))
        path.addLine(to: CGPoint(x: 0, y: radius * 2.0))
        path.closeSubpath()
        
        return path
    }
    #endif
}
