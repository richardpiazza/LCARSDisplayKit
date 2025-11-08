import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

public struct DPadView01: View {
    
    private struct LongArc: Hashable, DegreeConvertible {
        var start: Degree
        var end: Degree
        var color: Color
    }
    
    private struct ShortArc: Hashable {
        var arc: DPad.Arc
        var color: Color
        var extended: Bool = false
    }
    
    public static let intrinsicSize: CGSize = CGSize(width: 760.0, height: 625.0)
    public static let intrinsicCruxDiameter: CGFloat = 60.0
    public static let intrinsicSpacing: CGFloat = 8.0
    public static let intrinsicRatio: CGFloat = {
        if intrinsicSize.width >= intrinsicSize.height {
            intrinsicSize.width / intrinsicSize.height
        } else {
            intrinsicSize.height / intrinsicSize.width
        }
    }()
    
    var plane: CartesianPlane
    var diameter: CGFloat
    var radius: CGFloat
    var scale: CGFloat
    var spacing: CGFloat
    var cruxRadius: CGFloat
    var cartesianOffset: CartesianFrame.Offset
    
    var firstRingInteriorRadius: CGFloat
    var firstRingExteriorRadius: CGFloat
    var secondRingInteriorRadius: CGFloat
    var secondRingExteriorRadius: CGFloat
    var secondRingExtendedExteriorRadius: CGFloat
    var thirdRingInteriorRadius: CGFloat
    var thirdRingExteriorRadius: CGFloat
    
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
        
        let scaledContentSize = if size.width > size.height {
            CGSize(width: size.height * Self.intrinsicRatio, height: size.height)
        } else {
            CGSize(width: size.width, height: size.width * Self.intrinsicRatio)
        }
        scale = if size.width > size.height {
            scaledContentSize.width / Self.intrinsicSize.width
        } else {
            scaledContentSize.height / Self.intrinsicSize.height
        }
        
        cartesianOffset = CartesianFrame.Offset(x: 0, y: scaledContentSize.height * 0.0765)
        
        firstRingInteriorRadius = ((DPadView.intrinsicSize.width / 2.0) * scale) + spacing
        firstRingExteriorRadius = firstRingInteriorRadius + (80.0 * scale)
        secondRingInteriorRadius = firstRingExteriorRadius + spacing
        secondRingExteriorRadius = secondRingInteriorRadius + (50.0 * scale)
        secondRingExtendedExteriorRadius = secondRingInteriorRadius + (110.0 * scale)
        thirdRingInteriorRadius = secondRingExteriorRadius + spacing
        thirdRingExteriorRadius = thirdRingInteriorRadius + (72.0 * scale)
    }
    
    public var body: some View {
        ZStack {
            DPadView(scale: scale)
                .frame(
                    width: DPadView.intrinsicSize.width * scale,
                    height: DPadView.intrinsicSize.height * scale
                )
                .offset(
                    x: cartesianOffset.x,
                    y: cartesianOffset.y
                )
            
            innerRing(
                interiorRadius: firstRingInteriorRadius,
                exteriorRadius: firstRingExteriorRadius,
                in: plane,
                with: cartesianOffset,
                longArcs: [
                    LongArc(start: DPad.Arc.arc01.start, end: DPad.Arc.arc04.end, color: appearance.tertiary.light),
                    LongArc(start: DPad.Arc.arc16.start, end: DPad.Arc.arc19.end, color: appearance.tertiary.light),
                ],
                shortArcs: [
                    ShortArc(arc: .arc05, color: appearance.primary.light),
                    ShortArc(arc: .arc10, color: appearance.primary.light),
                    ShortArc(arc: .arc11, color: appearance.tertiary.light),
                    ShortArc(arc: .arc12, color: appearance.primary.dark),
                    ShortArc(arc: .arc13, color: appearance.tertiary.dark),
                    ShortArc(arc: .arc14, color: appearance.tertiary.light),
                    ShortArc(arc: .arc15, color: appearance.primary.light),
                    ShortArc(arc: .arc20, color: appearance.primary.light),
                ]
            )
            
            outerRing(
                interiorRadius: secondRingInteriorRadius,
                exteriorRadius: secondRingExteriorRadius,
                extendedExteriorRadius: secondRingExtendedExteriorRadius,
                in: plane,
                with: cartesianOffset,
                shortArcs: [
                    ShortArc(arc: .arc10, color: appearance.primary.dark),
                    ShortArc(arc: .arc11, color: appearance.tertiary.dark),
                    ShortArc(arc: .arc12, color: appearance.tertiary.light),
                    ShortArc(arc: .arc13, color: appearance.primary.light),
                    ShortArc(arc: .arc14, color: appearance.primary.dark),
                    ShortArc(arc: .arc16, color: appearance.tertiary.dark),
                    ShortArc(arc: .arc17, color: appearance.primary.light),
                    ShortArc(arc: .arc18, color: appearance.primary.dark, extended: true),
                    ShortArc(arc: .arc19, color: appearance.tertiary.dark, extended: true),
                    ShortArc(arc: .arc20, color: appearance.tertiary.light),
                ]
            )
        }
    }
    
    private func innerRing(
        interiorRadius: CGFloat,
        exteriorRadius: CGFloat,
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset,
        longArcs: [LongArc] = [],
        shortArcs: [ShortArc] = []
    ) -> some View {
        ZStack {
            ForEach(longArcs, id: \.self) { longArc in
                CrescentView(
                    Crescent(
                        interiorArc: Arc(
                            radius: interiorRadius,
                            startingDegree: longArc.start,
                            endingDegree: longArc.end
                        ),
                        exteriorArc: Arc(
                            radius: exteriorRadius,
                            startingDegree: longArc.start,
                            endingDegree: longArc.end
                        )
                    ),
                    in: plane,
                    with: offset
                )
                .foregroundStyle(longArc.color)
            }
            
            ForEach(shortArcs, id: \.self) { shortArc in
                CrescentView(
                    Crescent(
                        interiorArc: Arc(
                            radius: interiorRadius,
                            arc: shortArc.arc
                        ),
                        exteriorArc: Arc(
                            radius: exteriorRadius,
                            arc: shortArc.arc
                        )
                    ),
                    in: plane,
                    with: offset
                )
                .foregroundStyle(shortArc.color)
            }
        }
    }
    
    private func outerRing(
        interiorRadius: CGFloat,
        exteriorRadius: CGFloat,
        extendedExteriorRadius: CGFloat,
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset,
        shortArcs: [ShortArc] = []
    ) -> some View {
        ZStack {
            ForEach(shortArcs, id: \.self) { shortArc in
                CrescentView(
                    Crescent(
                        interiorArc: Arc(
                            radius: interiorRadius,
                            arc: shortArc.arc
                        ),
                        exteriorArc: Arc(
                            radius: shortArc.extended ? extendedExteriorRadius : exteriorRadius,
                            arc: shortArc.arc
                        )
                    ),
                    in: plane,
                    with: offset
                )
                .foregroundStyle(shortArc.color)
            }
        }
    }
}

#Preview {
    GeometryReader { geometry in
        DPadView01(size: geometry.size)
    }
    .background(.black)
}
#endif
