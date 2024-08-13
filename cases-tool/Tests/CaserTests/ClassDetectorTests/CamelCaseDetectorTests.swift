//
//  CamelCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

final class CamelCaseDetectorTests: XCTestCase {

    let detector = CamelCaseDetector()
    
    func testDetect_whenCamelCase_shouldReturnCamelCase() {
        let result = try? detector.detect("camelCaseExample")
        XCTAssertEqual(result, .camelCase)
    }

    func testDetect_whenLowercaseString_shouldReturnNil() {
        let result = try? detector.detect("lowercasestring")
        XCTAssertNil(result)
    }

    func testDetect_whenUpperCamelCase_shouldReturnNil() {
        let result = try? detector.detect("CamelCaseExample")
        XCTAssertNil(result)
    }

    func testDetect_whenStringWithUnderscores_shouldReturnNil() {
        let result = try? detector.detect("camel_case_example")
        XCTAssertNil(result)
    }

    func testDetect_whenStringWithHyphens_shouldReturnNil() {
        let result = try? detector.detect("camel-case-example")
        XCTAssertNil(result)
    }

    func testDetect_whenSingleWord_shouldReturnNil() {
        let result = try? detector.detect("singleword")
        XCTAssertNil(result)
    }
    
    func testDetect_whenEmptyString_shouldReturnNil() {
        let result = try? detector.detect("")
        XCTAssertNil(result)
    }
    
    func testDetect_whenStringStartsWithUppercaseLetter_shouldReturnNil() {
        let result = try? detector.detect("CamelCase")
        XCTAssertNil(result)
    }
}
