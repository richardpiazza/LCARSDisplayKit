#if (os(iOS) || os(tvOS))

import UIKit
import GraphPoint

/// Button that has an interior matching an arc, and a flat exterior.
open class EdgedCrescentButton: Button {
    
    open var edgedCrescent: EdgedCrescent = EdgedCrescent()
    open override var graphable: Graphable {
        get {
            return edgedCrescent
        }
        set {
            if let type = newValue as? EdgedCrescent {
                edgedCrescent = type
            }
        }
    }
    
    convenience init(with edgedCrescent: EdgedCrescent, rect: CGRect, offset: GraphOriginOffset) {
        let frame = rect.frame(graphFrame: edgedCrescent.graphFrame, offset: offset)
        self.init(frame: frame)
        self.edgedCrescent = edgedCrescent
    }
}

#endif
