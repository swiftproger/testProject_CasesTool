//
//  CamelCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class CamelCaseDetectorTests: XCTestCase {

    func testCamelCaseDetector() {
        let detector = CamelCaseDetector()
        
        XCTAssertTrue(detector.detect("camelCaseExample"))
        XCTAssertFalse(detector.detect("lowercasestring"))
        XCTAssertFalse(detector.detect("CamelCaseExample"))
        XCTAssertFalse(detector.detect("camel-case_example"))
        XCTAssertFalse(detector.detect("camel-caseExample"))
        XCTAssertFalse(detector.detect(""))
    }
}
