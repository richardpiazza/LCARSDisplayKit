#if canImport(SwiftUI)
import SwiftUI

internal struct ShapedEdge<T: CartesianShape> {
    var title: String = ""
    var shape: T
    var color: Color
}
#endif
