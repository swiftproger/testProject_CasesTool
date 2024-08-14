//
//  SnakeCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

final class SnakeCaseDetectorTests: XCTestCase {
    
    let detector = SnakeCaseDetector()
    
    func testDetect_whenSnakeCase_shouldReturnSnakeCase() {
        let result = try? detector.detect("snake_case_example")
        XCTAssertEqual(result, .snakeCase)
    }
    
    func testDetect_whenUppercaseLetters_shouldReturnNil() {
        let result = try? detector.detect("Snake_Case_Example")
        XCTAssertNil(result)
    }
    
    func testDetect_whenMixedCase_shouldReturnNil() {
        let result = try? detector.detect("snake_Case_example")
        XCTAssertNil(result)
    }
    
    func testDetect_whenNoUnderscores_shouldReturnNil() {
        let result = try? detector.detect("snakecaseexample")
        XCTAssertNil(result)
    }
    
    func testDetect_whenContainsHyphens_shouldReturnNil() {
        let result = try? detector.detect("snake-case-example")
        XCTAssertNil(result)
    }
    
    func testDetect_whenContainsDots_shouldReturnNil() {
        let result = try? detector.detect("snake.case.example")
        XCTAssertNil(result)
    }
    
    func testDetect_whenEmptyString_shouldReturnNil() {
        let result = try? detector.detect("")
        XCTAssertNil(result)
    }
    
    func testDetect_whenOnlyUnderscores_shouldReturnNil() {
        let result = try? detector.detect("___")
        XCTAssertNil(result)
    }
    
    func testDetect_whenSnakeCaseWithNumbers_shouldReturnSnakeCase() {
        let result = try? detector.detect("snake_case_123")
        XCTAssertEqual(result, .snakeCase)
    }
}
