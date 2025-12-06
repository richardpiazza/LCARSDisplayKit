#if canImport(SwiftUI)
import GraphPoint
import Swift2D
import SwiftUI

/// An example cluster control set that extends a 'DPad'.
public struct DPadClusterView: View {

    public static let intrinsicSize: Size = Size(width: 760.0, height: 625.0)
    public static let intrinsicOffset: CartesianFrame.Offset = Point(x: 0.0, y: 47.8125)

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
        scale: Double,
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        values = CartesianValues(
            scale: scale,
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
    
    private func addControls<T: CartesianShape>(
        _ controls: [CartesianControl<T>],
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
        let exteriorArc = Radial.arc06.arc(radius: values.radii.firstRingExteriorRadius)
        let point = try! CartesianPoint.make(for: values.radii.firstRingExteriorRadius, degree: Radial.arc06.end)

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

        let edge06Exterior = Radial.arc06.arc(radius: values.radii.firstRingExteriorRadius)
        let edge09Exterior = Radial.arc09.arc(radius: values.radii.secondRingExtendedExteriorRadius)
        let startingEdge = try! CartesianPoint.make(for: values.radii.firstRingExteriorRadius, degree: Radial.arc07.start)
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
}

public extension DPadClusterView {
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
//        DPadClusterView()
        DPadClusterView(size: geometry.size)
            .border(.red, width: 2)
    }
    .background(.black)
}
#endif
