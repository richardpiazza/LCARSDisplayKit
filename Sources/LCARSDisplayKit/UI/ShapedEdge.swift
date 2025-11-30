#if canImport(SwiftUI)
import GraphPoint
import SwiftUI

struct ShapedEdge<T: CartesianShape> {
    var title: String = ""
    var shape: T
    var appearance: ControlAppearance
}
#endif
