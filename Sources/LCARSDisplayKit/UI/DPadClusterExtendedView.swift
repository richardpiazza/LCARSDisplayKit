#if canImport(SwiftUI)
import GraphPoint
import Swift2D
import SwiftUI

/// An example cluster control set that extends a 'DPadCluster'.
public struct DPadClusterExtendedView: View {

    /// The design/intrinsic `Size` (Width: 760, Height: 755).
    public static let intrinsicSize: Size = Size(width: 760.0, height: 755.0)
    public static let intrinsicOffset: CartesianFrame.Offset = Point(x: 0, y: 51.34)

    var values: CartesianValues
    var action: (CartesianIdentifier) -> Void

    @Environment(\.theme) private var theme

    public init(
        size: Size = Self.intrinsicSize,
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        values = CartesianValues(
            size: size,
            intrinsicSize: Self.intrinsicSize,
            intrinsicOffset: Self.intrinsicOffset
        )
        self.action = action
    }

    public init(
        scale value: Double,
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        values = CartesianValues(
            scale: value,
            intrinsicSize: Self.intrinsicSize,
            intrinsicOffset: Self.intrinsicOffset
        )
        self.action = action
    }

    public var body: some View {
        ZStack {
            dPadView(action: action)

            addControls(
                [
                    CartesianControl(title: "IR01", shape: innerRing01, appearance: .secondaryLight),
                    CartesianControl(title: "IR05", shape: innerRing05, appearance: .primaryLight),
                    CartesianControl(title: "IR10", shape: innerRing10, appearance: .primaryLight),
                    CartesianControl(title: "IR11", shape: innerRing11, appearance: .secondaryLight),
                    CartesianControl(title: "IR12", shape: innerRing12, appearance: .primaryDark),
                    CartesianControl(title: "IR13", shape: innerRing13, appearance: .secondaryDark),
                    CartesianControl(title: "IR14", shape: innerRing14, appearance: .secondaryLight),
                    CartesianControl(title: "IR15", shape: innerRing15, appearance: .primaryLight),
                    CartesianControl(title: "IR16", shape: innerRing16, appearance: .secondaryLight),
                    CartesianControl(title: "IR20", shape: innerRing20, appearance: .primaryLight),
                    CartesianControl(title: "OR01", shape: outerRing01, appearance: .primaryDark),
                    CartesianControl(title: "OR05", shape: outerRing05, appearance: .primaryDark),
                    CartesianControl(title: "OR10", shape: outerRing10, appearance: .primaryDark),
                    CartesianControl(title: "OR11", shape: outerRing11, appearance: .secondaryDark),
                    CartesianControl(title: "OR12", shape: outerRing12, appearance: .secondaryLight),
                    CartesianControl(title: "OR13", shape: outerRing13, appearance: .primaryLight),
                    CartesianControl(title: "OR14", shape: outerRing14, appearance: .primaryDark),
                    CartesianControl(title: "OR16", shape: outerRing16, appearance: .secondaryDark),
                    CartesianControl(title: "OR17", shape: outerRing17, appearance: .primaryLight),
                    CartesianControl(title: "OR18", shape: outerRing18, appearance: .primaryDark),
                    CartesianControl(title: "OR19", shape: outerRing19, appearance: .secondaryDark),
                    CartesianControl(title: "OR20", shape: outerRing20, appearance: .secondaryLight),
                ],
                in: values.plane,
                with: values.offset
            )

            addControls(
                [
                    CartesianControl(title: "-", shape: edge06, appearance: .secondaryLight),
                    CartesianControl(title: "MODE SELECT", shape: edge07, appearance: .primaryLight),
                    CartesianControl(title: "+", shape: edge09, appearance: .secondaryDark),
                    CartesianControl(title: "E13", shape: edge13, appearance: .primaryDark),
                    CartesianControl(title: "E15", shape: edge15, appearance: .secondaryLight),
                ],
                in: values.plane,
                with: values.offset
            )

            addControls(
                [
                    CartesianControl(title: "T00", shape: top00, appearance: .secondaryLight),
                    CartesianControl(title: "CALIBRATE", shape: top01, appearance: .secondaryLight),
                    CartesianControl(title: "T03", shape: top03, appearance: .secondaryDark),
                    CartesianControl(title: "T02", shape: top02, appearance: .primaryLight),
                    CartesianControl(title: "T04", shape: top04, appearance: .primaryDark),
                    CartesianControl(title: "T05", shape: top05, appearance: .primaryDark),
                ],
                in: values.plane,
                with: values.offset
            )
        }
        .frame(width: values.plane.size.width, height: values.plane.size.height)
    }

    private func dPadView(action: @escaping (CartesianIdentifier) -> Void) -> some View {
        DPadView(
            scale: values.scale,
            action: action
        )
        .frame(
            width: DPadView.intrinsicSize.width * values.scale,
            height: DPadView.intrinsicSize.height * values.scale
        )
        .position(
            x: values.plane.midX + values.offset.x,
            y: values.plane.midY + values.offset.y
        )
    }

    private func addControls(
        _ controls: [CartesianControl<some CartesianShape>],
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset
    ) -> some View {
        ZStack {
            ForEach(controls, id: \.title) { control in
                CartesianShapeView(
                    control.title,
                    shape: control.shape,
                    in: plane,
                    with: offset,
                    action: action
                )
                .foregroundStyle(theme.color(for: control.appearance))
            }
        }
    }

    private var innerRing01: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc01, to: .arc04),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc01, to: .arc04)
            ),
            identifier: .innerRing01
        )
    }

    private var innerRing05: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc05),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc05)
            ),
            identifier: .innerRing05
        )
    }

    private var innerRing10: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc10),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc10)
            ),
            identifier: .innerRing10
        )
    }

    private var innerRing11: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc11),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc11)
            ),
            identifier: .innerRing11
        )
    }

    private var innerRing12: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc12),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc12)
            ),
            identifier: .innerRing12
        )
    }

    private var innerRing13: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc13),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc13)
            ),
            identifier: .innerRing13
        )
    }

    private var innerRing14: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc14),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc14)
            ),
            identifier: .innerRing14
        )
    }

    private var innerRing15: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc15),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc15)
            ),
            identifier: .innerRing15
        )
    }

    private var innerRing16: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc16, to: .arc19),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc16, to: .arc19)
            ),
            identifier: .innerRing16
        )
    }

    private var innerRing20: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc20),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc20)
            ),
            identifier: .innerRing20
        )
    }

    private var outerRing01: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc01, to: .arc04),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc01, to: .arc04)
            ),
            identifier: .outerRing01
        )
    }

    private var outerRing05: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc05),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc05)
            ),
            identifier: .outerRing05
        )
    }

    private var outerRing10: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc10),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc10)
            ),
            identifier: .outerRing10
        )
    }

    private var outerRing11: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc11),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc11)
            ),
            identifier: .outerRing11
        )
    }

    private var outerRing12: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc12),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc12)
            ),
            identifier: .outerRing12
        )
    }

    private var outerRing13: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc13),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc13)
            ),
            identifier: .outerRing13
        )
    }

    private var outerRing14: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc14),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc14)
            ),
            identifier: .outerRing14
        )
    }

    private var outerRing16: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc16),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc16)
            ),
            identifier: .outerRing16
        )
    }

    private var outerRing17: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc17),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc17)
            ),
            identifier: .outerRing17
        )
    }

    private var outerRing18: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc18),
                exteriorArc: Arc(radius: values.radii.secondRingExtendedExteriorRadius, radial: .arc18)
            ),
            identifier: .outerRing18
        )
    }

    private var outerRing19: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc19),
                exteriorArc: Arc(radius: values.radii.secondRingExtendedExteriorRadius, radial: .arc19)
            ),
            identifier: .outerRing19
        )
    }

    private var outerRing20: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc20),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc20)
            ),
            identifier: .outerRing20
        )
    }

    private var edge06: EdgedCrescentControl {
        let interiorArc = Radial.arc06.arc(radius: values.radii.firstRingInteriorRadius)
        let exteriorArc = Radial.arc06.arc(radius: values.radii.secondRingExteriorRadius)
        let point = try! CartesianPoint.make(for: values.radii.secondRingExteriorRadius, degree: Radial.arc06.end)

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
        let interiorArc = Arc(radius: values.radii.firstRingInteriorRadius, startingDegree: Radial.arc07.start, endingDegree: Radial.arc08.end)

        let edge06Exterior = Radial.arc06.arc(radius: values.radii.secondRingExteriorRadius)
        let edge09Exterior = Radial.arc09.arc(radius: values.radii.secondRingExtendedExteriorRadius)
        let startingEdge = try! CartesianPoint.make(for: values.radii.secondRingExteriorRadius, degree: Radial.arc07.start)
        let endingEdge = try! CartesianPoint.make(for: values.radii.secondRingExtendedExteriorRadius, degree: Radial.arc08.end)

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
        let interiorArc = Radial.arc09.arc(radius: values.radii.firstRingInteriorRadius)
        let exteriorArc = Radial.arc09.arc(radius: values.radii.secondRingExtendedExteriorRadius)
        let point = try! CartesianPoint.make(for: values.radii.secondRingExtendedExteriorRadius, degree: Radial.arc09.start)

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
        let interiorArc = Radial.arc13.arc(radius: values.radii.thirdRingInteriorRadius)
        let exteriorArc = Radial.arc13.arc(radius: values.radii.thirdRingExteriorRadius)
        let point = try! CartesianPoint.make(for: values.radii.thirdRingExteriorRadius, degree: Radial.arc12.start)

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
        let interiorArc = Radial.arc15.arc(radius: values.radii.secondRingInteriorRadius)
        let exteriorArc = Radial.arc15.arc(radius: values.radii.secondRingEdgeExteriorRadius)

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

        let arc = Radial.arc18.arc(radius: values.radii.secondRingInteriorRadius)
        let x = arc.startingPoint.x + (arc.endingPoint.x - arc.startingPoint.x) / 2.0
        let y = edge15.cartesianFrame.origin.y

        return ObroundControl(
            obround: Obround(size: size),
            at: CartesianPoint(x: x, y: y),
            identifier: .top00
        )
    }

    private var top01: ObroundControl {
        let height = Obround.intrinsicSize.height * values.scale
        let edge13 = edge13
        let frame = edge13.cartesianFrame
        let width = edge13.edgedCrescent.edgePoints[1].x - edge13.edgedCrescent.edgePoints[0].x

        return ObroundControl(
            obround: Obround(
                size: Size(
                    width: width,
                    height: height
                ),
                roundLeading: false,
                roundTrailing: false
            ),
            at: CartesianPoint(
                x: frame.origin.x,
                y: frame.origin.y + values.spacing + height
            ),
            identifier: .top01
        )
    }

    private var top02: ObroundControl {
        let width = Obround.intrinsicSize.width * values.scale * 0.55
        let top03 = top03
        let frame = top03.cartesianFrame

        return ObroundControl(
            obround: Obround(
                size: Size(
                    width: width,
                    height: frame.height
                ),
                roundTrailing: false
            ),
            at: CartesianPoint(
                x: frame.minX - values.spacing - width,
                y: frame.minY
            ),
            identifier: .top02
        )
    }

    private var top03: ObroundControl {
        let height = Obround.intrinsicSize.height * values.scale
        let edge15 = edge15
        let frame = edge15.cartesianFrame

        return ObroundControl(
            obround: Obround(
                size: Size(
                    width: frame.width,
                    height: height
                ),
                roundLeading: false,
                roundTrailing: false
            ),
            at: CartesianPoint(
                x: frame.x,
                y: frame.y + values.spacing + height
            ),
            identifier: .top03
        )
    }

    private var top04: ObroundControl {
        let width = Obround.intrinsicSize.width * values.scale * 0.55
        let top03 = top03
        let frame = top03.cartesianFrame

        return ObroundControl(
            obround: Obround(
                size: Size(
                    width: width,
                    height: frame.height
                ),
                roundLeading: false
            ),
            at: CartesianPoint(
                x: frame.minX + frame.width + values.spacing,
                y: frame.minY
            ),
            identifier: .top04
        )
    }

    private var top05: ObroundControl {
        let top00 = top00
        let frame = top00.cartesianFrame

        return ObroundControl(
            obround: Obround(size: top00.obround.size),
            at: CartesianPoint(
                x: frame.minX,
                y: frame.maxY + values.spacing
            ),
            identifier: .top05
        )
    }
}

public extension DPadClusterExtendedView {
    init(
        size: CGSize,
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        values = CartesianValues(
            size: Size(size),
            intrinsicSize: Self.intrinsicSize,
            intrinsicOffset: Self.intrinsicOffset
        )
        self.action = action
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
