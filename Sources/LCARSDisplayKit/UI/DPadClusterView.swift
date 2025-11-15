import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

/// An example cluster control set that extends a 'DPad'.
public struct DPadClusterView: View {

    public static let intrinsicSize: CGSize = CGSize(width: 760.0, height: 625.0)
    public static let intrinsicSpacing: CGFloat = 8.0
    public static let intrinsicRatio: CGFloat = if intrinsicSize.width >= intrinsicSize.height {
        intrinsicSize.width / intrinsicSize.height
    } else {
        intrinsicSize.height / intrinsicSize.width
    }

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

        cartesianOffset = CartesianFrame.Offset(x: 0, y: scaledContentSize.height * 0.0765)
        self.action = action

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
                interiorRadius: secondRingInteriorRadius,
                exteriorRadius: secondRingExteriorRadius,
                extendedExteriorRadius: secondRingExtendedExteriorRadius,
                in: plane,
                with: cartesianOffset,
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
                in: plane,
                with: cartesianOffset,
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
        let interiorArc = Curve.arc06.arc(radius: firstRingInteriorRadius)
        let exteriorArc = Curve.arc06.arc(radius: firstRingExteriorRadius)
        let point = try! CartesianPoint.make(for: firstRingExteriorRadius, degree: Curve.arc06.end)

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
        let interiorArc = Arc(radius: firstRingInteriorRadius, startingDegree: Curve.arc07.start, endingDegree: Curve.arc08.end)

        let edge06Exterior = Curve.arc06.arc(radius: firstRingExteriorRadius)
        let edge09Exterior = Curve.arc09.arc(radius: secondRingExtendedExteriorRadius)
        let startingEdge = try! CartesianPoint.make(for: firstRingExteriorRadius, degree: Curve.arc07.start)
        let endingEdge = try! CartesianPoint.make(for: secondRingExtendedExteriorRadius, degree: Curve.arc08.end)

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
        let interiorArc = Curve.arc09.arc(radius: firstRingInteriorRadius)
        let exteriorArc = Curve.arc09.arc(radius: secondRingExtendedExteriorRadius)
        let point = try! CartesianPoint.make(for: secondRingExtendedExteriorRadius, degree: Curve.arc09.start)

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
        let interiorArc = Curve.arc15.arc(radius: secondRingInteriorRadius)
        let exteriorArc = Curve.arc15.arc(radius: secondRingEdgeExteriorRadius)

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
            width: Obround.intrinsicSize.width * scale,
            height: Obround.intrinsicSize.height * scale
        )

        let arc = Curve.arc18.arc(radius: secondRingInteriorRadius)
        let x = arc.startingPoint.x + (arc.endingPoint.x - arc.startingPoint.x) / 2.0
        let y = edge15.cartesianFrame.origin.y

        return Obround(
            identifier: .top00,
            size: size,
            at: CartesianPoint(x: x, y: y)
        )
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
