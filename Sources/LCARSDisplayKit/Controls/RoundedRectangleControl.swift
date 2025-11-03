import GraphPoint
import Swift2D
#if canImport(UIKit) && !os(watchOS)
import UIKit

open class RoundedRectangleControl: InteractiveControl<RoundedRectangle> {

    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 144, height: 60)
    }
    
    open override func didChangeSize(_ size: Size) {
        super.didChangeSize(size)
        shape.size = size
    }
}
#endif
