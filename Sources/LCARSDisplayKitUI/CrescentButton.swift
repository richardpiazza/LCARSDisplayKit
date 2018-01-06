#if (os(iOS) || os(tvOS))

import UIKit
import GraphPoint
import LCARSDisplayKit

/// A button used to outline a circular 'DPad'
open class CrescentButton: Button {
    
    open var crescent: Crescent = Crescent()
    open override var graphable: Graphable {
        get {
            return crescent
        }
        set {
            if let type = newValue as? Crescent {
                crescent = type
            }
        }
    }
    
    public convenience init(with crescent: Crescent, rect: CGRect, offset: GraphOriginOffset) {
        let frame = rect.frame(graphFrame: crescent.graphFrame, offset: offset)
        self.init(frame: frame)
        self.crescent = crescent
    }
}

#endif
