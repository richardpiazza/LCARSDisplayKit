import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

#if !os(watchOS)
open class CrescentControl: InteractiveControl<Crescent> {
    
}
#endif

extension Crescent: ExpressibleByPath {
    public var path: CGMutablePath {
        let path = CGMutablePath()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let translated = frame.originModifiedBy(exteriorArcEndingPoint)
        
        path.addArc(center: center, radius: interiorRadius, startDegree: interiorArc.startingDegree, endDegree: interiorArc.endingDegree, clockwise: false)
        path.addLine(to: translated)
        path.addArc(center: center, radius: exteriorRadius, startDegree: exteriorArc.endingDegree, endDegree: exteriorArc.startingDegree, clockwise: true)
        path.closeSubpath()
        
        return path
    }
}
#endif
