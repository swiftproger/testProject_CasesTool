//
//  DotCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class DotCaseDetectorTests: XCTestCase {

    func testDotCaseDetector() {
        let detector = DotCaseDetector()
        
        XCTAssertTrue(detector.detect("dot.case.string"))
        XCTAssertFalse(detector.detect("DotCaseString"))
        XCTAssertFalse(detector.detect("dot._case_string"))
        XCTAssertFalse(detector.detect("dotcasestring"))
        XCTAssertFalse(detector.detect("Dot.Case.Example"))
        XCTAssertFalse(detector.detect("Dot.case.example"))
        XCTAssertFalse(detector.detect("dot.case_example"))
        XCTAssertFalse(detector.detect(""))
        XCTAssertFalse(detector.detect("..."))
    }
}
