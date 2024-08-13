//
//  TrainCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

final class TrainCaseDetectorTests: XCTestCase {

    func testDetect_whenTrainCase_shouldReturnTrainCase() {
        let detector = TrainCaseDetector()
        let result = try? detector.detect("Train-Case-Example")
        XCTAssertEqual(result, .trainCase)
    }

    func testDetect_whenAllLowercase_shouldReturnNil() {
        let detector = TrainCaseDetector()
        let result = try? detector.detect("train-case-example")
        XCTAssertNil(result)
    }

    func testDetect_whenMixedCase_shouldReturnNil() {
        let detector = TrainCaseDetector()
        let result = try? detector.detect("Train-case-Example")
        XCTAssertNil(result)
    }

    func testDetect_whenNoHyphens_shouldReturnNil() {
        let detector = TrainCaseDetector()
        let result = try? detector.detect("TrainCaseExample")
        XCTAssertNil(result)
    }

    func testDetect_whenContainsUnderscore_shouldReturnNil() {
        let detector = TrainCaseDetector()
        let result = try? detector.detect("Train_Case_Example")
        XCTAssertNil(result)
    }

    func testDetect_whenContainsDots_shouldReturnNil() {
        let detector = TrainCaseDetector()
        let result = try? detector.detect("Train.Case.Example")
        XCTAssertNil(result)
    }

    func testDetect_whenEmptyString_shouldReturnNil() {
        let detector = TrainCaseDetector()
        let result = try? detector.detect("")
        XCTAssertNil(result)
    }

    func testDetect_whenOnlyHyphens_shouldReturnNil() {
        let detector = TrainCaseDetector()
        let result = try? detector.detect("---")
        XCTAssertNil(result)
    }

    func testDetect_whenTrainCaseWithUppercaseWords_shouldReturnTrainCase() {
        let detector = TrainCaseDetector()
        let result = try? detector.detect("Train-CASE-Example")
        XCTAssertEqual(result, .trainCase)
    }
}
