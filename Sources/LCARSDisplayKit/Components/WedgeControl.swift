import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

#if !os(watchOS)
open class WedgeControl: InteractiveControl<Wedge> {
    
}
#endif

extension Wedge: ExpressibleByPath {
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let pivot = frame.relativePointForCartesianPoint(exteriorArc.pivotPoint)
        
        path.addArc(arc: exteriorArc, center: center, clockwise: false)
        path.addLine(to: pivot)
        path.closeSubpath()
        
        return path
    }
}
#endif
