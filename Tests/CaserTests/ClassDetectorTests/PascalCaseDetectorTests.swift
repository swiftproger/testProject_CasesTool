//
//  PascalCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool


import XCTest

class PascalCaseDetectorTests: XCTestCase {

    func testPascalCaseDetector() {
        let detector = PascalCaseDetector()
        
        XCTAssertTrue(detector.detect("PascalCaseString"))
        XCTAssertFalse(detector.detect("pascalCaseString"))
        XCTAssertFalse(detector.detect("pascal_case_string"))
        XCTAssertFalse(detector.detect("pascalcasestring"))
        XCTAssertFalse(detector.detect("PASCALCASEEXAMPLE"))
        XCTAssertFalse(detector.detect("Pascal_Case_Example"))
        XCTAssertFalse(detector.detect("Pascal_CaseExample"))
        XCTAssertFalse(detector.detect(""))
    }
}
