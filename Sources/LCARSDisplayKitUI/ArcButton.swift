#if (os(iOS) || os(tvOS))

import UIKit
import GraphPoint
import LCARSDisplayKit

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
    
    public convenience init(with arc: LCARSDisplayKit.Arc, rect: CGRect, offset: GraphOriginOffset) {
        let frame = rect.frame(graphFrame: arc.graphFrame, offset: offset)
        self.init(frame: frame)
        self.arc = arc
    }
}

#endif