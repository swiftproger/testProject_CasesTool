////
////  CaseTypeTests.swift
////
//
//import XCTest
//@testable import cases_tool
//
//final class CaseTypeTests: XCTestCase {
//    
//    func testContainsSeparator_shouldReturnTrueWhenSeparatorExists() {
//        let input = "this_is_snake_case"
//        let result = CaseType.containsSeparator(in: input)
//        XCTAssertTrue(result)
//    }
//    
//    func testContainsSeparator_shouldReturnFalseWhenNoSeparatorExists() {
//        let input = "thisIsCamelCase"
//        let result = CaseType.containsSeparator(in: input)
//        XCTAssertFalse(result)
//    }
//    
//    func testContainsSeparator_shouldReturnTrueForMultipleSeparators() {
//        let input = "this-is-mixed.case"
//        let result = CaseType.containsSeparator(in: input)
//        XCTAssertTrue(result)
//    }
//    
//    func testContainsOtherSeparators_shouldReturnTrueWhenOtherSeparatorsExist() {
//        let input = "this-is-mixed_case"
//        let result = CaseType.containsOtherSeparators(in: input, excluding: CaseType.kebabCase)
//        XCTAssertTrue(result)
//    }
//    
//    func testContainsOtherSeparators_shouldReturnFalseWhenNoOtherSeparatorsExist() {
//        let input = "this-is-kebab-case"
//        let result = CaseType.containsOtherSeparators(in: input, excluding: CaseType.kebabCase)
//        XCTAssertFalse(result)
//    }
//    
//    func testContainsOtherSeparators_shouldReturnFalseWhenOnlyExcludingSeparatorExists() {
//        let input = "this_is_snake_case"
//        let result = CaseType.containsOtherSeparators(in: input, excluding: CaseType.snakeCase)
//        XCTAssertFalse(result)
//    }
//    
//    func testContainsOtherSeparators_shouldReturnTrueWhenMultipleSeparatorsExist() {
//        let input = "path/to.file"
//        let result = CaseType.containsOtherSeparators(in: input, excluding: CaseType.pathCase)
//        XCTAssertTrue(result)
//    }
//}
