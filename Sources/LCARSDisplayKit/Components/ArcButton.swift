import GraphPoint
#if canImport(UIKit)
import UIKit

/// A Button that draws an arc connected by a right angle pivot.
open class ArcButton: Button {
    
    open var arc: ModifiedArc = ModifiedArc()
    open override var graphable: Graphable {
        get {
            return arc
        }
        set {
            if let type = newValue as? ModifiedArc {
                arc = type
            }
        }
    }
    
    @available(*, deprecated)
    public convenience init(with arc: ModifiedArc, inBounds: CGRect, offset: GraphOriginOffset) {
        let frame = inBounds.frame(graphFrame: arc.graphFrame, offset: offset)
        self.init(frame: frame)
        self.arc = arc
    }
}

open class Sector_Button: TappableButton<Arc> {
    
}
#endif
