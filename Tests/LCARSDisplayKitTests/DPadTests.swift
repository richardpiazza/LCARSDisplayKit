import GraphPoint
@testable import LCARSDisplayKit
import Swift2D
import XCTest

final class DPadTests: XCTestCase {
    
    let intrinsicRect = CGRect(origin: .zero, size: CGSize(width: 350.0, height: 350.0))
    let canvasRect = CGRect(origin: .zero, size: CGSize(width: 2560.0, height: 1440.0))
    
    func testIntrinsicValues() {
        let (diameter, radius, scale, spacing, cruxRadius) = intrinsicRect.size.dPadValues()
        XCTAssertEqual(diameter, 350.0)
        XCTAssertEqual(radius, 175.0)
        XCTAssertEqual(scale, 1.0)
        XCTAssertEqual(spacing, 8.0)
        XCTAssertEqual(cruxRadius, 30.0)
    }
    
    func testCanvasValues() {
        let (diameter, radius, scale, spacing, cruxRadius) = canvasRect.size.dPadValues()
        XCTAssertEqual(diameter, 1440.0)
        XCTAssertEqual(radius, 720.0)
        XCTAssertEqual(scale, 4.114285714285714, accuracy: 0.0001)
        XCTAssertEqual(spacing, 32.91428571428571, accuracy: 0.0001)
        XCTAssertEqual(cruxRadius, 123.42857142857142, accuracy: 0.0001)
    }
    
    func testIntrinsicFrames() {
        let plane = CartesianPlane(intrinsicRect)
        let (_, radius, _, spacing, cruxRadius) = intrinsicRect.size.dPadValues()
        
        let wedge01 = Wedge(sector: .sector01, radius: radius)
        var cartesianFrame = wedge01.cartesianFrame
        XCTAssertEqual(cartesianFrame.x, 36.384545893107884, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, -36.384545893107884, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 134.7912842353081, accuracy: 0.0001)
        var absoluteFrame = plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 211.38454589310788, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 211.38454589310788, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 134.7912842353081, accuracy: 0.0001)
        
        let wedge02 = Wedge(sector: .sector02, radius: radius)
        cartesianFrame = wedge02.cartesianFrame
        XCTAssertEqual(cartesianFrame.x, -171.17583012841598, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, -36.384545893107884, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 134.7912842353081, accuracy: 0.0001)
        absoluteFrame = plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 3.8241698715840187, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 211.38454589310788, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 134.7912842353081, accuracy: 0.0001)
        
        let wedge03 = Wedge(sector: .sector03, radius: radius)
        cartesianFrame = wedge03.cartesianFrame
        XCTAssertEqual(cartesianFrame.x, -171.17583012841598, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, 171.17583012841598, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 134.7912842353081, accuracy: 0.0001)
        absoluteFrame = plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 3.8241698715840187, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 3.8241698715840187, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 134.7912842353081, accuracy: 0.0001)
        
        let wedge04 = Wedge(sector: .sector04, radius: radius)
        cartesianFrame = wedge04.cartesianFrame
        XCTAssertEqual(cartesianFrame.x, 36.384545893107884, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, 171.17583012841598, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 134.7912842353081, accuracy: 0.0001)
        absoluteFrame = plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 211.38454589310788, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 3.8241698715840187, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 134.7912842353081, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 134.7912842353081, accuracy: 0.0001)
        
        let up = Direction(.up, interiorRadius: cruxRadius + spacing, exteriorRadius: radius)
        cartesianFrame = up.cartesianFrame
        XCTAssertEqual(cartesianFrame.x, -30.388431091712807, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, 175.0, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 60.776862183425614, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 139.6586432228636, accuracy: 0.0001)
        absoluteFrame = plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 144.61156890828718, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 0.0, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 60.776862183425614, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 139.6586432228636, accuracy: 0.0001)
        
        let left = Direction(.left, interiorRadius: cruxRadius + spacing, exteriorRadius: radius)
        cartesianFrame = left.cartesianFrame
        XCTAssertEqual(cartesianFrame.x, -175.0, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, 30.388431091712807, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 139.6586432228636, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 60.776862183425614, accuracy: 0.0001)
        absoluteFrame = plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 0.0, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 144.61156890828718, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 139.6586432228636, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 60.776862183425614, accuracy: 0.0001)
        
        let right = Direction(.right, interiorRadius: cruxRadius + spacing, exteriorRadius: radius)
        cartesianFrame = right.cartesianFrame
        XCTAssertEqual(cartesianFrame.x, 35.34135677713641, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, 30.388431091712807, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 139.6586432228636, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 60.776862183425614, accuracy: 0.0001)
        absoluteFrame = plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 210.3413567771364, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 144.61156890828718, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 139.6586432228636, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 60.776862183425614, accuracy: 0.0001)
        
        let down = Direction(.down, interiorRadius: cruxRadius + spacing, exteriorRadius: radius)
        cartesianFrame = down.cartesianFrame
        XCTAssertEqual(cartesianFrame.x, -30.388431091712807, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.y, -35.34135677713641, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.width, 60.776862183425614, accuracy: 0.0001)
        XCTAssertEqual(cartesianFrame.height, 139.6586432228636, accuracy: 0.0001)
        absoluteFrame = plane.rect(for: cartesianFrame)
        XCTAssertEqual(absoluteFrame.x, 144.61156890828718, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.y, 210.3413567771364, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.width, 60.776862183425614, accuracy: 0.0001)
        XCTAssertEqual(absoluteFrame.height, 139.6586432228636, accuracy: 0.0001)
    }
}
