import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

public struct DPadView: View {

    public static let intrinsicSize: CGSize = CGSize(width: 350.0, height: 350.0)
    public static let intrinsicSpacing: CGFloat = 8.0
    
    var plane: CartesianPlane
    var diameter: CGFloat
    var radius: CGFloat
    var spacing: CGFloat
    var cruxRadius: CGFloat
    var cartesianOffset: CartesianFrame.Offset = .zero
    var action: (CartesianShapeIdentifier) -> Void
    
    @Environment(\.theme) private var theme
    
    public init(
        size: CGSize = Self.intrinsicSize,
        action: @escaping (CartesianShapeIdentifier) -> Void = { _ in }
    ) {
        plane = CartesianPlane(CGRect(origin: .zero, size: size))
        (diameter, radius, _, spacing, cruxRadius) = size.dPadValues(
            intrinsicSize: Self.intrinsicSize,
            intrinsicCruxDiameter: max(Crux.intrinsicSize.width, Crux.intrinsicSize.height),
            intrinsicSpacing: Self.intrinsicSpacing
        )
        self.action = action
    }
    
    public init(
        scale value: CGFloat,
        action: @escaping (CartesianShapeIdentifier) -> Void = { _ in }
    ) {
        let size = CGSize(width: Self.intrinsicSize.width * value, height: Self.intrinsicSize.height * value)
        plane = CartesianPlane(CGRect(origin: .zero, size: size))
        (diameter, radius, _, spacing, cruxRadius) = size.dPadValues(
            intrinsicSize: Self.intrinsicSize,
            intrinsicCruxDiameter: max(Crux.intrinsicSize.width, Crux.intrinsicSize.height),
            intrinsicSpacing: Self.intrinsicSpacing
        )
        self.action = action
    }
    
    public var body: some View {
        ZStack {
            CruxView(
                Crux(
                    identifier: .crux,
                    radius: cruxRadius
                ),
                in: plane,
                with: cartesianOffset,
                action: action
            )
            .foregroundStyle(theme.color(for: .primaryDark))
            
            ForEach(Wedge.Sector.allCases, id: \.self) { sector in
                WedgeView(
                    Wedge(
                        identifier: sector.rawValue,
                        sector: sector,
                        radius: radius
                    ),
                    in: plane,
                    with: cartesianOffset,
                    action: action
                )
                .foregroundStyle(theme.color(for: .primaryMedium))
            }
            
            ForEach(Direction.Cardinal.allCases, id: \.self) { direction in
                DirectionView(
                    Direction(
                        identifier: direction.rawValue,
                        cardinal: direction,
                        interiorRadius: cruxRadius + spacing,
                        exteriorRadius: radius
                    ),
                    in: plane,
                    with: cartesianOffset,
                    action: action
                )
                .foregroundStyle(theme.gradient(for: direction))
            }
        }
        .frame(width: plane.size.width, height: plane.size.height)
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
