//
//  SnakeCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class SnakeCaseDetectorTests: XCTestCase {

    func testSnakeCaseDetector() {
        let detector = SnakeCaseDetector()
        
        XCTAssertTrue(detector.detect("snake_case_string"))
        XCTAssertFalse(detector.detect("SnakeCaseString"))
        XCTAssertFalse(detector.detect("snake-case-string"))
        XCTAssertFalse(detector.detect("snakecasestring"))
        XCTAssertFalse(detector.detect("Snake_Case_Example"))
        XCTAssertFalse(detector.detect("snake_Case_example"))
        XCTAssertFalse(detector.detect("snake-case-example"))
        XCTAssertFalse(detector.detect("snake.case.example"))
        XCTAssertFalse(detector.detect("snakecasestring"))
        XCTAssertFalse(detector.detect("___"))
        XCTAssertFalse(detector.detect(""))
    }
}
