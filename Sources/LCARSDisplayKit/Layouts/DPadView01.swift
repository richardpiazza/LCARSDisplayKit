import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

public struct DPadView01: View {
    
    private struct LongArc: Hashable, DegreeConvertible {
        var title: String = ""
        var start: Degree
        var end: Degree
        var color: Color
    }
    
    private struct ShortArc: Hashable {
        var title: String = ""
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
    var secondRingEdgeExteriorRadius: CGFloat
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
        secondRingEdgeExteriorRadius = secondRingExteriorRadius + (41.5 * scale)
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
                .position(
                    x: plane.midX + cartesianOffset.x,
                    y: plane.midY + cartesianOffset.y
                )
            
            innerRing(
                interiorRadius: firstRingInteriorRadius,
                exteriorRadius: firstRingExteriorRadius,
                in: plane,
                with: cartesianOffset,
                longArcs: [
                    LongArc(title: "IR01", start: DPad.Arc.arc01.start, end: DPad.Arc.arc04.end, color: appearance.secondary.light),
                    LongArc(title: "IR16", start: DPad.Arc.arc16.start, end: DPad.Arc.arc19.end, color: appearance.secondary.light),
                ],
                shortArcs: [
                    ShortArc(title: "IR05", arc: .arc05, color: appearance.primary.light),
                    ShortArc(title: "IR10", arc: .arc10, color: appearance.primary.light),
                    ShortArc(title: "IR11", arc: .arc11, color: appearance.secondary.light),
                    ShortArc(title: "IR12", arc: .arc12, color: appearance.primary.dark),
                    ShortArc(title: "IR13", arc: .arc13, color: appearance.secondary.dark),
                    ShortArc(title: "IR14", arc: .arc14, color: appearance.secondary.light),
                    ShortArc(title: "IR15", arc: .arc15, color: appearance.primary.light),
                    ShortArc(title: "IR20", arc: .arc20, color: appearance.primary.light),
                ]
            )
            
            outerRing(
                interiorRadius: secondRingInteriorRadius,
                exteriorRadius: secondRingExteriorRadius,
                extendedExteriorRadius: secondRingExtendedExteriorRadius,
                in: plane,
                with: cartesianOffset,
                shortArcs: [
                    ShortArc(title: "OR10", arc: .arc10, color: appearance.primary.dark),
                    ShortArc(title: "OR11", arc: .arc11, color: appearance.secondary.dark),
                    ShortArc(title: "OR12", arc: .arc12, color: appearance.secondary.light),
                    ShortArc(title: "OR13", arc: .arc13, color: appearance.primary.light),
                    ShortArc(title: "OR14", arc: .arc14, color: appearance.primary.dark),
                    ShortArc(title: "OR16", arc: .arc16, color: appearance.secondary.dark),
                    ShortArc(title: "OR17", arc: .arc17, color: appearance.primary.light),
                    ShortArc(title: "OR18", arc: .arc18, color: appearance.primary.dark, extended: true),
                    ShortArc(title: "OR19", arc: .arc19, color: appearance.secondary.dark, extended: true),
                    ShortArc(title: "OR20", arc: .arc20, color: appearance.secondary.light),
                ]
            )
            
            edges(
                in: plane,
                with: cartesianOffset
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
                    longArc.title,
                    shape: Crescent(
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
                    shortArc.title,
                    shape: Crescent(
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
                    shortArc.title,
                    shape: Crescent(
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
    
    private func edges(
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset
    ) -> some View {
        ZStack {
            EdgedCrescentView(
                "-",
                shape: edge06,
                in: plane,
                with: offset
            )
            .foregroundStyle(appearance.secondary.light)
            
            EdgedCrescentView(
                "MODE SELECT",
                shape: edge07,
                in: plane,
                with: offset
            )
            .foregroundStyle(appearance.primary.light)
            
            EdgedCrescentView(
                "+",
                shape: edge09,
                in: plane,
                with: offset
            )
            .foregroundStyle(appearance.secondary.dark)
            
            EdgedCrescentView(
                "E13",
                shape: edge13,
                in: plane,
                with: offset
            )
            .foregroundStyle(appearance.primary.dark)
            
            EdgedCrescentView(
                "E15",
                shape: edge15,
                in: plane,
                with: offset
            )
            .foregroundStyle(appearance.secondary.light)
            
            ObroundView(
                "T00",
                shape: top00,
                in: plane,
                with: offset
            )
            .foregroundStyle(appearance.secondary.light)
        }
    }
    
    private var edge06: EdgedCrescent {
        let interiorArc = Arc(radius: firstRingInteriorRadius, arc: .arc06)
        let exteriorArc = Arc(radius: firstRingExteriorRadius, arc: .arc06)
        let point = try! CartesianPoint.make(for: firstRingExteriorRadius, degree: DPad.Arc.arc06.end)
        
        return EdgedCrescent(
            interiorArc: interiorArc,
            edgePoints: [
                CartesianPoint(x: exteriorArc.startingPoint.x, y: exteriorArc.startingPoint.y),
                CartesianPoint(x: point.x, y: exteriorArc.startingPoint.y),
            ]
        )
    }
    
    private var edge07: EdgedCrescent {
        let interiorArc = Arc(radius: firstRingInteriorRadius, startingDegree: DPad.Arc.arc07.start, endingDegree: DPad.Arc.arc08.end)
        
        let edge06Exterior = Arc(radius: firstRingExteriorRadius, arc: .arc06)
        let edge09Exterior = Arc(radius: secondRingExtendedExteriorRadius, arc: .arc09)
        let startingEdge = try! CartesianPoint.make(for: firstRingExteriorRadius, degree: DPad.Arc.arc07.start)
        let endingEdge = try! CartesianPoint.make(for: secondRingExtendedExteriorRadius, degree: DPad.Arc.arc08.end)
        
        return EdgedCrescent(
            interiorArc: interiorArc,
            edgePoints: [
                CartesianPoint(x: startingEdge.x, y: edge06Exterior.startingPoint.y),
                CartesianPoint(x: edge09Exterior.endingPoint.x, y: edge06Exterior.startingPoint.y),
                CartesianPoint(x: edge09Exterior.endingPoint.x, y: endingEdge.y),
            ]
        )
    }
    
    private var edge09: EdgedCrescent {
        let interiorArc = Arc(radius: firstRingInteriorRadius, arc: .arc09)
        let exteriorArc = Arc(radius: secondRingExtendedExteriorRadius, arc: .arc09)
        let point = try! CartesianPoint.make(for: secondRingExtendedExteriorRadius, degree: DPad.Arc.arc09.start)
        
        return EdgedCrescent(
            interiorArc: interiorArc,
            edgePoints: [
                CartesianPoint(x: exteriorArc.endingPoint.x, y: point.y),
                exteriorArc.endingPoint,
            ]
        )
    }
    
    private var edge13: EdgedCrescent {
        let interiorArc = Arc(radius: thirdRingInteriorRadius, arc: .arc13)
        let exteriorArc = Arc(radius: thirdRingExteriorRadius, arc: .arc13)
        let point = try! CartesianPoint.make(for: thirdRingExteriorRadius, degree: DPad.Arc.arc12.start)
        
        return EdgedCrescent(
            interiorArc: interiorArc,
            edgePoints: [
                CartesianPoint(x: point.x, y: exteriorArc.endingPoint.y),
                exteriorArc.endingPoint,
            ]
        )
    }
    
    private var edge15: EdgedCrescent {
        let interiorArc = Arc(radius: secondRingInteriorRadius, arc: .arc15)
        let exteriorArc = Arc(radius: secondRingEdgeExteriorRadius, arc: .arc15)
        
        return EdgedCrescent(
            interiorArc: interiorArc,
            edgePoints: [
                exteriorArc.startingPoint,
                exteriorArc.endingPoint,
            ]
        )
    }
    
    private var top00: Obround {
        let size = CGSize(
            width: Obround.intrinsicSize.width * scale,
            height: Obround.intrinsicSize.height * scale
        )
        let x = radius - (size.width / 1.25)
        let y = edge15.cartesianFrame.origin.y
        
        return Obround(
            size: Size(size),
            at: CartesianPoint(x: x, y: y)
        )
    }
}

#Preview {
    GeometryReader { geometry in
        DPadView01(size: geometry.size)
    }
    .background(.black)
}
#endif
