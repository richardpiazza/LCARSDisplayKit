import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

#if !os(watchOS)
open class CrescentControl: InteractiveControl<Crescent> {
    
}
#endif

extension Crescent: ExpressibleByPath {
    public var path: CGPath {
        let path = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let translated = frame.relativePointForCartesianPoint(exteriorArcEndingPoint)
        
        path.addArc(arc: interiorArc, center: center, clockwise: false)
        path.addLine(to: translated)
        path.addArc(arc: exteriorArc.reversed, center: center, clockwise: true)
        path.closeSubpath()
        
        return path
    }
}
#endif
