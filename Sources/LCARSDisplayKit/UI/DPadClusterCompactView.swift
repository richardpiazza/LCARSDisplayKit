#if canImport(SwiftUI)
import GraphPoint
import Swift2D
import SwiftUI

/// An example cluster control set that extends a 'DPad'.
///
/// This particular layout comes from the small tactical station behind the command
/// chairs on the USS Voyager.
public struct DPadClusterCompactView: View {

    public static let intrinsicSize: Size = Size(width: 715.0, height: 520.0)
    public static let intrinsicOffset: CartesianFrame.Offset = Point(x: -26.169, y: 72.8)

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
            intrinsicOffset: Self.intrinsicOffset,
            layout: .compact
        )
        self.action = action
    }

    public init(
        scale: Double,
        action: @escaping (CartesianIdentifier) -> Void = { _ShapedCrescent in }
    ) {
        values = CartesianValues(
            scale: scale,
            intrinsicSize: Self.intrinsicSize,
            intrinsicOffset: Self.intrinsicOffset,
            layout: .compact
        )
        self.action = action
    }

    public var body: some View {
        ZStack {
            dPadView(action: action)

            addControls(
                [
                    CartesianControl(title: "IR08", shape: innerRing08, appearance: .primaryDark),
                    CartesianControl(title: "IR09", shape: innerRing09, appearance: .secondaryLight),
                    CartesianControl(title: "IR10", shape: innerRing10, appearance: .secondaryDark),
                    CartesianControl(title: "IR11", shape: innerRing11, appearance: .secondaryLight),
                    CartesianControl(title: "IR13", shape: innerRing13, appearance: .secondaryDark),
                    CartesianControl(title: "OR09", shape: outerRing09, appearance: .secondaryDark),
                    CartesianControl(title: "OR10", shape: outerRing10, appearance: .secondaryLight),
                    CartesianControl(title: "OR11", shape: outerRing11, appearance: .primaryDark),
                    CartesianControl(title: "OR12", shape: outerRing12, appearance: .secondaryDark),
                    CartesianControl(title: "OR13", shape: outerRing13, appearance: .secondaryLight),
                    CartesianControl(title: "OR18", shape: outerRing18, appearance: .primaryDark),
                    CartesianControl(title: "IN01", shape: innerRing01, appearance: .secondaryDark),
                    CartesianControl(title: "IN14", shape: innerRing14, appearance: .secondaryLight),
                    CartesianControl(title: "IN15", shape: innerRing15, appearance: .secondaryDark),
                    CartesianControl(title: "IN16", shape: innerRing16, appearance: .secondaryLight),
                    CartesianControl(title: "IN17", shape: innerRing17, appearance: .secondaryLight),
                    CartesianControl(title: "IN20", shape: innerRing20, appearance: .quaternaryLight),
                    CartesianControl(title: "OR19", shape: outerRing19, appearance: .secondaryLight),
                    CartesianControl(title: "OR20", shape: outerRing20, appearance: .secondaryDark),
                ],
                in: values.plane,
                with: values.offset
            )

            addControls(
                [
                    CartesianControl(title: "E13", shape: edge13, appearance: .primaryDark),
                    CartesianControl(title: "E15", shape: edge15, appearance: .secondaryLight),
                ],
                in: values.plane,
                with: values.offset
            )

            addControls(
                [
                    CartesianControl(title: "T00", shape: top00, appearance: .secondaryDark),
                ],
                in: values.plane,
                with: values.offset
            )
        }
        .frame(width: values.plane.size.width, height: values.plane.size.height)
    }

    func dPadView(action: @escaping (CartesianIdentifier) -> Void) -> some View {
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
        let ir20 = innerRing20
        let twoAndOneQuarter = Radial.arc02.start + Radial.arc02.quarter
        let inner = Arc(radius: values.radii.firstRingInteriorRadius, startingDegree: ir20.crescent.interiorArc.endingDegree + 1.5, endingDegree: twoAndOneQuarter)
        let outer = Arc(radius: values.radii.firstRingExteriorRadius, startingDegree: ir20.crescent.exteriorArc.endingDegree + 1.0, endingDegree: twoAndOneQuarter)
        return CrescentControl(
            crescent: Crescent(
                interiorArc: inner,
                exteriorArc: outer
            ),
            identifier: .innerRing01
        )
    }

    private var innerRing08: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc08),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc08)
            ),
            identifier: .innerRing08
        )
    }

    private var innerRing09: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc09),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc09)
            ),
            identifier: .innerRing09
        )
    }

    private var innerRing10: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc10),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc10)
            ),
            identifier: .innerRing08
        )
    }

    private var innerRing11: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc11),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc11)
            ),
            identifier: .innerRing08
        )
    }

    private var innerRing13: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, radial: .arc13),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, radial: .arc13)
            ),
            identifier: .innerRing08
        )
    }

    private var innerRing14: CrescentControl {
        let ir15 = innerRing15
        let inner = Arc(radius: values.radii.firstRingInteriorRadius, startingDegree: Radial.arc14.start, endingDegree: ir15.crescent.interiorArc.startingDegree - 1.5)
        let outer = Arc(radius: values.radii.firstRingExteriorRadius, startingDegree: Radial.arc14.start, endingDegree: ir15.crescent.exteriorArc.startingDegree - 1.0)
        return CrescentControl(
            crescent: Crescent(
                interiorArc: inner,
                exteriorArc: outer
            ),
            identifier: .innerRing14
        )
    }

    private var innerRing15: CrescentControl {
        let arc = Arc(
            radius: values.radii.firstRingInteriorRadius - values.spacing,
            startingDegree: Direction.Cardinal.up.start,
            endingDegree: Direction.Cardinal.up.end
        )
        let startPoint = CartesianPoint(x: arc.startingPoint.x, y: arc.startingPoint.y + values.spacing)
        let startDegree = try! Degree.make(for: startPoint)
        let endPoint = CartesianPoint(x: arc.endingPoint.x, y: arc.endingPoint.y + values.spacing)
        let endDegree = try! Degree.make(for: endPoint)
        let shift = values.radii.firstRingExteriorRadius - values.radii.firstRingInteriorRadius
        let exteriorStart = try! Degree.make(for: startPoint.with(y: startPoint.y + shift))
        let exteriorEnd = try! Degree.make(for: endPoint.with(y: endPoint.y + shift))

        return CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, startingDegree: startDegree, endingDegree: endDegree),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, startingDegree: exteriorStart, endingDegree: exteriorEnd)
            ),
            identifier: .innerRing15
        )
    }

    private var innerRing16: CrescentControl {
        let seventeenAndOneQuarter = Radial.arc17.start + Radial.arc17.quarter
        let ir15 = innerRing15
        let inner = Arc(radius: values.radii.firstRingInteriorRadius, startingDegree: ir15.crescent.interiorArc.endingDegree + 1.5, endingDegree: seventeenAndOneQuarter)
        let outer = Arc(radius: values.radii.firstRingExteriorRadius, startingDegree: ir15.crescent.exteriorArc.endingDegree + 1.0, endingDegree: seventeenAndOneQuarter)
        return CrescentControl(
            crescent: Crescent(
                interiorArc: inner,
                exteriorArc: outer
            ),
            identifier: .innerRing16
        )
    }

    private var innerRing17: CrescentControl {
        let seventeenAndOneQuarter = Radial.arc17.start + Radial.arc17.quarter
        let ir20 = innerRing20
        let inner = Arc(radius: values.radii.firstRingInteriorRadius, startingDegree: seventeenAndOneQuarter + 1.0, endingDegree: ir20.crescent.interiorArc.startingDegree - 1.5)
        let outer = Arc(radius: values.radii.firstRingExteriorRadius, startingDegree: seventeenAndOneQuarter + 1.0, endingDegree: ir20.crescent.exteriorArc.startingDegree - 1.0)
        return CrescentControl(
            crescent: Crescent(
                interiorArc: inner,
                exteriorArc: outer
            ),
            identifier: .innerRing17
        )
    }

    private var innerRing20: CrescentControl {
        let arc = Arc(
            radius: values.radii.firstRingInteriorRadius - values.spacing,
            startingDegree: Direction.Cardinal.right.start,
            endingDegree: Direction.Cardinal.right.end
        )
        let startPoint = CartesianPoint(x: arc.startingPoint.x + values.spacing, y: arc.startingPoint.y)
        let startDegree = try! Degree.make(for: startPoint)
        let endPoint = CartesianPoint(x: arc.endingPoint.x + values.spacing, y: arc.endingPoint.y)
        let endDegree = try! Degree.make(for: endPoint)
        let shift = values.radii.firstRingExteriorRadius - values.radii.firstRingInteriorRadius
        let exteriorStart = try! Degree.make(for: startPoint.with(x: startPoint.x + shift))
        let exteriorEnd = try! Degree.make(for: endPoint.with(x: endPoint.x + shift))

        return CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.firstRingInteriorRadius, startingDegree: startDegree, endingDegree: endDegree),
                exteriorArc: Arc(radius: values.radii.firstRingExteriorRadius, startingDegree: exteriorStart, endingDegree: exteriorEnd)
            ),
            identifier: .innerRing20
        )
    }

    private var outerRing09: CrescentControl {
        CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, radial: .arc09),
                exteriorArc: Arc(radius: values.radii.secondRingExteriorRadius, radial: .arc09)
            ),
            identifier: .outerRing09
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
        let or20 = outerRing20
        let inner = Arc(radius: values.radii.secondRingInteriorRadius, startingDegree: Radial.arc19.start, endingDegree: or20.crescent.interiorArc.startingDegree - 1.0)
        let outer = Arc(radius: values.radii.secondRingExtendedExteriorRadius, startingDegree: Radial.arc19.start, endingDegree: or20.crescent.exteriorArc.startingDegree - 0.75)
        return CrescentControl(
            crescent: Crescent(
                interiorArc: inner,
                exteriorArc: outer
            ),
            identifier: .outerRing19
        )
    }

    private var outerRing20: CrescentControl {
        let ir20 = innerRing20
        let innerStart = ir20.crescent.exteriorArc.startingPoint.with(x: ir20.crescent.exteriorArc.startingPoint.x + values.spacing)
        let innerStartDegree = try! Degree.make(for: innerStart)
        let innerEnd = ir20.crescent.exteriorArc.endingPoint.with(x: ir20.crescent.exteriorArc.endingPoint.x + values.spacing)
        let innerEndDegree = try! Degree.make(for: innerEnd)
        let shift = values.radii.secondRingExtendedExteriorRadius - values.radii.secondRingInteriorRadius
        let outerStart = innerStart.with(x: innerStart.x + shift)
        let outerStartDegree = try! Degree.make(for: outerStart)
        let outerEnd = innerEnd.with(x: innerEnd.x + shift)
        let outerEndDegree = try! Degree.make(for: outerEnd)

        return CrescentControl(
            crescent: Crescent(
                interiorArc: Arc(radius: values.radii.secondRingInteriorRadius, startingDegree: innerStartDegree, endingDegree: innerEndDegree),
                exteriorArc: Arc(radius: values.radii.secondRingExtendedExteriorRadius, startingDegree: outerStartDegree, endingDegree: outerEndDegree)
            ),
            identifier: .outerRing20
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
        let in15 = innerRing15
        let startPoint = CartesianPoint(
            x: in15.crescent.exteriorArc.startingPoint.x,
            y: in15.crescent.exteriorArc.startingPoint.y + values.spacing
        )
        let startDegree = try! Degree.make(for: startPoint)
        let endPoint = CartesianPoint(
            x: in15.crescent.exteriorArc.endingPoint.x,
            y: in15.crescent.exteriorArc.endingPoint.y + values.spacing
        )
        let endDegree = try! Degree.make(for: endPoint)

        let interiorArc = Arc(radius: values.radii.secondRingInteriorRadius, startingDegree: startDegree, endingDegree: endDegree)
        let y = edge13.cartesianFrame.origin.y

        return EdgedCrescentControl(
            edgedCrescent: EdgedCrescent(
                interiorArc: interiorArc,
                edgePoints: [
                    CartesianPoint(x: interiorArc.startingPoint.x, y: y),
                    CartesianPoint(x: interiorArc.endingPoint.x, y: y),
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

        let arc = Radial.arc17.arc(radius: values.radii.firstRingInteriorRadius)
        let x = arc.startingPoint.x + (arc.endingPoint.x - arc.startingPoint.x) / 2.0
        let y = edge13.cartesianFrame.origin.y

        return ObroundControl(
            obround: Obround(size: size),
            at: CartesianPoint(x: x, y: y),
            identifier: .top00
        )
    }
}

public extension DPadClusterCompactView {
    init(
        size: CGSize,
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        values = CartesianValues(
            size: Size(size),
            intrinsicSize: Self.intrinsicSize,
            intrinsicOffset: Self.intrinsicOffset,
            layout: .compact
        )
        self.action = action
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
