import UIKit
import XCTest

// MARK: - OperatingTime
struct OperatingTime: Decodable {
    let start: Date
    let end: Date
}

extension OperatingTime{
    enum CodingKeys: String, CodingKey {
        case start
        case end
    }
}

// MARK: - Operation
struct Operation: Decodable{
    let operatingTime: OperatingTime
    let machineId: String
    let plant: String
}

extension Operation{
    enum CodingKeys: String, CodingKey {
        case operatingTime = "operating_time"
        case machineId = "machine_id"
        case plant = "plant_id"
    }
}

struct Logger{
    static let JsonFileName = "Log"
    
    static var JsonData: Data? {
        guard let url = Bundle.main.url(forResource: Logger.JsonFileName, withExtension: "json") , let data = try? Data(contentsOf:url, options: .mappedIfSafe) else { return nil }
        return data
    }
    
    var operations: [Operation]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        if let data = Logger.JsonData {
            return try? decoder.decode([Operation].self, from: data)
        }
        return nil
    }
    
    
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
        guard let data = Logger.JsonData else {
            XCTAssert(false, "👎 no Data")
            return
        }
        XCTAssertNotNil(try JSONSerialization.jsonObject(with: data, options: .mutableLeaves),
                        "👎 json file contains no json-object")
    }
    
    // MARK: - Json to Custom types
    func test_jsonData_converts_customType() {
        XCTAssertNotNil(Logger().operations)
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
