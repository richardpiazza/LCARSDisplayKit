import GraphPoint
#if canImport(SwiftUI)
import SwiftUI

struct CartesianShapeView<T: CartesianPointConvertible & PathConvertible>: View {
    var path: Path
    var rect: CGRect
    var offset: CGPoint
    var action: () -> Void = { }
    
    init(
        _ shape: T,
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset = .zero,
        action: @escaping () -> Void = { }
    ) {
        self.path = Path(shape.path)
        self.rect = CGRect(plane.rect(for: shape.cartesianFrame))
        self.offset = CGPoint(offset)
        self.action = action
    }
    
    var body: some View {
        path
            .frame(
                width: rect.width,
                height: rect.height
            )
            .position(
                x: rect.minX + offset.x + (rect.width / 2.0),
                y: rect.minY + offset.y + (rect.height / 2.0)
            )
            .onTapGesture {
                action()
            }
    }
}

typealias CruxView = CartesianShapeView<Crux>
typealias DirectionView = CartesianShapeView<Direction>
typealias WedgeView = CartesianShapeView<Wedge>
#endif
