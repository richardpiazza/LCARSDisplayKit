import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    var allTests: [XCTestCaseEntry] = []
    allTests.append(testCase(GenericTests.allTests))
    return allTests
}
#endif
