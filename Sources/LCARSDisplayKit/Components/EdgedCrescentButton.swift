import GraphPoint
#if canImport(UIKit)
import UIKit

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
    
    public convenience init(with edgedCrescent: EdgedCrescent, inBounds: CGRect, offset: GraphOriginOffset) {
        let frame = inBounds.frame(graphFrame: edgedCrescent.graphFrame, offset: offset)
        self.init(frame: frame)
        self.edgedCrescent = edgedCrescent
    }
}
#endif
