//
//  KebabCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class KebabCaseDetectorTests: XCTestCase {

    func testKebabCaseDetector() {
        let detector = KebabCaseDetector()
        
        XCTAssertTrue(detector.detect("kebab-case-string", for: .kebabCase))
        XCTAssertFalse(detector.detect("KebabCaseString", for: .kebabCase))
        XCTAssertFalse(detector.detect("kebab_case_string", for: .kebabCase))
        XCTAssertFalse(detector.detect("kebabcasestring", for: .kebabCase))
        XCTAssertFalse(detector.detect("Kebab-Case-Example", for: .kebabCase))
        XCTAssertFalse(detector.detect("kebab-Case-example", for: .kebabCase))
        XCTAssertFalse(detector.detect("kebab.case.example", for: .kebabCase))
        XCTAssertFalse(detector.detect("", for: .kebabCase))
        XCTAssertFalse(detector.detect("---", for: .kebabCase))
    }
}
