import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

/// An example cluster control set that extends a 'DPad'.
///
/// This particular layout comes from the small tactical station behind the command
/// chairs on the USS Voyager.
public struct DPadClusterCompactView: View {

    public static let intrinsicSize: CGSize = CGSize(width: 715.0, height: 520.0)
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
    var action: (CartesianShapeIdentifier) -> Void
    
    var firstRingInteriorRadius: CGFloat
    var firstRingExteriorRadius: CGFloat
    var secondRingInteriorRadius: CGFloat
    var secondRingExteriorRadius: CGFloat
    var secondRingEdgeExteriorRadius: CGFloat
    var secondRingExtendedExteriorRadius: CGFloat
    var thirdRingInteriorRadius: CGFloat
    var thirdRingExteriorRadius: CGFloat
    
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
        
        cartesianOffset = CartesianFrame.Offset(
            x: -(scaledContentSize.width * 0.0366),
            y: scaledContentSize.height * 0.14
        )
        self.action = action
        
        firstRingInteriorRadius = ((DPadView.intrinsicSize.width / 2.0) * scale) + spacing
        firstRingExteriorRadius = firstRingInteriorRadius + (80.0 * scale)
        secondRingInteriorRadius = firstRingExteriorRadius + spacing
        secondRingExteriorRadius = secondRingInteriorRadius + (50.0 * scale)
        secondRingEdgeExteriorRadius = secondRingExteriorRadius + (62.0 * scale)
        secondRingExtendedExteriorRadius = secondRingInteriorRadius + (110.0 * scale)
        thirdRingInteriorRadius = secondRingExteriorRadius + spacing
        thirdRingExteriorRadius = thirdRingInteriorRadius + (45.0 * scale)
    }
    
    public var body: some View {
        ZStack {
            DPadView(
                scale: scale,
                action: action
            )
            .frame(
                width: DPadView.intrinsicSize.width * scale,
                height: DPadView.intrinsicSize.height * scale
            )
            .position(
                x: plane.midX + cartesianOffset.x,
                y: plane.midY + cartesianOffset.y
            )
            
            crescents(
                interiorRadius: firstRingInteriorRadius,
                exteriorRadius: firstRingExteriorRadius,
                extendedExteriorRadius: firstRingExteriorRadius,
                in: plane,
                with: cartesianOffset,
                shapes: [
                    ShapedCrescent(id: .innerRing08, title: "IR08", arc: .arc08, appearance: .primaryDark),
                    ShapedCrescent(id: .innerRing09, title: "IR09", arc: .arc09, appearance: .secondaryLight),
                    ShapedCrescent(id: .innerRing10, title: "IR10", arc: .arc10, appearance: .secondaryDark),
                    ShapedCrescent(id: .innerRing11, title: "IR11", arc: .arc11, appearance: .secondaryLight),
                    ShapedCrescent(id: .innerRing13, title: "IR13", arc: .arc13, appearance: .secondaryDark),
                ]
            )
            
            crescents(
                interiorRadius: secondRingInteriorRadius,
                exteriorRadius: secondRingExteriorRadius,
                extendedExteriorRadius: secondRingExtendedExteriorRadius,
                in: plane,
                with: cartesianOffset,
                shapes: [
                    ShapedCrescent(id: .outerRing09, title: "OR09", arc: .arc09, appearance: .secondaryDark),
                    ShapedCrescent(id: .outerRing10, title: "OR10", arc: .arc10, appearance: .secondaryLight),
                    ShapedCrescent(id: .outerRing11, title: "OR11", arc: .arc11, appearance: .primaryDark),
                    ShapedCrescent(id: .outerRing12, title: "OR12", arc: .arc12, appearance: .secondaryDark),
                    ShapedCrescent(id: .outerRing13, title: "OR13", arc: .arc13, appearance: .secondaryLight),
                    ShapedCrescent(id: .outerRing18, title: "OR18", arc: .arc18, appearance: .primaryDark, extended: true),
                ]
            )
            
            edges(
                in: plane,
                with: cartesianOffset,
                crescents: [
                    ShapedEdge(title: "IN01", shape: innerRing01, appearance: .secondaryDark),
                    ShapedEdge(title: "IN14", shape: innerRing14, appearance: .secondaryLight),
                    ShapedEdge(title: "IN15", shape: innerRing15, appearance: .secondaryDark),
                    ShapedEdge(title: "IN16", shape: innerRing16, appearance: .secondaryLight),
                    ShapedEdge(title: "IN17", shape: innerRing17, appearance: .secondaryLight),
                    ShapedEdge(title: "IN20", shape: innerRing20, appearance: .quaternaryLight),
                    ShapedEdge(title: "OR19", shape: outerRing19, appearance: .secondaryLight),
                    ShapedEdge(title: "OR20", shape: outerRing20, appearance: .secondaryDark),
                ],
                edges: [
                    ShapedEdge(title: "E13", shape: edge13, appearance: .primaryDark),
                    ShapedEdge(title: "E15", shape: edge15, appearance: .secondaryLight),
                ],
                obrounds: [
                    ShapedEdge(title: "T00", shape: top00, appearance: .secondaryDark),
                ]
            )
        }
        .frame(width: plane.size.width, height: plane.size.height)
    }
    
    private func crescents(
        interiorRadius: CGFloat,
        exteriorRadius: CGFloat,
        extendedExteriorRadius: CGFloat,
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset,
        shapes: [ShapedCrescent] = []
    ) -> some View {
        ZStack {
            ForEach(shapes, id: \.self) { shape in
                CrescentView(
                    shape.title,
                    shape: shape.shape(
                        interiorRadius: interiorRadius,
                        exteriorRadius: exteriorRadius,
                        extendedRadius: extendedExteriorRadius
                    ),
                    in: plane,
                    with: offset,
                    action: action
                )
                .foregroundStyle(theme.color(for: shape.appearance))
            }
        }
    }

    private func edges(
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset,
        crescents: [ShapedEdge<Crescent>] = [],
        edges: [ShapedEdge<EdgedCrescent>] = [],
        obrounds: [ShapedEdge<Obround>] = []
    ) -> some View {
        ZStack {
            ForEach(crescents, id: \.title) { crescent in
                CrescentView(
                    crescent.title,
                    shape: crescent.shape,
                    in: plane,
                    with: offset,
                    action: action
                )
                .foregroundStyle(theme.color(for: crescent.appearance))
            }
            
            ForEach(edges, id: \.title) { edge in
                EdgedCrescentView(
                    edge.title,
                    shape: edge.shape,
                    in: plane,
                    with: offset,
                    action: action
                )
                .foregroundStyle(theme.color(for: edge.appearance))
            }
            
            ForEach(obrounds, id: \.title) { obround in
                ObroundView(
                    obround.title,
                    shape: obround.shape,
                    in: plane,
                    with: offset,
                    action: action
                )
                .foregroundStyle(theme.color(for: obround.appearance))
            }
        }
    }

    private var innerRing01: Crescent {
        let ir20 = innerRing20
        let twoAndOneQuarter = Curve.arc02.start + Curve.arc02.quarter
        let inner = Arc(radius: firstRingInteriorRadius, startingDegree: ir20.interiorArc.endingDegree + 1.5, endingDegree: twoAndOneQuarter)
        let outer = Arc(radius: firstRingExteriorRadius, startingDegree: ir20.exteriorArc.endingDegree + 1.0, endingDegree: twoAndOneQuarter)
        return Crescent(
            identifier: .innerRing01,
            interiorArc: inner,
            exteriorArc: outer
        )
    }
    
    private var innerRing14: Crescent {
        let ir15 = innerRing15
        let inner = Arc(radius: firstRingInteriorRadius, startingDegree: Curve.arc14.start, endingDegree: ir15.interiorArc.startingDegree - 1.5)
        let outer = Arc(radius: firstRingExteriorRadius, startingDegree: Curve.arc14.start, endingDegree: ir15.exteriorArc.startingDegree - 1.0)
        return Crescent(
            identifier: .innerRing14,
            interiorArc: inner,
            exteriorArc: outer
        )
    }
    
    private var innerRing15: Crescent {
        let arc = Arc(
            radius: firstRingInteriorRadius - spacing,
            startingDegree: Direction.Cardinal.up.start,
            endingDegree: Direction.Cardinal.up.end
        )
        let startPoint = CartesianPoint(x: arc.startingPoint.x, y: arc.startingPoint.y + spacing)
        let startDegree = try! Degree.make(for: startPoint)
        let endPoint = CartesianPoint(x: arc.endingPoint.x, y: arc.endingPoint.y + spacing)
        let endDegree = try! Degree.make(for: endPoint)
        let shift = firstRingExteriorRadius - firstRingInteriorRadius
        let exteriorStart = try! Degree.make(for: startPoint.with(y: startPoint.y + shift))
        let exteriorEnd = try! Degree.make(for: endPoint.with(y: endPoint.y + shift))
        
        return Crescent(
            identifier: .innerRing15,
            interiorArc: Arc(radius: firstRingInteriorRadius, startingDegree: startDegree, endingDegree: endDegree),
            exteriorArc: Arc(radius: firstRingExteriorRadius, startingDegree: exteriorStart, endingDegree: exteriorEnd),
        )
    }
    
    private var innerRing16: Crescent {
        let seventeenAndOneQuarter = Curve.arc17.start + Curve.arc17.quarter
        let ir15 = innerRing15
        let inner = Arc(radius: firstRingInteriorRadius, startingDegree: ir15.interiorArc.endingDegree + 1.5, endingDegree: seventeenAndOneQuarter)
        let outer = Arc(radius: firstRingExteriorRadius, startingDegree: ir15.exteriorArc.endingDegree + 1.0, endingDegree: seventeenAndOneQuarter)
        return Crescent(
            identifier: .innerRing16,
            interiorArc: inner,
            exteriorArc: outer
        )
    }
    
    private var innerRing17: Crescent {
        let seventeenAndOneQuarter = Curve.arc17.start + Curve.arc17.quarter
        let ir20 = innerRing20
        let inner = Arc(radius: firstRingInteriorRadius, startingDegree: seventeenAndOneQuarter + 1.0, endingDegree: ir20.interiorArc.startingDegree - 1.5)
        let outer = Arc(radius: firstRingExteriorRadius, startingDegree: seventeenAndOneQuarter + 1.0, endingDegree: ir20.exteriorArc.startingDegree - 1.0)
        return Crescent(
            identifier: .innerRing17,
            interiorArc: inner,
            exteriorArc: outer
        )
    }
    
    private var innerRing20: Crescent {
        let arc = Arc(
            radius: firstRingInteriorRadius - spacing,
            startingDegree: Direction.Cardinal.right.start,
            endingDegree: Direction.Cardinal.right.end
        )
        let startPoint = CartesianPoint(x: arc.startingPoint.x + spacing, y: arc.startingPoint.y)
        let startDegree = try! Degree.make(for: startPoint)
        let endPoint = CartesianPoint(x: arc.endingPoint.x + spacing, y: arc.endingPoint.y)
        let endDegree = try! Degree.make(for: endPoint)
        let shift = firstRingExteriorRadius - firstRingInteriorRadius
        let exteriorStart = try! Degree.make(for: startPoint.with(x: startPoint.x + shift))
        let exteriorEnd = try! Degree.make(for: endPoint.with(x: endPoint.x + shift))
        
        return Crescent(
            identifier: .innerRing20,
            interiorArc: Arc(radius: firstRingInteriorRadius, startingDegree: startDegree, endingDegree: endDegree),
            exteriorArc: Arc(radius: firstRingExteriorRadius, startingDegree: exteriorStart, endingDegree: exteriorEnd),
        )
    }
    
    private var outerRing19: Crescent {
        let or20 = outerRing20
        let inner = Arc(radius: secondRingInteriorRadius, startingDegree: Curve.arc19.start, endingDegree: or20.interiorArc.startingDegree - 1.0)
        let outer = Arc(radius: secondRingExtendedExteriorRadius, startingDegree: Curve.arc19.start, endingDegree: or20.exteriorArc.startingDegree - 0.75)
        return Crescent(
            identifier: .outerRing19,
            interiorArc: inner,
            exteriorArc: outer
        )
    }
    
    private var outerRing20: Crescent {
        let ir20 = innerRing20
        let innerStart = ir20.exteriorArc.startingPoint.with(x: ir20.exteriorArc.startingPoint.x + spacing)
        let innerStartDegree = try! Degree.make(for: innerStart)
        let innerEnd = ir20.exteriorArc.endingPoint.with(x: ir20.exteriorArc.endingPoint.x + spacing)
        let innerEndDegree = try! Degree.make(for: innerEnd)
        let shift = secondRingExtendedExteriorRadius - secondRingInteriorRadius
        let outerStart = innerStart.with(x: innerStart.x + shift)
        let outerStartDegree = try! Degree.make(for: outerStart)
        let outerEnd = innerEnd.with(x: innerEnd.x + shift)
        let outerEndDegree = try! Degree.make(for: outerEnd)
        
        return Crescent(
            identifier: .outerRing20,
            interiorArc: Arc(radius: secondRingInteriorRadius, startingDegree: innerStartDegree, endingDegree: innerEndDegree),
            exteriorArc: Arc(radius: secondRingExtendedExteriorRadius, startingDegree: outerStartDegree, endingDegree: outerEndDegree)
        )
    }
    
    private var edge13: EdgedCrescent {
        let interiorArc = Curve.arc13.arc(radius: thirdRingInteriorRadius)
        let exteriorArc = Curve.arc13.arc(radius: thirdRingExteriorRadius)
        let point = try! CartesianPoint.make(for: thirdRingExteriorRadius, degree: Curve.arc12.start)
        
        return EdgedCrescent(
            identifier: .edge13,
            interiorArc: interiorArc,
            edgePoints: [
                CartesianPoint(x: point.x, y: exteriorArc.endingPoint.y),
                exteriorArc.endingPoint,
            ]
        )
    }
    
    private var edge15: EdgedCrescent {
        let in15 = innerRing15
        let startPoint = CartesianPoint(
            x: in15.exteriorArc.startingPoint.x,
            y: in15.exteriorArc.startingPoint.y + spacing
        )
        let startDegree = try! Degree.make(for: startPoint)
        let endPoint = CartesianPoint(
            x: in15.exteriorArc.endingPoint.x,
            y: in15.exteriorArc.endingPoint.y + spacing
        )
        let endDegree = try! Degree.make(for: endPoint)
        
        let interiorArc = Arc(radius: secondRingInteriorRadius, startingDegree: startDegree, endingDegree: endDegree)
        let y = edge13.cartesianFrame.origin.y
        
        return EdgedCrescent(
            identifier: .edge15,
            interiorArc: interiorArc,
            edgePoints: [
                CartesianPoint(x: interiorArc.startingPoint.x, y: y),
                CartesianPoint(x: interiorArc.endingPoint.x, y: y),
            ]
        )
    }
    
    private var top00: Obround {
        let size = CGSize(
            width: Obround.intrinsicSize.width * scale,
            height: Obround.intrinsicSize.height * scale
        )
        
        let arc = Curve.arc17.arc(radius: firstRingInteriorRadius)
        let x = arc.startingPoint.x + (arc.endingPoint.x - arc.startingPoint.x) / 2.0
        let y = edge13.cartesianFrame.origin.y
        
        return Obround(
            identifier: .top00,
            size: size,
            at: CartesianPoint(x: x, y: y),
            roundLeading: false
        )
    }
}

#Preview {
    GeometryReader { geometry in
//        DPadClusterCompactView()
        DPadClusterCompactView(size: geometry.size)
            .border(.red, width: 2)
            .environment(\.theme, ThemeCompact2370s())
    }
    .background(.black)
}
#endif
