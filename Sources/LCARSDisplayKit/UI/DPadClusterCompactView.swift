import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

/// An example cluster control set that extends a 'DPad'.
///
/// This particular layout comes from small tactical station behind the command
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
    
    @Environment(\.appearance) private var appearance
    
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
                cruxColor: appearance.secondary.light,
                sectorColor: appearance.inactive,
                upGradientStop: 0.6,
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
                rings: [
                    DPadCrescent(title: "IR08", arc: .arc08, color: appearance.primary.dark),
                    DPadCrescent(title: "IR09", arc: .arc09, color: appearance.secondary.light),
                    DPadCrescent(title: "IR10", arc: .arc10, color: appearance.secondary.dark),
                    DPadCrescent(title: "IR11", arc: .arc11, color: appearance.secondary.light),
                    DPadCrescent(title: "IR13", arc: .arc13, color: appearance.secondary.dark),
                ]
            )
            
            crescents(
                interiorRadius: secondRingInteriorRadius,
                exteriorRadius: secondRingExteriorRadius,
                extendedExteriorRadius: secondRingExtendedExteriorRadius,
                in: plane,
                with: cartesianOffset,
                rings: [
                    DPadCrescent(title: "OR09", arc: .arc09, color: appearance.secondary.dark),
                    DPadCrescent(title: "OR10", arc: .arc10, color: appearance.secondary.light),
                    DPadCrescent(title: "OR11", arc: .arc11, color: appearance.primary.dark),
                    DPadCrescent(title: "OR12", arc: .arc12, color: appearance.secondary.dark),
                    DPadCrescent(title: "OR13", arc: .arc13, color: appearance.secondary.light),
                    DPadCrescent(title: "OR18", arc: .arc18, color: appearance.primary.dark, extended: true),
                ]
            )
            
            edges(
                in: plane,
                with: cartesianOffset,
                crescents: [
                    ShapedEdge(title: "IN01", shape: innerRing01, color: appearance.secondary.dark),
                    ShapedEdge(title: "IN14", shape: innerRing14, color: appearance.secondary.light),
                    ShapedEdge(title: "IN15", shape: innerRing15, color: appearance.secondary.dark),
                    ShapedEdge(title: "IN16", shape: innerRing16, color: appearance.secondary.light),
                    ShapedEdge(title: "IN17", shape: innerRing17, color: appearance.secondary.light),
                    ShapedEdge(title: "IN20", shape: innerRing20, color: appearance.inactive),
                    ShapedEdge(title: "OR19", shape: outerRing19, color: appearance.secondary.light),
                    ShapedEdge(title: "OR20", shape: outerRing20, color: appearance.secondary.dark),
                ],
                edges: [
                    ShapedEdge(title: "E13", shape: edge13, color: appearance.primary.dark),
                    ShapedEdge(title: "E15", shape: edge15, color: appearance.secondary.light),
                ],
                obrounds: [
                    ShapedEdge(title: "T00", shape: top00, color: appearance.secondary.dark),
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
        rings: [DPadCrescent] = []
    ) -> some View {
        ZStack {
            ForEach(rings, id: \.self) { ring in
                CrescentView(
                    ring.title,
                    shape: ring.shape(
                        interiorRadius: interiorRadius,
                        exteriorRadius: exteriorRadius,
                        extendedRadius: extendedExteriorRadius
                    ),
                    in: plane,
                    with: offset,
                    action: action
                )
                .foregroundStyle(ring.color)
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
                .foregroundStyle(crescent.color)
            }
            
            ForEach(edges, id: \.title) { edge in
                EdgedCrescentView(
                    edge.title,
                    shape: edge.shape,
                    in: plane,
                    with: offset,
                    action: action
                )
                .foregroundStyle(edge.color)
            }
            
            ForEach(obrounds, id: \.title) { obround in
                ObroundView(
                    obround.title,
                    shape: obround.shape,
                    in: plane,
                    with: offset,
                    action: action
                )
                .foregroundStyle(obround.color)
            }
        }
    }

    private var innerRing01: Crescent {
        let ir20 = innerRing20
        let twoAndOneQuarter = DPad.Ring.arc02.start + (DPad.Ring.arc02.mid / 2.0)
        let inner = Arc(radius: firstRingInteriorRadius, startingDegree: ir20.interiorArc.endingDegree + 1.5, endingDegree: twoAndOneQuarter)
        let outer = Arc(radius: firstRingExteriorRadius, startingDegree: ir20.exteriorArc.endingDegree + 1.0, endingDegree: twoAndOneQuarter)
        return Crescent(
            interiorArc: inner,
            exteriorArc: outer
        )
    }
    
    private var innerRing14: Crescent {
        let ir15 = innerRing15
        let inner = Arc(radius: firstRingInteriorRadius, startingDegree: DPad.Ring.arc14.start, endingDegree: ir15.interiorArc.startingDegree - 1.5)
        let outer = Arc(radius: firstRingExteriorRadius, startingDegree: DPad.Ring.arc14.start, endingDegree: ir15.exteriorArc.startingDegree - 1.0)
        return Crescent(
            interiorArc: inner,
            exteriorArc: outer
        )
    }
    
    private var innerRing15: Crescent {
        let arc = Arc(radius: firstRingInteriorRadius - spacing, cardinalDirection: .up)
        let startPoint = CartesianPoint(x: arc.startingPoint.x, y: arc.startingPoint.y + spacing)
        let startDegree = try! Degree.make(for: startPoint)
        let endPoint = CartesianPoint(x: arc.endingPoint.x, y: arc.endingPoint.y + spacing)
        let endDegree = try! Degree.make(for: endPoint)
        let shift = firstRingExteriorRadius - firstRingInteriorRadius
        let exteriorStart = try! Degree.make(for: startPoint.with(y: startPoint.y + shift))
        let exteriorEnd = try! Degree.make(for: endPoint.with(y: endPoint.y + shift))
        
        return Crescent(
            interiorArc: Arc(radius: firstRingInteriorRadius, startingDegree: startDegree, endingDegree: endDegree),
            exteriorArc: Arc(radius: firstRingExteriorRadius, startingDegree: exteriorStart, endingDegree: exteriorEnd),
        )
    }
    
    private var innerRing16: Crescent {
        let seventeenAndOneQuarter = DPad.Ring.arc17.start + (DPad.Ring.arc17.mid / 2.0)
        let ir15 = innerRing15
        let inner = Arc(radius: firstRingInteriorRadius, startingDegree: ir15.interiorArc.endingDegree + 1.5, endingDegree: seventeenAndOneQuarter)
        let outer = Arc(radius: firstRingExteriorRadius, startingDegree: ir15.exteriorArc.endingDegree + 1.0, endingDegree: seventeenAndOneQuarter)
        return Crescent(
            interiorArc: inner,
            exteriorArc: outer
        )
    }
    
    private var innerRing17: Crescent {
        let seventeenAndOneQuarter = DPad.Ring.arc17.start + (DPad.Ring.arc17.mid / 2.0)
        let ir20 = innerRing20
        let inner = Arc(radius: firstRingInteriorRadius, startingDegree: seventeenAndOneQuarter + 1.0, endingDegree: ir20.interiorArc.startingDegree - 1.5)
        let outer = Arc(radius: firstRingExteriorRadius, startingDegree: seventeenAndOneQuarter + 1.0, endingDegree: ir20.exteriorArc.startingDegree - 1.0)
        return Crescent(
            interiorArc: inner,
            exteriorArc: outer
        )
    }
    
    private var innerRing20: Crescent {
        let arc = Arc(radius: firstRingInteriorRadius - spacing, cardinalDirection: .right)
        let startPoint = CartesianPoint(x: arc.startingPoint.x + spacing, y: arc.startingPoint.y)
        let startDegree = try! Degree.make(for: startPoint)
        let endPoint = CartesianPoint(x: arc.endingPoint.x + spacing, y: arc.endingPoint.y)
        let endDegree = try! Degree.make(for: endPoint)
        let shift = firstRingExteriorRadius - firstRingInteriorRadius
        let exteriorStart = try! Degree.make(for: startPoint.with(x: startPoint.x + shift))
        let exteriorEnd = try! Degree.make(for: endPoint.with(x: endPoint.x + shift))
        
        return Crescent(
            interiorArc: Arc(radius: firstRingInteriorRadius, startingDegree: startDegree, endingDegree: endDegree),
            exteriorArc: Arc(radius: firstRingExteriorRadius, startingDegree: exteriorStart, endingDegree: exteriorEnd),
        )
    }
    
    private var outerRing19: Crescent {
        let or20 = outerRing20
        let inner = Arc(radius: secondRingInteriorRadius, startingDegree: DPad.Ring.arc19.start, endingDegree: or20.interiorArc.startingDegree - 1.0)
        let outer = Arc(radius: secondRingExtendedExteriorRadius, startingDegree: DPad.Ring.arc19.start, endingDegree: or20.exteriorArc.startingDegree - 0.75)
        return Crescent(
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
            interiorArc: Arc(radius: secondRingInteriorRadius, startingDegree: innerStartDegree, endingDegree: innerEndDegree),
            exteriorArc: Arc(radius: secondRingExtendedExteriorRadius, startingDegree: outerStartDegree, endingDegree: outerEndDegree)
        )
    }
    
    private var edge13: EdgedCrescent {
        let interiorArc = Arc(radius: thirdRingInteriorRadius, arc: .arc13)
        let exteriorArc = Arc(radius: thirdRingExteriorRadius, arc: .arc13)
        let point = try! CartesianPoint.make(for: thirdRingExteriorRadius, degree: DPad.Ring.arc12.start)
        
        return EdgedCrescent(
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
        
        let arc = Arc(radius: firstRingInteriorRadius, arc: .arc17)
        let x = arc.startingPoint.x + (arc.endingPoint.x - arc.startingPoint.x) / 2.0
        let y = edge13.cartesianFrame.origin.y
        
        return Obround(
            size: Size(size),
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
    }
    .background(.black)
}
#endif
