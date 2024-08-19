//
//  PathCaseDetectorTests.swift
//

import XCTest
@testable import cases_tool

class PathCaseDetectorTests: XCTestCase {

    func testPathCaseDetector() {
        let detector = PathCaseDetector()
        
        XCTAssertTrue(detector.detect("path/case/string", for: .pathCase))
        XCTAssertFalse(detector.detect("PathCaseString", for: .pathCase))
        XCTAssertFalse(detector.detect("path_case_string", for: .pathCase))
        XCTAssertFalse(detector.detect("pathcasestring", for: .pathCase))
        XCTAssertFalse(detector.detect("Path/Case/Example", for: .pathCase))
        XCTAssertFalse(detector.detect("path/Case/Example", for: .pathCase))
        XCTAssertFalse(detector.detect("path_case/example", for: .pathCase))
        XCTAssertFalse(detector.detect("path.case.example", for: .pathCase))
        XCTAssertFalse(detector.detect("", for: .pathCase))
        XCTAssertFalse(detector.detect("///", for: .pathCase))
    }
}
