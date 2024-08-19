//
//  TrainCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class TrainCaseDetectorTests: XCTestCase {

    func testTrainCaseDetector() {
        let detector = TrainCaseDetector()
        
        XCTAssertTrue(detector.detect("Train-Case-String", for: .trainCase))
        XCTAssertFalse(detector.detect("train-case-string", for: .trainCase))
        XCTAssertFalse(detector.detect("Train_Case_String", for: .trainCase))
        XCTAssertFalse(detector.detect("TrainCaseExample", for: .trainCase))
        XCTAssertFalse(detector.detect("Train.Case.Example", for: .trainCase))
        XCTAssertFalse(detector.detect("", for: .trainCase))
        XCTAssertFalse(detector.detect("---", for: .trainCase))
    }
}
