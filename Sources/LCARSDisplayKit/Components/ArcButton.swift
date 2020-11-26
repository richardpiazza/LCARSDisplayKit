import GraphPoint
#if canImport(UIKit)
import UIKit

/// A Button that draws an arc connected by a right angle pivot.
open class ArcButton: Button {
    
    open var arc: Arc = Arc()
    open override var graphable: Graphable {
        get {
            return arc
        }
        set {
            if let type = newValue as? Arc {
                arc = type
            }
        }
    }
    
    @available(*, deprecated)
    public convenience init(with arc: Arc, inBounds: CGRect, offset: GraphOriginOffset) {
        let frame = inBounds.frame(graphFrame: arc.graphFrame, offset: offset)
        self.init(frame: frame)
        self.arc = arc
    }
}

open class Sector_Button: TappableButton<Arc> {
    
}
#endif
