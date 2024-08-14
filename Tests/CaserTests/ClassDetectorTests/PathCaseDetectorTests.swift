//
//  PathCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

final class PathCaseDetectorTests: XCTestCase {
    
    let detector = PathCaseDetector()
    
    func testDetect_whenPathCase_shouldReturnPathCase() {
        let result = try? detector.detect("path/case/example")
        XCTAssertEqual(result, .pathCase)
    }
    
    func testDetect_whenUppercaseLetters_shouldReturnNil() {
        let result = try? detector.detect("Path/Case/Example")
        XCTAssertNil(result)
    }
    
    func testDetect_whenMixedCase_shouldReturnNil() {
        let result = try? detector.detect("path/Case/Example")
        XCTAssertNil(result)
    }
    
    func testDetect_whenNoSlashes_shouldReturnNil() {
        let result = try? detector.detect("pathcaseexample")
        XCTAssertNil(result)
    }
    
    func testDetect_whenContainsUnderscore_shouldReturnNil() {
        let result = try? detector.detect("path_case/example")
        XCTAssertNil(result)
    }
    
    func testDetect_whenContainsDots_shouldReturnNil() {
        let result = try? detector.detect("path.case.example")
        XCTAssertNil(result)
    }
    
    func testDetect_whenEmptyString_shouldReturnNil() {
        let result = try? detector.detect("")
        XCTAssertNil(result)
    }
    
    func testDetect_whenOnlySlashes_shouldReturnNil() {
        let result = try? detector.detect("///")
        XCTAssertNil(result)
    }
    
    func testDetect_whenPathContainsUppercase_shouldReturnNil() {
        let result = try? detector.detect("path/CASE/example")
        XCTAssertNil(result)
    }
}
