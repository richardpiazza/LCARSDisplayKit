#if canImport(SwiftUI)
import GraphPoint
import Swift2D
import SwiftUI

public struct DPadView: View {

    public static let intrinsicSize: Size = Size(width: 350.0, height: 350.0)
    public static let intrinsicOffset: CartesianFrame.Offset = .zero

    var values: DPadValues
    var action: (CartesianShapeIdentifier) -> Void

    @Environment(\.theme) private var theme

    public init(
        size: Size = Self.intrinsicSize,
        action: @escaping (CartesianShapeIdentifier) -> Void = { _ in }
    ) {
        values = DPadValues(
            size: size,
            intrinsicSize: Self.intrinsicSize
        )
        self.action = action
    }

    public init(
        scale value: Double,
        action: @escaping (CartesianShapeIdentifier) -> Void = { _ in }
    ) {
        values = DPadValues(
            scale: value,
            intrinsicSize: Self.intrinsicSize
        )
        self.action = action
    }

    public var body: some View {
        ZStack {
            CruxView(
                values.crux(),
                in: values.plane,
                with: values.offset,
                action: action
            )
            .foregroundStyle(theme.color(for: .primaryDark))

            ForEach(Wedge.Sector.allCases, id: \.self) { sector in
                WedgeView(
                    values.wedge(sector: sector),
                    in: values.plane,
                    with: values.offset,
                    action: action
                )
                .foregroundStyle(theme.color(for: .primaryMedium))
            }

            ForEach(Direction.Cardinal.allCases, id: \.self) { cardinal in
                DirectionView(
                    values.direction(cardinal: cardinal),
                    in: values.plane,
                    with: values.offset,
                    action: action
                )
                .foregroundStyle(theme.gradient(for: cardinal))
            }
        }
        .frame(width: values.plane.size.width, height: values.plane.size.height)
    }
}

public extension DPadView {
    init(
        size: CGSize,
        action: @escaping (CartesianShapeIdentifier) -> Void = { _ in }
    ) {
        values = DPadValues(
            size: Size(size),
            intrinsicSize: Self.intrinsicSize
        )
        self.action = action
    }
}

#Preview {
    GeometryReader { geometry in
//        DPadView()
        DPadView(size: geometry.size)
            .border(.red, width: 2)
    }
    .background(.black)
}
#endif
