//
//  TrainCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class TrainCaseDetectorTests: XCTestCase {

    func testTrainCaseDetector() {
        let detector = TrainCaseDetector()
        
        XCTAssertTrue(detector.detect("Train-Case-String"))
        XCTAssertFalse(detector.detect("train-case-string"))
        XCTAssertFalse(detector.detect("Train_Case_String"))
        XCTAssertFalse(detector.detect("TrainCaseExample"))
        XCTAssertFalse(detector.detect("Train.Case.Example"))
        XCTAssertFalse(detector.detect(""))
        XCTAssertFalse(detector.detect("---"))
    }
}
