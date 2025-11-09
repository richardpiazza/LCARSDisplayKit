import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

/// An example cluster control set that extends a 'DPadCluster'.
public struct DPadClusterExtendedView: View {
    
    private struct ShapedEdge<T: CartesianShape> {
        var title: String = ""
        var shape: T
        var color: Color
    }
    
    public static let intrinsicSize: CGSize = CGSize(width: 760.0, height: 755.0)
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
        
        cartesianOffset = CartesianFrame.Offset(x: 0, y: scaledContentSize.height * 0.068)
        
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
            
            crescents(
                interiorRadius: firstRingInteriorRadius,
                exteriorRadius: firstRingExteriorRadius,
                extendedExteriorRadius: firstRingExteriorRadius,
                in: plane,
                with: cartesianOffset,
                rings: [
                    DPadCrescent(title: "IR01", arc: .arc01, to: .arc04, color: appearance.secondary.light),
                    DPadCrescent(title: "IR05", arc: .arc05, color: appearance.primary.light),
                    DPadCrescent(title: "IR10", arc: .arc10, color: appearance.primary.light),
                    DPadCrescent(title: "IR11", arc: .arc11, color: appearance.secondary.light),
                    DPadCrescent(title: "IR12", arc: .arc12, color: appearance.primary.dark),
                    DPadCrescent(title: "IR13", arc: .arc13, color: appearance.secondary.dark),
                    DPadCrescent(title: "IR14", arc: .arc14, color: appearance.secondary.light),
                    DPadCrescent(title: "IR15", arc: .arc15, color: appearance.primary.light),
                    DPadCrescent(title: "IR16", arc: .arc16, to: .arc19, color: appearance.secondary.light),
                    DPadCrescent(title: "IR20", arc: .arc20, color: appearance.primary.light),
                ]
            )
            
            crescents(
                interiorRadius: secondRingInteriorRadius,
                exteriorRadius: secondRingExteriorRadius,
                extendedExteriorRadius: secondRingExtendedExteriorRadius,
                in: plane,
                with: cartesianOffset,
                rings: [
                    DPadCrescent(title: "OR01", arc: .arc01, to: .arc04, color: appearance.primary.dark),
                    DPadCrescent(title: "OR05", arc: .arc05, color: appearance.primary.dark),
                    DPadCrescent(title: "OR10", arc: .arc10, color: appearance.primary.dark),
                    DPadCrescent(title: "OR11", arc: .arc11, color: appearance.secondary.dark),
                    DPadCrescent(title: "OR12", arc: .arc12, color: appearance.secondary.light),
                    DPadCrescent(title: "OR13", arc: .arc13, color: appearance.primary.light),
                    DPadCrescent(title: "OR14", arc: .arc14, color: appearance.primary.dark),
                    DPadCrescent(title: "OR16", arc: .arc16, color: appearance.secondary.dark),
                    DPadCrescent(title: "OR17", arc: .arc17, color: appearance.primary.light),
                    DPadCrescent(title: "OR18", arc: .arc18, color: appearance.primary.dark, extended: true),
                    DPadCrescent(title: "OR19", arc: .arc19, color: appearance.secondary.dark, extended: true),
                    DPadCrescent(title: "OR20", arc: .arc20, color: appearance.secondary.light),
                ]
            )
            
            edges(
                in: plane,
                with: cartesianOffset,
                edges: [
                    ShapedEdge(title: "-", shape: edge06, color: appearance.secondary.light),
                    ShapedEdge(title: "MODE SELECT", shape: edge07, color: appearance.primary.light),
                    ShapedEdge(title: "+", shape: edge09, color: appearance.secondary.dark),
                    ShapedEdge(title: "E13", shape: edge13, color: appearance.primary.dark),
                    ShapedEdge(title: "E15", shape: edge15, color: appearance.secondary.light),
                ],
                obrounds: [
                    ShapedEdge(title: "T00", shape: top00, color: appearance.secondary.light),
                    ShapedEdge(title: "CALIBRATE", shape: top01, color: appearance.secondary.light),
                    ShapedEdge(title: "T03", shape: top03, color: appearance.secondary.dark),
                    ShapedEdge(title: "T02", shape: top02, color: appearance.primary.light),
                    ShapedEdge(title: "T04", shape: top04, color: appearance.primary.dark),
                    ShapedEdge(title: "T05", shape: top05, color: appearance.primary.dark),
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
                    with: offset
                )
                .foregroundStyle(ring.color)
            }
        }
    }
    
    private func edges(
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset,
        edges: [ShapedEdge<EdgedCrescent>] = [],
        obrounds: [ShapedEdge<Obround>] = []
    ) -> some View {
        ZStack {
            ForEach(edges, id: \.title) { edge in
                EdgedCrescentView(
                    edge.title,
                    shape: edge.shape,
                    in: plane,
                    with: offset
                )
                .foregroundStyle(edge.color)
            }
            
            ForEach(obrounds, id: \.title) { obround in
                ObroundView(
                    obround.title,
                    shape: obround.shape,
                    in: plane,
                    with: offset
                )
                .foregroundStyle(obround.color)
            }
        }
    }
    
    private var edge06: EdgedCrescent {
        let interiorArc = Arc(radius: firstRingInteriorRadius, arc: .arc06)
        let exteriorArc = Arc(radius: secondRingExteriorRadius, arc: .arc06)
        let point = try! CartesianPoint.make(for: secondRingExteriorRadius, degree: DPad.Ring.arc06.end)
        
        return EdgedCrescent(
            interiorArc: interiorArc,
            edgePoints: [
                CartesianPoint(x: exteriorArc.startingPoint.x, y: exteriorArc.startingPoint.y),
                CartesianPoint(x: point.x, y: exteriorArc.startingPoint.y),
            ]
        )
    }
    
    private var edge07: EdgedCrescent {
        let interiorArc = Arc(radius: firstRingInteriorRadius, startingDegree: DPad.Ring.arc07.start, endingDegree: DPad.Ring.arc08.end)
        
        let edge06Exterior = Arc(radius: secondRingExteriorRadius, arc: .arc06)
        let edge09Exterior = Arc(radius: secondRingExtendedExteriorRadius, arc: .arc09)
        let startingEdge = try! CartesianPoint.make(for: secondRingExteriorRadius, degree: DPad.Ring.arc07.start)
        let endingEdge = try! CartesianPoint.make(for: secondRingExtendedExteriorRadius, degree: DPad.Ring.arc08.end)
        
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
        let point = try! CartesianPoint.make(for: secondRingExtendedExteriorRadius, degree: DPad.Ring.arc09.start)
        
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
        
        let arc = Arc(radius: secondRingInteriorRadius, arc: .arc18)
        let x = arc.startingPoint.x + (arc.endingPoint.x - arc.startingPoint.x) / 2.0
        let y = edge15.cartesianFrame.origin.y
        
        return Obround(
            size: Size(size),
            at: CartesianPoint(x: x, y: y)
        )
    }
    
    private var top01: Obround {
        let height = Obround.intrinsicSize.height * scale
        let edge13 = self.edge13
        let frame = edge13.cartesianFrame
        let width = edge13.edgePoints[1].x - edge13.edgePoints[0].x
        
        return Obround(
            size: Size(
                width: width,
                height: height
            ),
            at: CartesianPoint(
                x: frame.origin.x,
                y: frame.origin.y + spacing + height
            ),
            roundLeading: false,
            roundTrailing: false
        )
    }
    
    private var top03: Obround {
        let height = Obround.intrinsicSize.height * scale
        let edge15 = self.edge15
        let frame = edge15.cartesianFrame
        
        return Obround(
            size: Size(
                width: frame.width,
                height: height
            ),
            at: CartesianPoint(
                x: frame.x,
                y: frame.y + spacing + height
            ),
            roundLeading: false,
            roundTrailing: false
        )
    }
    
    private var top02: Obround {
        let width = Obround.intrinsicSize.width * scale * 0.55
        let top03 = self.top03
        let frame = top03.cartesianFrame
        
        return Obround(
            size: Size(
                width: width,
                height: frame.height
            ),
            at: CartesianPoint(
                x: frame.minX - spacing - width,
                y: frame.minY
            ),
            roundTrailing: false
        )
    }
    
    private var top04: Obround {
        let width = Obround.intrinsicSize.width * scale * 0.55
        let top03 = self.top03
        let frame = top03.cartesianFrame
        
        return Obround(
            size: Size(
                width: width,
                height: frame.height
            ),
            at: CartesianPoint(
                x: frame.minX + frame.width + spacing,
                y: frame.minY
            ),
            roundLeading: false
        )
    }
    
    private var top05: Obround {
        let top00 = self.top00
        let frame = top00.cartesianFrame
        
        return Obround(
            size: top00.size,
            at: CartesianPoint(
                x: frame.minX,
                y: frame.maxY + spacing
            )
        )
    }
}

#Preview {
    GeometryReader { geometry in
//        DPadClusterExtendedView()
        DPadClusterExtendedView(size: geometry.size)
            .border(.red, width: 2)
    }
    .background(.black)
}
#endif
