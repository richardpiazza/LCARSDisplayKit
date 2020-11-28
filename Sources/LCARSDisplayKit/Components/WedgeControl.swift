import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

open class WedgeControl: InteractiveControl<Wedge> {
    
}

extension Wedge: ExpressibleByPath {
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let pivot = frame.originModifiedBy(exteriorArc.pivotPoint)
        
        path.addArc(arc: exteriorArc, center: center, clockwise: false)
        path.addLine(to: pivot)
        path.closeSubpath()
        
        return path
    }
}
#endif
