//
//  SnakeCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class SnakeCaseDetectorTests: XCTestCase {

    func testSnakeCaseDetector() {
        let detector = SnakeCaseDetector()
        
        XCTAssertTrue(detector.detect("snake_case_string", for: .snakeCase))
        XCTAssertFalse(detector.detect("SnakeCaseString", for: .snakeCase))
        XCTAssertFalse(detector.detect("snake-case-string", for: .snakeCase))
        XCTAssertFalse(detector.detect("snakecasestring", for: .snakeCase))
        XCTAssertFalse(detector.detect("Snake_Case_Example", for: .snakeCase))
        XCTAssertFalse(detector.detect("snake_Case_example", for: .snakeCase))
        XCTAssertFalse(detector.detect("snake-case-example", for: .snakeCase))
        XCTAssertFalse(detector.detect("snake.case.example", for: .snakeCase))
        XCTAssertFalse(detector.detect("snakecasestring", for: .snakeCase))
        XCTAssertFalse(detector.detect("___", for: .snakeCase))
        XCTAssertFalse(detector.detect("", for: .snakeCase))
    }
}
