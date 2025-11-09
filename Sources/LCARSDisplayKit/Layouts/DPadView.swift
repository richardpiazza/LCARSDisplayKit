import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

public struct DPadView: View {
    
    public static let intrinsicSize: CGSize = CGSize(width: 350.0, height: 350.0)
    public static let intrinsicCruxDiameter: CGFloat = 60.0
    public static let intrinsicSpacing: CGFloat = 8.0
    
    var plane: CartesianPlane
    var diameter: CGFloat
    var radius: CGFloat
    var spacing: CGFloat
    var cruxRadius: CGFloat
    var cartesianOffset: CartesianFrame.Offset = .zero
    
    @Environment(\.appearance) private var appearance
    
    public init(
        size: CGSize = Self.intrinsicSize
    ) {
        plane = CartesianPlane(CGRect(origin: .zero, size: size))
        (diameter, radius, _, spacing, cruxRadius) = size.dPadValues(
            intrinsicSize: Self.intrinsicSize,
            intrinsicCruxDiameter: Self.intrinsicCruxDiameter,
            intrinsicSpacing: Self.intrinsicSpacing
        )
    }
    
    public init(
        scale value: CGFloat
    ) {
        let size = CGSize(width: Self.intrinsicSize.width * value, height: Self.intrinsicSize.height * value)
        plane = CartesianPlane(CGRect(origin: .zero, size: size))
        (diameter, radius, _, spacing, cruxRadius) = size.dPadValues(
            intrinsicSize: Self.intrinsicSize,
            intrinsicCruxDiameter: Self.intrinsicCruxDiameter,
            intrinsicSpacing: Self.intrinsicSpacing
        )
    }
    
    public var body: some View {
        ZStack {
            CruxView(
                Crux(radius: cruxRadius),
                in: plane,
                with: cartesianOffset
            )
            .foregroundStyle(appearance.primary.dark)
            
            ForEach(DPad.Sector.allCases, id: \.self) { sector in
                WedgeView(
                    Wedge(exteriorArc: Arc(radius: radius, sector: sector)),
                    in: plane,
                    with: cartesianOffset
                )
                .foregroundStyle(appearance.primary.medium)
            }
            
            ForEach(DPad.CardinalDirection.allCases, id: \.self) { direction in
                DirectionView(
                    Direction(
                        direction,
                        interiorRadius: cruxRadius + spacing,
                        exteriorArc: Arc(radius: radius, cardinalDirection: direction)
                    ),
                    in: plane,
                    with: cartesianOffset
                )
                .foregroundStyle(gradient(for: direction))
            }
        }
        .frame(width: plane.size.width, height: plane.size.height)
    }
    
    private func gradient(for direction: DPad.CardinalDirection) -> LinearGradient {
        let (start, end): (UnitPoint, UnitPoint) = switch direction {
        case .down:
            (.bottom, .top)
        case .left:
            (.leading, .trailing)
        case .up:
            (.top, .bottom)
        case .right:
            (.trailing, .leading)
        }
        
        return LinearGradient(
            stops: [
                Gradient.Stop(
                    color: appearance.primary.dark,
                    location: 0
                ),
                Gradient.Stop(
                    color: appearance.primary.dark,
                    location: 0.4
                ),
                Gradient.Stop(
                    color: appearance.primary.light,
                    location: 0.4
                ),
                Gradient.Stop(
                    color: appearance.primary.light,
                    location: 1.0
                )
            ],
            startPoint: start,
            endPoint: end
        )
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
