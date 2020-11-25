import GraphPoint
#if canImport(UIKit)
import UIKit

/// A Button that draws an arc connected by a right angle pivot.
open class ArcButton: Button {
    
    open var arc: LCARSDisplayKit.Arc = LCARSDisplayKit.Arc()
    open override var graphable: Graphable {
        get {
            return arc
        }
        set {
            if let type = newValue as? LCARSDisplayKit.Arc {
                arc = type
            }
        }
    }
    
    public convenience init(with arc: LCARSDisplayKit.Arc, inBounds: CGRect, offset: GraphOriginOffset) {
        let frame = inBounds.frame(graphFrame: arc.graphFrame, offset: offset)
        self.init(frame: frame)
        self.arc = arc
    }
}
#endif
