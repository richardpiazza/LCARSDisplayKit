#if canImport(SwiftUI)
import GraphPoint
import Swift2D
import SwiftUI

public typealias ObroundView = PathConvertibleView<Obround>

public extension ObroundView {
    init(
        size: Size = Obround.intrinsicSize,
        roundLeading: Bool = true,
        roundTrailing: Bool = true,
        rounding: Rounding = .half,
        id: CartesianIdentifier = "",
        title: String = "",
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        let obround = Obround(
            size: size,
            roundLeading: roundLeading,
            roundTrailing: roundTrailing,
            rounding: rounding
        )
        path = Path(obround.path)
        self.size = size
        self.id = id
        self.title = title
        self.action = action
    }
    
    init(
        scale: Double,
        roundLeading: Bool = true,
        roundTrailing: Bool = true,
        rounding: Rounding = .half,
        id: CartesianIdentifier = "",
        title: String = "",
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        let obround = Obround(
            scale: scale,
            roundLeading: roundLeading,
            roundTrailing: roundTrailing,
            rounding: rounding
        )
        path = Path(obround.path)
        size = obround.size
        self.id = id
        self.title = title
        self.action = action
    }
}
#endif
