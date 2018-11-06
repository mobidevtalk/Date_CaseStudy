import UIKit
import XCTest

struct Logger{
    static let JsonFileName = "Log"
}

class LogTests: XCTestCase{
    func testSetup() {
        XCTAssert(true , "Things are not ok 🤯")
    }
    
    // MARK: - Json
    func test_jsonFile_exits() {
        XCTAssertNotNil(Bundle.main.path(forResource: Logger.JsonFileName, ofType: ".json"), "👎 json file does not exits")
    }
    
    func test_jsonFile_contains_jsonData() {
        if let url = Bundle.main.url(forResource: Logger.JsonFileName, withExtension: "json") , let data = try? Data(contentsOf:url, options: .mappedIfSafe){
            XCTAssertNotNil(try JSONSerialization.jsonObject(with: data, options: .mutableLeaves), "👎 json file contains no json-object")
        }else{
            XCTAssert(true, "👎 File not found")
        }
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
