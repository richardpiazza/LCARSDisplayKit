import GraphPoint
#if canImport(UIKit)
import UIKit

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
    
    @available(*, deprecated)
    public convenience init(with crescent: Crescent, inBounds: CGRect, offset: GraphOriginOffset) {
        let frame = inBounds.frame(graphFrame: crescent.graphFrame, offset: offset)
        self.init(frame: frame)
        self.crescent = crescent
    }
}
#endif
