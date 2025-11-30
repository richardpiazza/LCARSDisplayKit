import GraphPoint
@testable import LCARSDisplayKit
import Swift2D
import XCTest

final class DirectionClusterTests: XCTestCase {

    let iPadLandscape = Size(width: 1376.0, height: 975.0)
    let iPadPortrait = Size(width: 1032.0, height: 1319.0)

    let intrinsicRect = Rect(origin: .zero, size: Size(width: 350.0, height: 350.0))
    let canvasRect = Rect(origin: .zero, size: Size(width: 2560.0, height: 1440.0))

    func testDPadViewValues() {
        var values = DirectionPad(
            size: Size(width: 350.0, height: 350.0),
            intrinsicSize: Size(width: 350.0, height: 350.0)
        )

        XCTAssertEqual(values.plane.width, 350.0, accuracy: 0.1)
        XCTAssertEqual(values.plane.height, 350.0, accuracy: 0.1)
        XCTAssertEqual(values.diameter, 350.0, accuracy: 0.1)
        XCTAssertEqual(values.radius, 175.0, accuracy: 0.1)
        XCTAssertEqual(values.scale, 1.0, accuracy: 0.1)
        XCTAssertEqual(values.spacing, 8.0, accuracy: 0.1)
        XCTAssertEqual(values.cruxRadius, 30.0, accuracy: 0.1)
        XCTAssertEqual(values.offset.x, 0.0, accuracy: 0.1)
        XCTAssertEqual(values.offset.y, 0.0, accuracy: 0.1)

        values = DirectionPad(
            size: Size(width: 700.0, height: 700.0),
            intrinsicSize: Size(width: 350.0, height: 350.0)
        )

        XCTAssertEqual(values.plane.width, 700.0, accuracy: 0.1)
        XCTAssertEqual(values.plane.height, 700.0, accuracy: 0.1)
        XCTAssertEqual(values.diameter, 700.0, accuracy: 0.1)
        XCTAssertEqual(values.radius, 350.0, accuracy: 0.1)
        XCTAssertEqual(values.scale, 2.0, accuracy: 0.1)
        XCTAssertEqual(values.spacing, 16.0, accuracy: 0.1)
        XCTAssertEqual(values.cruxRadius, 60.0, accuracy: 0.1)
        XCTAssertEqual(values.offset.x, 0.0, accuracy: 0.1)
        XCTAssertEqual(values.offset.y, 0.0, accuracy: 0.1)

        values = DirectionPad(
            size: Size(width: 100.0, height: 100.0),
            intrinsicSize: Size(width: 350.0, height: 350.0)
        )

        XCTAssertEqual(values.plane.width, 100.0, accuracy: 0.1)
        XCTAssertEqual(values.plane.height, 100.0, accuracy: 0.1)
        XCTAssertEqual(values.diameter, 100.0, accuracy: 0.1)
        XCTAssertEqual(values.radius, 50.0, accuracy: 0.1)
        XCTAssertEqual(values.scale, 0.2857, accuracy: 0.1)
        XCTAssertEqual(values.spacing, 2.2857, accuracy: 0.1)
        XCTAssertEqual(values.cruxRadius, 8.5714, accuracy: 0.1)
        XCTAssertEqual(values.offset.x, 0.0, accuracy: 0.1)
        XCTAssertEqual(values.offset.y, 0.0, accuracy: 0.1)

        values = DirectionPad(
            size: Size(width: 500.0, height: 1000.0),
            intrinsicSize: Size(width: 350.0, height: 350.0)
        )

        XCTAssertEqual(values.plane.width, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.plane.height, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.diameter, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.radius, 250.0, accuracy: 0.1)
        XCTAssertEqual(values.scale, 1.4285, accuracy: 0.1)
        XCTAssertEqual(values.spacing, 11.4285, accuracy: 0.1)
        XCTAssertEqual(values.cruxRadius, 42.8571, accuracy: 0.1)
        XCTAssertEqual(values.offset.x, 0.0, accuracy: 0.1)
        XCTAssertEqual(values.offset.y, 0.0, accuracy: 0.1)

        values = DirectionPad(
            size: Size(width: 1000.0, height: 500.0),
            intrinsicSize: Size(width: 350.0, height: 350.0)
        )

        XCTAssertEqual(values.plane.width, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.plane.height, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.diameter, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.radius, 250.0, accuracy: 0.1)
        XCTAssertEqual(values.scale, 1.4285, accuracy: 0.1)
        XCTAssertEqual(values.spacing, 11.4285, accuracy: 0.1)
        XCTAssertEqual(values.cruxRadius, 42.8571, accuracy: 0.1)
        XCTAssertEqual(values.offset.x, 0.0, accuracy: 0.1)
        XCTAssertEqual(values.offset.y, 0.0, accuracy: 0.1)
    }

    func testClusterCompactView() {
        var values = DirectionPad(
            size: iPadLandscape,
            intrinsicSize: Size(width: 760.0, height: 625.0)
        )

        XCTAssertEqual(values.plane.width, 1185.6, accuracy: 0.01)
        XCTAssertEqual(values.plane.height, 975.0)

        values = DirectionPad(
            size: iPadPortrait,
            intrinsicSize: Size(width: 760.0, height: 625.0)
        )

        XCTAssertEqual(values.plane.width, 1032.0, accuracy: 0.01)
        XCTAssertEqual(values.plane.height, 848.68, accuracy: 0.01)
    }

    func testClusterStackedView() {
        var values = DirectionPad(
            size: iPadPortrait,
            intrinsicSize: Size(width: 410.0, height: 995.0)
        )

        XCTAssertEqual(values.plane.width, 543.51, accuracy: 0.01)
        XCTAssertEqual(values.plane.height, 1319.0)

        values = DirectionPad(
            size: iPadLandscape,
            intrinsicSize: Size(width: 410.0, height: 995.0)
        )

        XCTAssertEqual(values.plane.width, 401.76, accuracy: 0.01)
        XCTAssertEqual(values.plane.height, 975.0, accuracy: 0.01)
    }

    func testIntrinsicValues() {
        let values = DirectionPad(
            size: intrinsicRect.size,
            intrinsicSize: intrinsicRect.size
        )

        XCTAssertEqual(values.diameter, 350.0)
        XCTAssertEqual(values.radius, 175.0)
        XCTAssertEqual(values.scale, 1.0)
        XCTAssertEqual(values.spacing, 8.0)
        XCTAssertEqual(values.cruxRadius, 30.0)
    }

    func testCanvasValues() {
        let values = DirectionPad(
            size: canvasRect.size,
            intrinsicSize: intrinsicRect.size
        )

        XCTAssertEqual(values.diameter, 1440.0, accuracy: 0.001)
        XCTAssertEqual(values.radius, 720.0, accuracy: 0.001)
        XCTAssertEqual(values.scale, 4.114285714285714, accuracy: 0.0001)
        XCTAssertEqual(values.spacing, 32.91428571428571, accuracy: 0.0001)
        XCTAssertEqual(values.cruxRadius, 123.42857142857142, accuracy: 0.0001)
    }

    func testIntrinsicFrames() {
        let values = DirectionPad(
            size: intrinsicRect.size,
            intrinsicSize: intrinsicRect.size
        )

        let wedge01 = Wedge(sector: .sector1, radius: values.radius)
        var cartesianFrame = WedgeControl(wedge: wedge01).cartesianFrame
        XCTAssertEqual(cartesianFrame.x, 36.384545893107884, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, -36.384545893107884, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 134.7912842353081, accuracy: 0.0001)
        var absoluteFrame = values.plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 211.38454589310788, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 211.38454589310788, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 134.7912842353081, accuracy: 0.0001)

        let wedge02 = Wedge(sector: .sector2, radius: values.radius)
        cartesianFrame = WedgeControl(wedge: wedge02).cartesianFrame
        XCTAssertEqual(cartesianFrame.x, -171.17583012841598, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, -36.384545893107884, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 134.7912842353081, accuracy: 0.0001)
        absoluteFrame = values.plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 3.8241698715840187, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 211.38454589310788, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 134.7912842353081, accuracy: 0.0001)

        let wedge03 = Wedge(sector: .sector3, radius: values.radius)
        cartesianFrame = WedgeControl(wedge: wedge03).cartesianFrame
        XCTAssertEqual(cartesianFrame.x, -171.17583012841598, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, 171.17583012841598, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 134.7912842353081, accuracy: 0.0001)
        absoluteFrame = values.plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 3.8241698715840187, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 3.8241698715840187, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 134.7912842353081, accuracy: 0.0001)

        let wedge04 = Wedge(sector: .sector4, radius: values.radius)
        cartesianFrame = WedgeControl(wedge: wedge04).cartesianFrame
        XCTAssertEqual(cartesianFrame.x, 36.384545893107884, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, 171.17583012841598, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 134.7912842353081, accuracy: 0.0001)
        absoluteFrame = values.plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 211.38454589310788, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 3.8241698715840187, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 134.7912842353081, accuracy: 0.0001)

        let up = Direction(cardinal: .up, interiorRadius: values.cruxRadius + values.spacing, exteriorRadius: values.radius)
        cartesianFrame = DirectionControl(direction: up).cartesianFrame
        XCTAssertEqual(cartesianFrame.x, -30.388431091712807, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, 175.0, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 60.776862183425614, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 139.6586432228636, accuracy: 0.0001)
        absoluteFrame = values.plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 144.61156890828718, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 0.0, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 60.776862183425614, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 139.6586432228636, accuracy: 0.0001)

        let left = Direction(cardinal: .left, interiorRadius: values.cruxRadius + values.spacing, exteriorRadius: values.radius)
        cartesianFrame = DirectionControl(direction: left).cartesianFrame
        XCTAssertEqual(cartesianFrame.x, -175.0, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, 30.388431091712807, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 139.6586432228636, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 60.776862183425614, accuracy: 0.0001)
        absoluteFrame = values.plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 0.0, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 144.61156890828718, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 139.6586432228636, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 60.776862183425614, accuracy: 0.0001)

        let right = Direction(cardinal: .right, interiorRadius: values.cruxRadius + values.spacing, exteriorRadius: values.radius)
        cartesianFrame = DirectionControl(direction: right).cartesianFrame
        XCTAssertEqual(cartesianFrame.x, 35.34135677713641, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, 30.388431091712807, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 139.6586432228636, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 60.776862183425614, accuracy: 0.0001)
        absoluteFrame = values.plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 210.3413567771364, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 144.61156890828718, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 139.6586432228636, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 60.776862183425614, accuracy: 0.0001)

        let down = Direction(cardinal: .down, interiorRadius: values.cruxRadius + values.spacing, exteriorRadius: values.radius)
        cartesianFrame = DirectionControl(direction: down).cartesianFrame
        XCTAssertEqual(cartesianFrame.x, -30.388431091712807, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, -35.34135677713641, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 60.776862183425614, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 139.6586432228636, accuracy: 0.0001)
        absoluteFrame = values.plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 144.61156890828718, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 210.3413567771364, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 60.776862183425614, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 139.6586432228636, accuracy: 0.0001)
    }
}
