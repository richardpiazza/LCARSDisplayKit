#if canImport(SwiftUI)
import GraphPoint
import SwiftUI

struct CartesianControl<T: CartesianShape> {
    var title: String = ""
    var shape: T
    var appearance: ControlAppearance
}
#endif
