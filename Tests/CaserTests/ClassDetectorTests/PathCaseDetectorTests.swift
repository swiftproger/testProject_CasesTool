//
//  PathCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class PathCaseDetectorTests: XCTestCase {

    func testPathCaseDetector() {
        let detector = PathCaseDetector()
        
        XCTAssertTrue(detector.detect("path/case/string"))
        XCTAssertFalse(detector.detect("PathCaseString"))
        XCTAssertFalse(detector.detect("path_case_string"))
        XCTAssertFalse(detector.detect("pathcasestring"))
        XCTAssertFalse(detector.detect("Path/Case/Example"))
        XCTAssertFalse(detector.detect("path/Case/Example"))
        XCTAssertFalse(detector.detect("path_case/example"))
        XCTAssertFalse(detector.detect("path.case.example"))
        XCTAssertFalse(detector.detect(""))
        XCTAssertFalse(detector.detect("///"))
    }
}
