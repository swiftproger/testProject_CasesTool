//
//  DotCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

//final class DotCaseDetectorTests: XCTestCase {
//    
//    let detector = DotCaseDetector()
//    
//    func testDetect_whenDotCase_shouldReturnDotCase() {
//        let result = try? detector.detect("dot.case.example")
//        XCTAssertEqual(result, .dotCase)
//    }
//    
//    func testDetect_whenUppercaseDotCase_shouldReturnNil() {
//        let result = try? detector.detect("Dot.Case.Example")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenMixedCase_shouldReturnNil() {
//        let result = try? detector.detect("Dot.case.example")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenNoDots_shouldReturnNil() {
//        let result = try? detector.detect("nocaseexample")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenContainsUnderscore_shouldReturnNil() {
//        let result = try? detector.detect("dot.case_example")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenContainsHyphen_shouldReturnNil() {
//        let result = try? detector.detect("dot-case-example")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenEmptyString_shouldReturnNil() {
//        let result = try? detector.detect("")
//        XCTAssertNil(result)
//    }
//    
//    func testDetect_whenOnlyDots_shouldReturnNil() {
//        let result = try? detector.detect("...")
//        XCTAssertNil(result)
//    }
//}
