//
//  PascalCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool


import XCTest

class PascalCaseDetectorTests: XCTestCase {

    func testPascalCaseDetector() {
        let detector = PascalCaseDetector()
        
        XCTAssertTrue(detector.detect("PascalCaseString", for: .pascalCase))
        XCTAssertFalse(detector.detect("pascalCaseString", for: .pascalCase))
        XCTAssertFalse(detector.detect("pascal_case_string", for: .pascalCase))
        XCTAssertFalse(detector.detect("pascalcasestring", for: .pascalCase))
        XCTAssertFalse(detector.detect("PASCALCASEEXAMPLE", for: .pascalCase))
        XCTAssertFalse(detector.detect("Pascal_Case_Example", for: .pascalCase))
        XCTAssertFalse(detector.detect("Pascal_CaseExample", for: .pascalCase))
        XCTAssertFalse(detector.detect("", for: .pascalCase))
    }
}
