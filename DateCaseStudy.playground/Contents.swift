import UIKit
import XCTest

struct Logger{
    static let JsonFileName = "Log"
}

class LogTests: XCTestCase{
    func testSetup() {
        XCTAssert(true , "Things are not 👌")
    }
    
    // MARK: - Json
    func test_jsonFile_exits() {
        XCTAssertNotNil(Bundle.main.path(forResource: Logger.JsonFileName, ofType: ".json"))
    }
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
LogTests.defaultTestSuite.run()
