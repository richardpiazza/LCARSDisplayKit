import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

/// An example control set that extends a 'DPad' with a 'Elbow'.
public struct DPadClusterStackedView: View {
    
    public static let intrinsicSize: Size = Size(width: 410.0, height: 995.0)
    public static let intrinsicOffset: CartesianFrame.Offset = Point(x: 30.0, y: 318.4)
    
    var values: DPadValues
    var action: (CartesianShapeIdentifier) -> Void
    
    @Environment(\.theme) private var theme
    
    public init(
        size: Size = Self.intrinsicSize,
        action: @escaping (CartesianShapeIdentifier) -> Void = { _ in }
    ) {
        values = DPadValues(
            size: size,
            intrinsicSize: Self.intrinsicSize,
            intrinsicOffset: Self.intrinsicOffset
        )
        self.action = action
    }
    
    public var body: some View {
        ZStack {
            DPadView(
                scale: values.scale,
                action: action
            )
            .frame(
                width: DPadView.intrinsicSize.width * values.scale,
                height: DPadView.intrinsicSize.height * values.scale
            )
            .position(
                x: values.plane.midX + values.offset.x,
                y: values.plane.midY + values.offset.y
            )
            
            ElbowView(
                "",
                shape: Elbow(
                    size: Size(
                        width: values.plane.size.width,
                        height: 625.0 * values.scale
                    ),
                    horizontalHeight: 220.0 * values.scale,
                    verticalWidth: 40.0 * values.scale,
                    shouldMatchRadius: true
                ),
                in: values.plane,
                with: CartesianFrame.Offset(
                    x: 0.0 * values.scale,
                    y: -185.0 * values.scale
                )
            )
            .foregroundStyle(theme.color(for: .primaryMedium))
            
            ElbowView(
                "",
                shape: Elbow(
                    size: Size(
                        width: 40 * values.scale,
                        height: 350.0 * values.scale
                    ),
                    rounded: false,
                    horizontalHeight: 0.0,
                    verticalWidth: 40.0 * values.scale,
                    shouldMatchRadius: false
                ),
                in: values.plane,
                with: CartesianFrame.Offset(
                    x: -185.0 * values.scale,
                    y: 320.0 * values.scale
                )
            )
            .foregroundStyle(theme.color(for: .tertiaryMedium))
        }
        .frame(width: values.plane.size.width, height: values.plane.size.height)
    }
}

public extension DPadClusterStackedView {
    init(
        size: CGSize,
        action: @escaping (CartesianShapeIdentifier) -> Void = { _ in }
    ) {
        values = DPadValues(
            size: Size(size),
            intrinsicSize: Self.intrinsicSize,
            intrinsicOffset: Self.intrinsicOffset
        )
        self.action = action
    }
}

#Preview {
    GeometryReader { geometry in
//        DPadClusterStackedView()
        DPadClusterStackedView(size: geometry.size)
            .border(.red, width: 2)
    }
    .background(.black)
    .border(.blue, width: 2)
}
#endif
