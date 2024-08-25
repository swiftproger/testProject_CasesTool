//
//  KebabCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class KebabCaseDetectorTests: XCTestCase {

    func testKebabCaseDetector() {
        let detector = KebabCaseDetector()
        
        XCTAssertTrue(detector.detect("kebab-case-string"))
        XCTAssertFalse(detector.detect("KebabCaseString"))
        XCTAssertFalse(detector.detect("kebab_case_string"))
        XCTAssertFalse(detector.detect("kebabcasestring"))
        XCTAssertFalse(detector.detect("Kebab-Case-Example"))
        XCTAssertFalse(detector.detect("kebab-Case-example"))
        XCTAssertFalse(detector.detect("kebab.case.example"))
        XCTAssertFalse(detector.detect(""))
        XCTAssertFalse(detector.detect("---"))
    }
}
