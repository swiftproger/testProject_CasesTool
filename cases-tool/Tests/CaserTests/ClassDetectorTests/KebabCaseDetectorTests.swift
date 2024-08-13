//
//  KebabCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class KebabCaseDetectorTests: XCTestCase {

    func testDetect_whenKebabCase_shouldReturnKebabCase() {
        let detector = KebabCaseDetector()
        let result = try? detector.detect("kebab-case-example")
        XCTAssertEqual(result, .kebabCase)
    }

    func testDetect_whenUppercaseKebabCase_shouldReturnNil() {
        let detector = KebabCaseDetector()
        let result = try? detector.detect("Kebab-Case-Example")
        XCTAssertNil(result)
    }

    func testDetect_whenMixedCase_shouldReturnNil() {
        let detector = KebabCaseDetector()
        let result = try? detector.detect("kebab-Case-example")
        XCTAssertNil(result)
    }

    func testDetect_whenNoHyphens_shouldReturnNil() {
        let detector = KebabCaseDetector()
        let result = try? detector.detect("kebabcaseexample")
        XCTAssertNil(result)
    }

    func testDetect_whenContainsUnderscore_shouldReturnNil() {
        let detector = KebabCaseDetector()
        let result = try? detector.detect("kebab_case_example")
        XCTAssertNil(result)
    }

    func testDetect_whenContainsDots_shouldReturnNil() {
        let detector = KebabCaseDetector()
        let result = try? detector.detect("kebab.case.example")
        XCTAssertNil(result)
    }

    func testDetect_whenEmptyString_shouldReturnNil() {
        let detector = KebabCaseDetector()
        let result = try? detector.detect("")
        XCTAssertNil(result)
    }

    func testDetect_whenOnlyHyphens_shouldReturnNil() {
        let detector = KebabCaseDetector()
        let result = try? detector.detect("---")
        XCTAssertNil(result)
    }
}
