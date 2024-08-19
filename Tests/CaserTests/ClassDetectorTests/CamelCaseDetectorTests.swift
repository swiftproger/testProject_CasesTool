//
//  CamelCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class CamelCaseDetectorTests: XCTestCase {

    func testCamelCaseDetector() {
        let detector = CamelCaseDetector()
        
        XCTAssertTrue(detector.detect("camelCaseExample", for: .camelCase))
        XCTAssertFalse(detector.detect("lowercasestring", for: .camelCase))
        XCTAssertFalse(detector.detect("CamelCaseExample", for: .camelCase))
        XCTAssertFalse(detector.detect("camel-case_example", for: .camelCase))
        XCTAssertFalse(detector.detect("camel-caseExample", for: .camelCase))
        XCTAssertFalse(detector.detect("", for: .camelCase))
    }
}
