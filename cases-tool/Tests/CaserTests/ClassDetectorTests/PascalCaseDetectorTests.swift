//
//  PascalCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

final class PascalCaseDetectorTests: XCTestCase {

    let detector = PascalCaseDetector()
    
    func testDetect_whenPascalCase_shouldReturnPascalCase() {
        let result = try? detector.detect("PascalCaseExample")
        XCTAssertEqual(result, .pascalCase)
    }

    func testDetect_whenLowercaseFirstLetter_shouldReturnNil() {
        let result = try? detector.detect("pascalCaseExample")
        XCTAssertNil(result)
    }

    func testDetect_whenAllUppercase_shouldReturnNil() {
        let result = try? detector.detect("PASCALCASEEXAMPLE")
        XCTAssertNil(result)
    }

    func testDetect_whenContainsSeparator_shouldReturnNil() {
        let result = try? detector.detect("Pascal_Case_Example")
        XCTAssertNil(result)
    }

    func testDetect_whenMixedCaseWithUnderscore_shouldReturnNil() {
        let result = try? detector.detect("Pascal_CaseExample")
        XCTAssertNil(result)
    }

    func testDetect_whenEmptyString_shouldReturnNil() {
        let result = try? detector.detect("")
        XCTAssertNil(result)
    }

    func testDetect_whenStartsWithLowercase_shouldReturnNil() {
        let result = try? detector.detect("pascalCaseExample")
        XCTAssertNil(result)
    }
}
