//
//  ScreamingSnakeCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

//final class ScreamingSnakeCaseDetectorTests: XCTestCase {
//    
//    let detector = ScreamingSnakeCaseDetector()
//    
//    func testDetect_whenScreamingSnakeCase_shouldReturnScreamingSnakeCase() {
//        let result = try? detector.detect("SCREAMING_SNAKE_CASE")
//        XCTAssertEqual(result, .screamingSnakeCase)
//    }
//    
//    func testDetect_whenLowercaseLetters_shouldReturnNil() {
//        let result = try? detector.detect("screaming_snake_case")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenMixedCase_shouldReturnNil() {
//        let result = try? detector.detect("SCREAMING_Snake_CASE")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenNoUnderscores_shouldReturnNil() {
//        let result = try? detector.detect("SCREAMINGSNAKECASE")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenContainsHyphens_shouldReturnNil() {
//        let result = try? detector.detect("SCREAMING-SNAKE-CASE")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenContainsDots_shouldReturnNil() {
//        let result = try? detector.detect("SCREAMING.SNAKE.CASE")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenEmptyString_shouldReturnNil() {
//        let result = try? detector.detect("")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenOnlyUnderscores_shouldReturnNil() {
//        let result = try? detector.detect("___")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenScreamingSnakeCaseWithNumbers_shouldReturnScreamingSnakeCase() {
//        let result = try? detector.detect("SCREAMING_SNAKE_123")
//        XCTAssertEqual(result, .screamingSnakeCase)
//    }
//}
