import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

/// An example control set that extends a 'DPad' with a 'Elbow'.
public struct DPadClusterStackedView: View {

    public static let intrinsicSize: Size = Size(width: 410.0, height: 995.0)
    public static let intrinsicOffset: CartesianFrame.Offset = Point(x: 30.0, y: 318.4)

    var values: DirectionPad
    var action: (CartesianIdentifier) -> Void

    @Environment(\.theme) private var theme

    public init(
        size: Size = Self.intrinsicSize,
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        values = DirectionPad(
            size: size,
            intrinsicSize: Self.intrinsicSize,
            intrinsicOffset: Self.intrinsicOffset
        )
        self.action = action
    }

    public var body: some View {
        ZStack {
            values.dPadView(action: action)

            ElbowControlView(
                "",
                shape: ElbowControl(
                    elbow: Elbow(
                        size: Size(
                            width: values.plane.size.width,
                            height: 625.0 * values.scale
                        ),
                        horizontalHeight: 220.0 * values.scale,
                        verticalWidth: 40.0 * values.scale,
                        shouldMatchRadius: true
                    ),
                    identifier: nil
                ),
                in: values.plane,
                with: values.scale(offset: CartesianFrame.Offset(x: 0.0, y: -185.0))
            )
            .foregroundStyle(theme.color(for: .primaryMedium))

            ElbowControlView(
                "",
                shape: ElbowControl(
                    elbow: Elbow(
                        size: Size(
                            width: 40 * values.scale,
                            height: 350.0 * values.scale
                        ),
                        rounded: false,
                        horizontalHeight: 0.0,
                        verticalWidth: 40.0 * values.scale,
                        shouldMatchRadius: false
                    ),
                    identifier: nil
                ),
                in: values.plane,
                with: values.scale(offset: CartesianFrame.Offset(x: -185.0, y: 320.0))
            )
            .foregroundStyle(theme.color(for: .tertiaryMedium))

            ObroundControlView(
                "01",
                shape: ObroundControl(
                    obround: Obround(
                        size: values.scale(size: Obround.intrinsicSize)
                    ),
                    at: Point(x: 20, y: 250)
                ),
                in: values.plane,
                with: values.offset
            )
            .foregroundStyle(theme.color(for: .secondaryLight))

            Text(values.offset.description)
                .foregroundStyle(.white)
        }
        .frame(width: values.plane.size.width, height: values.plane.size.height)
    }
}

public extension DPadClusterStackedView {
    init(
        size: CGSize,
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        values = DirectionPad(
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
