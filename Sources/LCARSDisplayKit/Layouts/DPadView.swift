import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

struct DPadView: View {
    
    static let intrinsicDiameter: CGFloat = 350.0
    static let intrinsicCruxDiameter: CGFloat = 60.0
    static let intrinsicSpacing: CGFloat = 8.0
    
    var plane: CartesianPlane
    var diameter: CGFloat
    var radius: CGFloat
    var scale: CGFloat
    var spacing: CGFloat
    var cruxRadius: CGFloat
    var cartesianOffset: CartesianFrame.Offset = .zero
    
    init(size: CGSize) {
        plane = CartesianPlane(CGRect(origin: .zero, size: size))
        (diameter, radius, scale, spacing, cruxRadius) = size.dPadValues(
            intrinsicDiameter: Self.intrinsicDiameter,
            intrinsicCruxDiameter: Self.intrinsicCruxDiameter,
            intrinsicSpacing: Self.intrinsicSpacing
        )
    }
    
    var body: some View {
        ZStack {
            CruxView(
                Crux(radius: cruxRadius),
                in: plane,
                with: cartesianOffset
            )
            
            ForEach(DPad.Sector.allCases, id: \.self) { sector in
                WedgeView(
                    Wedge(exteriorArc: Arc(radius: radius, sector: sector)),
                    in: plane,
                    with: cartesianOffset
                )
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
            }
        }
    }
}

#Preview {
    GeometryReader { geometry in
        DPadView(size: geometry.size)
    }
}
#endif
