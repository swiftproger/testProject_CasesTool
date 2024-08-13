//
//  CaseDetectorFactoryTests.swift
//

import XCTest
@testable import cases_tool

final class CaseDetectorFactoryTests: XCTestCase {

    func testDetectCase_whenCamelCase_shouldReturnCamelCase() {
        let factory = CaseDetectorFactory()
        let result = try? factory.detectCase(of: "camelCaseExample")
        XCTAssertEqual(result, .camelCase)
    }

    func testDetectCase_whenSnakeCase_shouldReturnSnakeCase() {
        let factory = CaseDetectorFactory()
        let result = try? factory.detectCase(of: "snake_case_example")
        XCTAssertEqual(result, .snakeCase)
    }

    func testDetectCase_whenKebabCase_shouldReturnKebabCase() {
        let factory = CaseDetectorFactory()
        let result = try? factory.detectCase(of: "kebab-case-example")
        XCTAssertEqual(result, .kebabCase)
    }

    func testDetectCase_whenPascalCase_shouldReturnPascalCase() {
        let factory = CaseDetectorFactory()
        let result = try? factory.detectCase(of: "PascalCaseExample")
        XCTAssertEqual(result, .pascalCase)
    }

    func testDetectCase_whenTrainCase_shouldReturnTrainCase() {
        let factory = CaseDetectorFactory()
        let result = try? factory.detectCase(of: "Train-Case-Example")
        XCTAssertEqual(result, .trainCase)
    }

    func testDetectCase_whenScreamingSnakeCase_shouldReturnScreamingSnakeCase() {
        let factory = CaseDetectorFactory()
        let result = try? factory.detectCase(of: "SCREAMING_SNAKE_CASE")
        XCTAssertEqual(result, .screamingSnakeCase)
    }

    func testDetectCase_whenDotCase_shouldReturnDotCase() {
        let factory = CaseDetectorFactory()
        let result = try? factory.detectCase(of: "dot.case.example")
        XCTAssertEqual(result, .dotCase)
    }

    func testDetectCase_whenPathCase_shouldReturnPathCase() {
        let factory = CaseDetectorFactory()
        let result = try? factory.detectCase(of: "path/case/example")
        XCTAssertEqual(result, .pathCase)
    }

    func testDetectCase_whenMultipleSeparators_shouldThrowError() {
        let factory = CaseDetectorFactory()
        XCTAssertThrowsError(try factory.detectCase(of: "path-case.example")) { error in
            XCTAssertEqual(error as? CaserError, CaserError.multipleSeparators(separators: ["-", "."]))
        }
    }

    func testDetectCase_whenExtraSequencedSeparators_shouldThrowError() {
        let factory = CaseDetectorFactory()
        XCTAssertThrowsError(try factory.detectCase(of: "path//case")) { error in
            XCTAssertEqual(error as? CaserError, CaserError.extraSequencedSeparators(separators: ["//"]))
        }
    }

    func testDetectCase_whenMultipleExtraSequencedSeparators_shouldThrowError() {
        let factory = CaseDetectorFactory()
        XCTAssertThrowsError(try factory.detectCase(of: "path///case--example")) { error in
            XCTAssertEqual(error as? CaserError, CaserError.extraSequencedSeparators(separators: ["///", "--"]))
        }
    }

    func testDetectCase_whenUselessLeadingSeparator_shouldThrowError() {
        let factory = CaseDetectorFactory()
        XCTAssertThrowsError(try factory.detectCase(of: "-path/case")) { error in
            XCTAssertEqual(error as? CaserError, CaserError.uselessLeadingSeparator(separator: "-"))
        }
    }

    func testDetectCase_whenUselessTrailingSeparator_shouldThrowError() {
        let factory = CaseDetectorFactory()
        XCTAssertThrowsError(try factory.detectCase(of: "path/case-")) { error in
            XCTAssertEqual(error as? CaserError, CaserError.uselessTrailingSeparator(separator: "-"))
        }
    }

    func testDetectCase_whenUnknownCaseType_shouldThrowError() {
        let factory = CaseDetectorFactory()
        XCTAssertThrowsError(try factory.detectCase(of: "UNKNOWN")) { error in
            XCTAssertEqual(error as? CaserError, CaserError.unknownCaseType)
        }
    }
}
