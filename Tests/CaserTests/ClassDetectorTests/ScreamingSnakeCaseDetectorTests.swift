//
//  ScreamingSnakeCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class ScreamingSnakeCaseDetectorTests: XCTestCase {

    func testScreamingSnakeCaseDetector() {
        let detector = ScreamingSnakeCaseDetector()
        
        XCTAssertTrue(detector.detect("SCREAMING_SNAKE_CASE"))
        XCTAssertFalse(detector.detect("ScreamingSnakeCase"))
        XCTAssertFalse(detector.detect("screaming_snake_case"))
        XCTAssertFalse(detector.detect("screamingsnakecase"))
        XCTAssertFalse(detector.detect("SCREAMING_Snake_CASE"))
        XCTAssertFalse(detector.detect("SCREAMINGSNAKECASE"))
        XCTAssertFalse(detector.detect("SCREAMING-SNAKE-CASE"))
        XCTAssertFalse(detector.detect("SCREAMING.SNAKE.CASE"))
        XCTAssertFalse(detector.detect(""))
        XCTAssertFalse(detector.detect("___"))
    }
}
