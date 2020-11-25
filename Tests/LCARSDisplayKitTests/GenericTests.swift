import XCTest
@testable import GraphPoint
@testable import LCARSDisplayKit

class GenericTests: XCTestCase {
    
    static var allTests = [
        ("testExample", testExample)
    ]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
    }
    
    #if (os(macOS) || os(iOS) || os(tvOS) || os(watchOS))
    
    func testOuterRing05() {
        let secondRingInteriorRadius = CGFloat(290.19289459)
        let secondRingExteriorRadius = CGFloat(340.57360394)
        let startDegree = CGFloat(81.5)
        let endDegree = CGFloat(97.5)
        
        let crescent = Crescent(innerRadius: secondRingInteriorRadius, outerRadius: secondRingExteriorRadius, startDegree: startDegree, endDegree: endDegree)
        
        let graphPoints = crescent.graphPoints
        
        XCTAssertTrue((graphPoints[0].x - 42.8932408633451) < 0.01)
        XCTAssertTrue((graphPoints[0].y - -287.005376184423) < 0.01)
        XCTAssertTrue((graphPoints[1].x - -37.8777735401475) < 0.01)
        XCTAssertTrue((graphPoints[1].y - -287.710254148447) < 0.01)
        XCTAssertTrue((graphPoints[2].x - 50.3399838446606) < 0.01)
        XCTAssertTrue((graphPoints[2].y - -336.832696938999) < 0.01)
        XCTAssertTrue((graphPoints[3].x - -44.4537756929482) < 0.01)
        XCTAssertTrue((graphPoints[3].y - -337.659949545872) < 0.01)
        
        let graphFrame = crescent.graphFrame
        
        XCTAssertTrue((graphFrame.origin.x - -44.4537756929482) < 0.01)
        XCTAssertTrue((graphFrame.origin.y - -287.005376184423) < 0.01)
        XCTAssertTrue((graphFrame.size.width - 94.7937595376088) < 0.01)
        XCTAssertTrue((graphFrame.size.height - 53.5682277555774) < 0.01)
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 794.0, height: 794.0)
        let frame = rect.frame(graphFrame: graphFrame, offset: GraphOriginOffset(x: 0, y: 0))
        
        XCTAssertTrue((frame.origin.x - 352.546224307052) < 0.01)
        XCTAssertTrue((frame.origin.y - 684.005376184423) < 0.01)
        XCTAssertTrue((frame.size.width - 94.7937595376088) < 0.01)
        XCTAssertTrue((frame.size.height - 53.5682277555774) < 0.01)
    }
    
    func testOuterRingExtended19() {
        let secondRingInteriorRadius = CGFloat(290.19289459)
        let secondRingExteriorRadiusExtended = CGFloat(397.0)
        let startDegree = CGFloat(334.5)
        let endDegree = CGFloat(350.5)
        
        let crescent = Crescent(innerRadius: secondRingInteriorRadius, outerRadius: secondRingExteriorRadiusExtended, startDegree: startDegree, endDegree: endDegree)
        
        let graphPoints = crescent.graphPoints
        
        XCTAssertTrue((graphPoints[0].x - 261.923836279824) < 0.01)
        XCTAssertTrue((graphPoints[0].y - 124.931261335915) < 0.01)
        XCTAssertTrue((graphPoints[1].x - 286.213073602529) < 0.01)
        XCTAssertTrue((graphPoints[1].y - 47.8956424898595) < 0.01)
        XCTAssertTrue((graphPoints[2].x - 358.326357886895) < 0.01)
        XCTAssertTrue((graphPoints[2].y - 170.912905432893) < 0.01)
        XCTAssertTrue((graphPoints[3].x - 391.555383810281) < 0.01)
        XCTAssertTrue((graphPoints[3].y - 65.523899526689) < 0.01)
        
        let graphFrame = crescent.graphFrame
        
        XCTAssertTrue((graphFrame.origin.x - 261.923836279824) < 0.01)
        XCTAssertTrue((graphFrame.origin.y - 170.912905432893) < 0.01)
        XCTAssertTrue((graphFrame.size.width - 129.631547530457) < 0.01)
        XCTAssertTrue((graphFrame.size.height - 123.017262943034) < 0.01)
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 794.0, height: 794.0)
        let frame = rect.frame(graphFrame: graphFrame, offset: GraphOriginOffset(x: 0, y: 0))
        
        XCTAssertTrue((frame.origin.x - 658.923836279824) < 0.01)
        XCTAssertTrue((frame.origin.y - 226.087094567107) < 0.01)
        XCTAssertTrue((frame.size.width - 129.631547530457) < 0.01)
        XCTAssertTrue((frame.size.height - 123.017262943034) < 0.01)
    }
    
    #endif
}
