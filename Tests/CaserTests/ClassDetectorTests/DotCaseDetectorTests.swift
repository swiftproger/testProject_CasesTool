//
//  DotCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class DotCaseDetectorTests: XCTestCase {

    func testDotCaseDetector() {
        let detector = DotCaseDetector()
        
        XCTAssertTrue(detector.detect("dot.case.string", for: .dotCase))
        XCTAssertFalse(detector.detect("DotCaseString", for: .dotCase))
        XCTAssertFalse(detector.detect("dot_case_string", for: .dotCase))
        XCTAssertFalse(detector.detect("dotcasestring", for: .dotCase))
        XCTAssertFalse(detector.detect("Dot.Case.Example", for: .dotCase))
        XCTAssertFalse(detector.detect("Dot.case.example", for: .dotCase))
        XCTAssertFalse(detector.detect("dot.case_example", for: .dotCase))
        XCTAssertFalse(detector.detect("", for: .dotCase))
        XCTAssertFalse(detector.detect("...", for: .dotCase))
    }
}
