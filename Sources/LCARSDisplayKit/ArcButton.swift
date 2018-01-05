#if (os(iOS) || os(tvOS))

import UIKit
import GraphPoint

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
    
    convenience init(with arc: Arc, rect: CGRect, offset: GraphOriginOffset) {
        let frame = rect.frame(graphFrame: arc.graphFrame, offset: offset)
        self.init(frame: frame)
        self.arc = arc
    }
}

#endif
