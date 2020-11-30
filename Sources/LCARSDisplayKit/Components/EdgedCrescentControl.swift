import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

#if !os(watchOS)
open class EdgedCrescentControl: InteractiveControl<EdgedCrescent> {
    
}
#endif

extension EdgedCrescent: ExpressibleByPath {
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        
        path.addArc(arc: interiorArc, center: center, clockwise: false)
        
        edgePoints.reversed().forEach { (point) in
            let translated = frame.relativePointForCartesianPoint(point)
            path.addLine(to: translated)
        }
        
        path.closeSubpath()
        
        return path
    }
}
#endif
