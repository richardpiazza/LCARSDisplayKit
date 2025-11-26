import GraphPoint
@testable import LCARSDisplayKit
import Swift2D
import XCTest

final class DPadValuesTests: XCTestCase {
    
    let iPadLandscape = Size(width: 1376.0, height: 975.0)
    let iPadPortrait = Size(width: 1032.0, height: 1319.0)
    
    func testDPadViewValues() {
        var values = DPadValues(
            size: Size(width: 350.0, height: 350.0),
            intrinsicSize: DPadView.intrinsicSize
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
        
        values = DPadValues(
            size: Size(width: 700.0, height: 700.0),
            intrinsicSize: DPadView.intrinsicSize
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
        
        values = DPadValues(
            size: Size(width: 100.0, height: 100.0),
            intrinsicSize: DPadView.intrinsicSize
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
        
        values = DPadValues(
            size: Size(width: 500.0, height: 1000.0),
            intrinsicSize: DPadView.intrinsicSize
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
        
        values = DPadValues(
            size: Size(width: 1000.0, height: 500.0),
            intrinsicSize: DPadView.intrinsicSize
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
        var values = DPadValues(
            size: iPadLandscape,
            intrinsicSize: DPadClusterView.intrinsicSize
        )
        
        XCTAssertEqual(values.plane.width, 1185.6, accuracy: 0.01)
        XCTAssertEqual(values.plane.height, 975.0)
        
        values = DPadValues(
            size: iPadPortrait,
            intrinsicSize: DPadClusterView.intrinsicSize
        )
        
        XCTAssertEqual(values.plane.width, 1032.0, accuracy: 0.01)
        XCTAssertEqual(values.plane.height, 848.68, accuracy: 0.01)
    }
    
    func testClusterStackedView() {
        var values = DPadValues(
            size: iPadPortrait,
            intrinsicSize: DPadClusterStackedView.intrinsicSize
        )
        
        XCTAssertEqual(values.plane.width, 543.51, accuracy: 0.01)
        XCTAssertEqual(values.plane.height, 1319.0)
        
        values = DPadValues(
            size: iPadLandscape,
            intrinsicSize: DPadClusterStackedView.intrinsicSize
        )
        
        XCTAssertEqual(values.plane.width, 401.76, accuracy: 0.01)
        XCTAssertEqual(values.plane.height, 975.0, accuracy: 0.01)
    }
}
