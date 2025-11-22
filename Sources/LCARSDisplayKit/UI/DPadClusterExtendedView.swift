import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

/// An example cluster control set that extends a 'DPadCluster'.
public struct DPadClusterExtendedView: View {

    public static let intrinsicSize: CGSize = CGSize(width: 760.0, height: 755.0)
    public static let offsetModifier: CartesianFrame.Offset = Point(x: 0, y: 0.068)

    var values: DPadValues
    var radii: DPadValues.Radii
    var action: (CartesianShapeIdentifier) -> Void

    @Environment(\.theme) private var theme

    public init(
        size: CGSize = Self.intrinsicSize,
        action: @escaping (CartesianShapeIdentifier) -> Void = { _ in }
    ) {
        values = DPadValues(
            size: size,
            intrinsicSize: Self.intrinsicSize,
            offsetModifier: Self.offsetModifier
        )
        radii = values.radii(layout: .standard)
        self.action = action
    }

    public var body: some View {
        ZStack {
            DPadView(
                scale: values.scale,
                action: action
            )
            .frame(
                width: DPadView.intrinsicSize.width * values.scale,
                height: DPadView.intrinsicSize.height * values.scale
            )
            .position(
                x: values.plane.midX + values.cartesianOffset.x,
                y: values.plane.midY + values.cartesianOffset.y
            )

            crescents(
                interiorRadius: radii.firstRingInteriorRadius,
                exteriorRadius: radii.firstRingExteriorRadius,
                extendedExteriorRadius: radii.firstRingExteriorRadius,
                in: values.plane,
                with: values.cartesianOffset,
                shapes: [
                    ShapedCrescent(id: .innerRing01, title: "IR01", arc: .arc01, to: .arc04, appearance: .secondaryLight),
                    ShapedCrescent(id: .innerRing05, title: "IR05", arc: .arc05, appearance: .primaryLight),
                    ShapedCrescent(id: .innerRing10, title: "IR10", arc: .arc10, appearance: .primaryLight),
                    ShapedCrescent(id: .innerRing11, title: "IR11", arc: .arc11, appearance: .secondaryLight),
                    ShapedCrescent(id: .innerRing12, title: "IR12", arc: .arc12, appearance: .primaryDark),
                    ShapedCrescent(id: .innerRing13, title: "IR13", arc: .arc13, appearance: .secondaryDark),
                    ShapedCrescent(id: .innerRing14, title: "IR14", arc: .arc14, appearance: .secondaryLight),
                    ShapedCrescent(id: .innerRing15, title: "IR15", arc: .arc15, appearance: .primaryLight),
                    ShapedCrescent(id: .innerRing16, title: "IR16", arc: .arc16, to: .arc19, appearance: .secondaryLight),
                    ShapedCrescent(id: .innerRing20, title: "IR20", arc: .arc20, appearance: .primaryLight),
                ]
            )

            crescents(
                interiorRadius: radii.secondRingInteriorRadius,
                exteriorRadius: radii.secondRingExteriorRadius,
                extendedExteriorRadius: radii.secondRingExtendedExteriorRadius,
                in: values.plane,
                with: values.cartesianOffset,
                shapes: [
                    ShapedCrescent(id: .outerRing01, title: "OR01", arc: .arc01, to: .arc04, appearance: .primaryDark),
                    ShapedCrescent(id: .outerRing05, title: "OR05", arc: .arc05, appearance: .primaryDark),
                    ShapedCrescent(id: .outerRing10, title: "OR10", arc: .arc10, appearance: .primaryDark),
                    ShapedCrescent(id: .outerRing11, title: "OR11", arc: .arc11, appearance: .secondaryDark),
                    ShapedCrescent(id: .outerRing12, title: "OR12", arc: .arc12, appearance: .secondaryLight),
                    ShapedCrescent(id: .outerRing13, title: "OR13", arc: .arc13, appearance: .primaryLight),
                    ShapedCrescent(id: .outerRing14, title: "OR14", arc: .arc14, appearance: .primaryDark),
                    ShapedCrescent(id: .outerRing16, title: "OR16", arc: .arc16, appearance: .secondaryDark),
                    ShapedCrescent(id: .outerRing17, title: "OR17", arc: .arc17, appearance: .primaryLight),
                    ShapedCrescent(id: .outerRing18, title: "OR18", arc: .arc18, appearance: .primaryDark, extended: true),
                    ShapedCrescent(id: .outerRing19, title: "OR19", arc: .arc19, appearance: .secondaryDark, extended: true),
                    ShapedCrescent(id: .outerRing20, title: "OR20", arc: .arc20, appearance: .secondaryLight),
                ]
            )

            edges(
                in: values.plane,
                with: values.cartesianOffset,
                edges: [
                    ShapedEdge(title: "-", shape: edge06, appearance: .secondaryLight),
                    ShapedEdge(title: "MODE SELECT", shape: edge07, appearance: .primaryLight),
                    ShapedEdge(title: "+", shape: edge09, appearance: .secondaryDark),
                    ShapedEdge(title: "E13", shape: edge13, appearance: .primaryDark),
                    ShapedEdge(title: "E15", shape: edge15, appearance: .secondaryLight),
                ],
                obrounds: [
                    ShapedEdge(title: "T00", shape: top00, appearance: .secondaryLight),
                    ShapedEdge(title: "CALIBRATE", shape: top01, appearance: .secondaryLight),
                    ShapedEdge(title: "T03", shape: top03, appearance: .secondaryDark),
                    ShapedEdge(title: "T02", shape: top02, appearance: .primaryLight),
                    ShapedEdge(title: "T04", shape: top04, appearance: .primaryDark),
                    ShapedEdge(title: "T05", shape: top05, appearance: .primaryDark),
                ]
            )
        }
        .frame(width: values.plane.size.width, height: values.plane.size.height)
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
        edges: [ShapedEdge<EdgedCrescent>] = [],
        obrounds: [ShapedEdge<Obround>] = []
    ) -> some View {
        ZStack {
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

    private var edge06: EdgedCrescent {
        let interiorArc = Curve.arc06.arc(radius: radii.firstRingInteriorRadius)
        let exteriorArc = Curve.arc06.arc(radius: radii.secondRingExteriorRadius)
        let point = try! CartesianPoint.make(for: radii.secondRingExteriorRadius, degree: Curve.arc06.end)

        return EdgedCrescent(
            identifier: .edge06,
            interiorArc: interiorArc,
            edgePoints: [
                CartesianPoint(x: exteriorArc.startingPoint.x, y: exteriorArc.startingPoint.y),
                CartesianPoint(x: point.x, y: exteriorArc.startingPoint.y),
            ]
        )
    }

    private var edge07: EdgedCrescent {
        let interiorArc = Arc(radius: radii.firstRingInteriorRadius, startingDegree: Curve.arc07.start, endingDegree: Curve.arc08.end)

        let edge06Exterior = Curve.arc06.arc(radius: radii.secondRingExteriorRadius)
        let edge09Exterior = Curve.arc09.arc(radius: radii.secondRingExtendedExteriorRadius)
        let startingEdge = try! CartesianPoint.make(for: radii.secondRingExteriorRadius, degree: Curve.arc07.start)
        let endingEdge = try! CartesianPoint.make(for: radii.secondRingExtendedExteriorRadius, degree: Curve.arc08.end)

        return EdgedCrescent(
            identifier: .edge07,
            interiorArc: interiorArc,
            edgePoints: [
                CartesianPoint(x: startingEdge.x, y: edge06Exterior.startingPoint.y),
                CartesianPoint(x: edge09Exterior.endingPoint.x, y: edge06Exterior.startingPoint.y),
                CartesianPoint(x: edge09Exterior.endingPoint.x, y: endingEdge.y),
            ]
        )
    }

    private var edge09: EdgedCrescent {
        let interiorArc = Curve.arc09.arc(radius: radii.firstRingInteriorRadius)
        let exteriorArc = Curve.arc09.arc(radius: radii.secondRingExtendedExteriorRadius)
        let point = try! CartesianPoint.make(for: radii.secondRingExtendedExteriorRadius, degree: Curve.arc09.start)

        return EdgedCrescent(
            identifier: .edge09,
            interiorArc: interiorArc,
            edgePoints: [
                CartesianPoint(x: exteriorArc.endingPoint.x, y: point.y),
                exteriorArc.endingPoint,
            ]
        )
    }

    private var edge13: EdgedCrescent {
        let interiorArc = Curve.arc13.arc(radius: radii.thirdRingInteriorRadius)
        let exteriorArc = Curve.arc13.arc(radius: radii.thirdRingExteriorRadius)
        let point = try! CartesianPoint.make(for: radii.thirdRingExteriorRadius, degree: Curve.arc12.start)

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
        let interiorArc = Curve.arc15.arc(radius: radii.secondRingInteriorRadius)
        let exteriorArc = Curve.arc15.arc(radius: radii.secondRingEdgeExteriorRadius)

        return EdgedCrescent(
            identifier: .edge15,
            interiorArc: interiorArc,
            edgePoints: [
                exteriorArc.startingPoint,
                exteriorArc.endingPoint,
            ]
        )
    }

    private var top00: Obround {
        let size = CGSize(
            width: Obround.intrinsicSize.width * values.scale,
            height: Obround.intrinsicSize.height * values.scale
        )

        let arc = Curve.arc18.arc(radius: radii.secondRingInteriorRadius)
        let x = arc.startingPoint.x + (arc.endingPoint.x - arc.startingPoint.x) / 2.0
        let y = edge15.cartesianFrame.origin.y

        return Obround(
            identifier: .top00,
            size: size,
            at: CartesianPoint(x: x, y: y)
        )
    }

    private var top01: Obround {
        let height = Obround.intrinsicSize.height * values.scale
        let edge13 = edge13
        let frame = edge13.cartesianFrame
        let width = edge13.edgePoints[1].x - edge13.edgePoints[0].x

        return Obround(
            identifier: .top01,
            size: CGSize(
                width: width,
                height: height
            ),
            at: CartesianPoint(
                x: frame.origin.x,
                y: frame.origin.y + values.spacing + height
            ),
            roundLeading: false,
            roundTrailing: false
        )
    }

    private var top02: Obround {
        let width = Obround.intrinsicSize.width * values.scale * 0.55
        let top03 = top03
        let frame = top03.cartesianFrame

        return Obround(
            identifier: .top02,
            size: CGSize(
                width: width,
                height: frame.height
            ),
            at: CartesianPoint(
                x: frame.minX - values.spacing - width,
                y: frame.minY
            ),
            roundTrailing: false
        )
    }

    private var top03: Obround {
        let height = Obround.intrinsicSize.height * values.scale
        let edge15 = edge15
        let frame = edge15.cartesianFrame

        return Obround(
            identifier: .top03,
            size: CGSize(
                width: frame.width,
                height: height
            ),
            at: CartesianPoint(
                x: frame.x,
                y: frame.y + values.spacing + height
            ),
            roundLeading: false,
            roundTrailing: false
        )
    }

    private var top04: Obround {
        let width = Obround.intrinsicSize.width * values.scale * 0.55
        let top03 = top03
        let frame = top03.cartesianFrame

        return Obround(
            identifier: .top04,
            size: CGSize(
                width: width,
                height: frame.height
            ),
            at: CartesianPoint(
                x: frame.minX + frame.width + values.spacing,
                y: frame.minY
            ),
            roundLeading: false
        )
    }

    private var top05: Obround {
        let top00 = top00
        let frame = top00.cartesianFrame

        return Obround(
            identifier: .top05,
            size: top00.size,
            at: CartesianPoint(
                x: frame.minX,
                y: frame.maxY + values.spacing
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
