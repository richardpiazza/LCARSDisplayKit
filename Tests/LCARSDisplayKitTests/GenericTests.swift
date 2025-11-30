import GraphPoint
@testable import LCARSDisplayKit
import Swift2D
import XCTest

final class GenericTests: XCTestCase {

    func testOuterRing05() {
        let secondRingInteriorRadius = Radius(290.19289459)
        let secondRingExteriorRadius = Radius(340.57360394)
        let startDegree = Degree(81.5)
        let endDegree = Degree(97.5)

        let interiorArc = Arc(radius: secondRingInteriorRadius, startingDegree: startDegree, endingDegree: endDegree)
        let exteriorArc = Arc(radius: secondRingExteriorRadius, startingDegree: startDegree, endingDegree: endDegree)

        let crescent = Crescent(interiorArc: interiorArc, exteriorArc: exteriorArc)
        let control = CrescentControl(crescent: crescent)

        let cartesianPoints = control.cartesianPoints

        XCTAssertEqual(cartesianPoints[0].x, 42.8932408633451, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[0].y, -287.005376184423, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[1].x, -37.8777735401475, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[1].y, -287.710254148447, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[2].x, 50.3399838446606, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[2].y, -336.832696938999, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[3].x, -44.4537756929482, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[3].y, -337.659949545872, accuracy: 0.01)

        let cartesianFrame = control.cartesianFrame

        XCTAssertEqual(cartesianFrame.origin.x, -44.4537756929482, accuracy: 0.01)
        XCTAssertEqual(cartesianFrame.origin.y, -287.005376184423, accuracy: 0.01)
        XCTAssertEqual(cartesianFrame.size.width, 94.7937595376088, accuracy: 0.01)
        XCTAssertEqual(cartesianFrame.size.height, 53.5682277555774, accuracy: 0.01)

        let plane = CartesianPlane(origin: .zero, size: Size(width: 794.0, height: 794.0))
        let rect = plane.rect(for: cartesianFrame)

        XCTAssertEqual(rect.origin.x, 352.546224307052, accuracy: 0.01)
        XCTAssertEqual(rect.origin.y, 684.005376184423, accuracy: 0.01)
        XCTAssertEqual(rect.size.width, 94.7937595376088, accuracy: 0.01)
        XCTAssertEqual(rect.size.height, 53.5682277555774, accuracy: 0.01)
    }

    func testOuterRingExtended19() {
        let secondRingInteriorRadius = Radius(290.19289459)
        let secondRingExteriorRadiusExtended = Radius(397.0)
        let startDegree = Degree(334.5)
        let endDegree = Degree(350.5)

        let interiorArc = Arc(radius: secondRingInteriorRadius, startingDegree: startDegree, endingDegree: endDegree)
        let exteriorArc = Arc(radius: secondRingExteriorRadiusExtended, startingDegree: startDegree, endingDegree: endDegree)

        let crescent = Crescent(interiorArc: interiorArc, exteriorArc: exteriorArc)
        let control = CrescentControl(crescent: crescent)

        let cartesianPoints = control.cartesianPoints

        XCTAssertEqual(cartesianPoints[0].x, 261.923836279824, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[0].y, 124.931261335915, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[1].x, 286.213073602529, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[1].y, 47.8956424898595, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[2].x, 358.326357886895, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[2].y, 170.912905432893, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[3].x, 391.555383810281, accuracy: 0.01)
        XCTAssertEqual(cartesianPoints[3].y, 65.523899526689, accuracy: 0.01)

        let cartesianFrame = control.cartesianFrame

        XCTAssertEqual(cartesianFrame.origin.x, 261.923836279824, accuracy: 0.01)
        XCTAssertEqual(cartesianFrame.origin.y, 170.912905432893, accuracy: 0.01)
        XCTAssertEqual(cartesianFrame.size.width, 129.631547530457, accuracy: 0.01)
        XCTAssertEqual(cartesianFrame.size.height, 123.017262943034, accuracy: 0.01)

        let plane = CartesianPlane(origin: .zero, size: Size(width: 794.0, height: 794.0))
        let rect = plane.rect(for: cartesianFrame)

        XCTAssertEqual(rect.origin.x, 658.923836279824, accuracy: 0.01)
        XCTAssertEqual(rect.origin.y, 226.087094567107, accuracy: 0.01)
        XCTAssertEqual(rect.size.width, 129.631547530457, accuracy: 0.01)
        XCTAssertEqual(rect.size.height, 123.017262943034, accuracy: 0.01)
    }
}
