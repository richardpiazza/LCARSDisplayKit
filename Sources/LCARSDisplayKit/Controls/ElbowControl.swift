import GraphPoint
import Swift2D
#if canImport(UIKit) && !os(watchOS)
import UIKit

open class ElbowControl: InteractiveControl<Elbow> {
    
    open override func didChangeSize(_ size: Size) {
        super.didChangeSize(size)
        shape.size = size
    }
}
#endif
