import Foundation
import GraphPoint
@testable import LCARSDisplayKit
import Swift2D
import XCTest

final class DPadValuesTests: XCTestCase {
    
    func testDPadViewValues() {
        let intrinsicSize = CGSize(width: 350, height: 350.0)
        
        var values = DPadValues(
            size: CGSize(width: 350.0, height: 350.0),
            intrinsicSize: intrinsicSize
        )
        
        XCTAssertEqual(values.plane.width, 350.0, accuracy: 0.1)
        XCTAssertEqual(values.plane.height, 350.0, accuracy: 0.1)
        XCTAssertEqual(values.diameter, 350.0, accuracy: 0.1)
        XCTAssertEqual(values.radius, 175.0, accuracy: 0.1)
        XCTAssertEqual(values.scale, 1.0, accuracy: 0.1)
        XCTAssertEqual(values.spacing, 8.0, accuracy: 0.1)
        XCTAssertEqual(values.cruxRadius, 30.0, accuracy: 0.1)
        XCTAssertEqual(values.cartesianOffset.x, 0.0, accuracy: 0.1)
        XCTAssertEqual(values.cartesianOffset.y, 0.0, accuracy: 0.1)
        
        values = DPadValues(
            size: CGSize(width: 700.0, height: 700.0),
            intrinsicSize: intrinsicSize
        )
        
        XCTAssertEqual(values.plane.width, 700.0, accuracy: 0.1)
        XCTAssertEqual(values.plane.height, 700.0, accuracy: 0.1)
        XCTAssertEqual(values.diameter, 700.0, accuracy: 0.1)
        XCTAssertEqual(values.radius, 350.0, accuracy: 0.1)
        XCTAssertEqual(values.scale, 2.0, accuracy: 0.1)
        XCTAssertEqual(values.spacing, 16.0, accuracy: 0.1)
        XCTAssertEqual(values.cruxRadius, 60.0, accuracy: 0.1)
        XCTAssertEqual(values.cartesianOffset.x, 0.0, accuracy: 0.1)
        XCTAssertEqual(values.cartesianOffset.y, 0.0, accuracy: 0.1)
        
        values = DPadValues(
            size: CGSize(width: 100.0, height: 100.0),
            intrinsicSize: intrinsicSize
        )
        
        XCTAssertEqual(values.plane.width, 100.0, accuracy: 0.1)
        XCTAssertEqual(values.plane.height, 100.0, accuracy: 0.1)
        XCTAssertEqual(values.diameter, 100.0, accuracy: 0.1)
        XCTAssertEqual(values.radius, 50.0, accuracy: 0.1)
        XCTAssertEqual(values.scale, 0.2857, accuracy: 0.1)
        XCTAssertEqual(values.spacing, 2.2857, accuracy: 0.1)
        XCTAssertEqual(values.cruxRadius, 8.5714, accuracy: 0.1)
        XCTAssertEqual(values.cartesianOffset.x, 0.0, accuracy: 0.1)
        XCTAssertEqual(values.cartesianOffset.y, 0.0, accuracy: 0.1)
        
        values = DPadValues(
            size: CGSize(width: 500.0, height: 1000.0),
            intrinsicSize: intrinsicSize
        )
        
        XCTAssertEqual(values.plane.width, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.plane.height, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.diameter, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.radius, 250.0, accuracy: 0.1)
        XCTAssertEqual(values.scale, 1.4285, accuracy: 0.1)
        XCTAssertEqual(values.spacing, 11.4285, accuracy: 0.1)
        XCTAssertEqual(values.cruxRadius, 42.8571, accuracy: 0.1)
        XCTAssertEqual(values.cartesianOffset.x, 0.0, accuracy: 0.1)
        XCTAssertEqual(values.cartesianOffset.y, 0.0, accuracy: 0.1)
        
        values = DPadValues(
            size: CGSize(width: 1000.0, height: 500.0),
            intrinsicSize: intrinsicSize
        )
        
        XCTAssertEqual(values.plane.width, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.plane.height, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.diameter, 500.0, accuracy: 0.1)
        XCTAssertEqual(values.radius, 250.0, accuracy: 0.1)
        XCTAssertEqual(values.scale, 1.4285, accuracy: 0.1)
        XCTAssertEqual(values.spacing, 11.4285, accuracy: 0.1)
        XCTAssertEqual(values.cruxRadius, 42.8571, accuracy: 0.1)
        XCTAssertEqual(values.cartesianOffset.x, 0.0, accuracy: 0.1)
        XCTAssertEqual(values.cartesianOffset.y, 0.0, accuracy: 0.1)
    }
    
}
