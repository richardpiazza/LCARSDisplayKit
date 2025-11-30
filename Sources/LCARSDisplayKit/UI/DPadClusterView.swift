import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

/// An example cluster control set that extends a 'DPad'.
public struct DPadClusterView: View {

    public static let intrinsicSize: Size = Size(width: 760.0, height: 625.0)
    public static let intrinsicOffset: CartesianFrame.Offset = Point(x: 0.0, y: 47.8125)

    var values: DirectionPad
    var radii: DirectionPad.Radii
    var action: (CartesianIdentifier) -> Void

    @Environment(\.theme) private var theme

    public init(
        size: Size = Self.intrinsicSize,
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        values = DirectionPad(
            size: size,
            intrinsicSize: Self.intrinsicSize,
            intrinsicOffset: Self.intrinsicOffset
        )
        radii = values.radii(layout: .standard, dPadRadius: DPadView.intrinsicSize.width / 2.0)
        self.action = action
    }

    public var body: some View {
        ZStack {
            values.dPadView(action: action)

            crescents(
                interiorRadius: radii.firstRingInteriorRadius,
                exteriorRadius: radii.firstRingExteriorRadius,
                extendedExteriorRadius: radii.firstRingExteriorRadius,
                in: values.plane,
                with: values.offset,
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
                with: values.offset,
                shapes: [
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
                with: values.offset,
                edges: [
                    ShapedEdge(title: "-", shape: edge06, appearance: .secondaryLight),
                    ShapedEdge(title: "MODE SELECT", shape: edge07, appearance: .primaryLight),
                    ShapedEdge(title: "+", shape: edge09, appearance: .secondaryDark),
                    ShapedEdge(title: "E13", shape: edge13, appearance: .primaryDark),
                    ShapedEdge(title: "E15", shape: edge15, appearance: .secondaryLight),
                ],
                obrounds: [
                    ShapedEdge(title: "T00", shape: top00, appearance: .secondaryLight),
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
                CrescentControlView(
                    shape.title,
                    shape: CrescentControl(
                        crescent: shape.shape(
                            interiorRadius: interiorRadius,
                            exteriorRadius: exteriorRadius,
                            extendedRadius: extendedExteriorRadius
                        ),
                        identifier: shape.id
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
        edges: [ShapedEdge<EdgedCrescentControl>] = [],
        obrounds: [ShapedEdge<ObroundControl>] = []
    ) -> some View {
        ZStack {
            ForEach(edges, id: \.title) { edge in
                EdgedCrescentControlView(
                    edge.title,
                    shape: edge.shape,
                    in: plane,
                    with: offset,
                    action: action
                )
                .foregroundStyle(theme.color(for: edge.appearance))
            }

            ForEach(obrounds, id: \.title) { obround in
                ObroundControlView(
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

    private var edge06: EdgedCrescentControl {
        let interiorArc = Curve.arc06.arc(radius: radii.firstRingInteriorRadius)
        let exteriorArc = Curve.arc06.arc(radius: radii.firstRingExteriorRadius)
        let point = try! CartesianPoint.make(for: radii.firstRingExteriorRadius, degree: Curve.arc06.end)

        return EdgedCrescentControl(
            edgedCrescent: EdgedCrescent(
                interiorArc: interiorArc,
                edgePoints: [
                    CartesianPoint(x: exteriorArc.startingPoint.x, y: exteriorArc.startingPoint.y),
                    CartesianPoint(x: point.x, y: exteriorArc.startingPoint.y),
                ]
            ),
            identifier: .edge06
        )
    }

    private var edge07: EdgedCrescentControl {
        let interiorArc = Arc(radius: radii.firstRingInteriorRadius, startingDegree: Curve.arc07.start, endingDegree: Curve.arc08.end)

        let edge06Exterior = Curve.arc06.arc(radius: radii.firstRingExteriorRadius)
        let edge09Exterior = Curve.arc09.arc(radius: radii.secondRingExtendedExteriorRadius)
        let startingEdge = try! CartesianPoint.make(for: radii.firstRingExteriorRadius, degree: Curve.arc07.start)
        let endingEdge = try! CartesianPoint.make(for: radii.secondRingExtendedExteriorRadius, degree: Curve.arc08.end)

        return EdgedCrescentControl(
            edgedCrescent: EdgedCrescent(
                interiorArc: interiorArc,
                edgePoints: [
                    CartesianPoint(x: startingEdge.x, y: edge06Exterior.startingPoint.y),
                    CartesianPoint(x: edge09Exterior.endingPoint.x, y: edge06Exterior.startingPoint.y),
                    CartesianPoint(x: edge09Exterior.endingPoint.x, y: endingEdge.y),
                ]
            ),
            identifier: .edge07
        )
    }

    private var edge09: EdgedCrescentControl {
        let interiorArc = Curve.arc09.arc(radius: radii.firstRingInteriorRadius)
        let exteriorArc = Curve.arc09.arc(radius: radii.secondRingExtendedExteriorRadius)
        let point = try! CartesianPoint.make(for: radii.secondRingExtendedExteriorRadius, degree: Curve.arc09.start)

        return EdgedCrescentControl(
            edgedCrescent: EdgedCrescent(
                interiorArc: interiorArc,
                edgePoints: [
                    CartesianPoint(x: exteriorArc.endingPoint.x, y: point.y),
                    exteriorArc.endingPoint,
                ]
            ),
            identifier: .edge09
        )
    }

    private var edge13: EdgedCrescentControl {
        let interiorArc = Curve.arc13.arc(radius: radii.thirdRingInteriorRadius)
        let exteriorArc = Curve.arc13.arc(radius: radii.thirdRingExteriorRadius)
        let point = try! CartesianPoint.make(for: radii.thirdRingExteriorRadius, degree: Curve.arc12.start)

        return EdgedCrescentControl(
            edgedCrescent: EdgedCrescent(
                interiorArc: interiorArc,
                edgePoints: [
                    CartesianPoint(x: point.x, y: exteriorArc.endingPoint.y),
                    exteriorArc.endingPoint,
                ]
            ),
            identifier: .edge13
        )
    }

    private var edge15: EdgedCrescentControl {
        let interiorArc = Curve.arc15.arc(radius: radii.secondRingInteriorRadius)
        let exteriorArc = Curve.arc15.arc(radius: radii.secondRingEdgeExteriorRadius)

        return EdgedCrescentControl(
            edgedCrescent: EdgedCrescent(
                interiorArc: interiorArc,
                edgePoints: [
                    exteriorArc.startingPoint,
                    exteriorArc.endingPoint,
                ]
            ),
            identifier: .edge15
        )
    }

    private var top00: ObroundControl {
        let size = Size(
            width: Obround.intrinsicSize.width * values.scale,
            height: Obround.intrinsicSize.height * values.scale
        )

        let arc = Curve.arc18.arc(radius: radii.secondRingInteriorRadius)
        let x = arc.startingPoint.x + (arc.endingPoint.x - arc.startingPoint.x) / 2.0
        let y = edge15.cartesianFrame.origin.y

        return ObroundControl(
            obround: Obround(size: size),
            at: CartesianPoint(x: x, y: y),
            identifier: .top00
        )
    }
}

public extension DPadClusterView {
    init(
        size: CGSize,
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        values = DirectionPad(
            size: Size(size),
            intrinsicSize: Self.intrinsicSize,
            intrinsicOffset: Self.intrinsicOffset
        )
        radii = values.radii(layout: .standard, dPadRadius: DPadView.intrinsicSize.width / 2.0)
        self.action = action
    }
}

#Preview {
    GeometryReader { geometry in
//        DPadClusterView()
        DPadClusterView(size: geometry.size)
            .border(.red, width: 2)
    }
    .background(.black)
}
#endif
