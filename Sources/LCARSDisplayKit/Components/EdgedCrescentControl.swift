import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

open class EdgedCrescentControl: InteractiveControl<EdgedCrescent> {
    
}

extension EdgedCrescent: ExpressibleByPath {
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        
        path.addArc(arc: interiorArc, center: center, clockwise: false)
        
        edgePoints.reversed().forEach { (point) in
            let translated = frame.originModifiedBy(point)
            path.addLine(to: translated)
        }
        
        path.closeSubpath()
        
        return path
    }
}
#endif
