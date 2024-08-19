//
//  ScreamingSnakeCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class ScreamingSnakeCaseDetectorTests: XCTestCase {

    func testScreamingSnakeCaseDetector() {
        let detector = ScreamingSnakeCaseDetector()
        
        XCTAssertTrue(detector.detect("SCREAMING_SNAKE_CASE", for: .screamingSnakeCase))
        XCTAssertFalse(detector.detect("ScreamingSnakeCase", for: .screamingSnakeCase))
        XCTAssertFalse(detector.detect("screaming_snake_case", for: .screamingSnakeCase))
        XCTAssertFalse(detector.detect("screamingsnakecase", for: .screamingSnakeCase))
        XCTAssertFalse(detector.detect("SCREAMING_Snake_CASE", for: .screamingSnakeCase))
        XCTAssertFalse(detector.detect("SCREAMINGSNAKECASE", for: .screamingSnakeCase))
        XCTAssertFalse(detector.detect("SCREAMING-SNAKE-CASE", for: .screamingSnakeCase))
        XCTAssertFalse(detector.detect("SCREAMING.SNAKE.CASE", for: .screamingSnakeCase))
        XCTAssertFalse(detector.detect("", for: .screamingSnakeCase))
        XCTAssertFalse(detector.detect("___", for: .screamingSnakeCase))
    }
}
