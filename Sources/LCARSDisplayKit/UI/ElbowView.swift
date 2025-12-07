#if canImport(SwiftUI)
import GraphPoint
import Swift2D
import SwiftUI

public typealias ElbowView = PathConvertibleView<Elbow>

public extension ElbowView {
    init(
        size: Size = Elbow.intrinsicSize,
        alignment: Elbow.Alignment = .topLeft,
        exteriorRounding: Rounding? = .half,
        interiorRounding: Rounding? = nil,
        bodyHeight: Double = Elbow.intrinsicBodyHeight,
        stemWidth: Double = Elbow.intrinsicStemWidth,
        closedHeight: Double = Elbow.intrinsicClosedHeight,
        id: CartesianIdentifier = "",
        title: String = "",
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        let elbow = Elbow(
            size: size,
            alignment: alignment,
            exteriorRounding: exteriorRounding,
            interiorRounding: interiorRounding,
            bodyHeight: bodyHeight,
            stemWidth: stemWidth,
            closedHeight: closedHeight
        )
        path = Path(elbow.path)
        self.size = size
        self.id = id
        self.title = title
        self.action = action
    }
}
#endif
