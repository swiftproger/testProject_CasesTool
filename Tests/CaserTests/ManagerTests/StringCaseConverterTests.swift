//
//  StringCaseConverterTests.swift
//

import XCTest
@testable import cases_tool

//final class StringCaseConverterTests: XCTestCase {
//    
//    let factory = CaseDetectorFactory()
//    
//    func testConvert_camelCaseToSnakeCase() {
//        let converter = StringCaseConverter(factory: factory)
//        let result = try? converter.convert("someVariableName", to: .snakeCase)
//        XCTAssertEqual(result, "some_variable_name")
//    }
//    
//    func testConvert_kebabCaseToPascalCase() {
//        let converter = StringCaseConverter(factory: factory)
//        let result = try? converter.convert("some-variable-name", to: .pascalCase)
//        XCTAssertEqual(result, "SomeVariableName")
//    }
//    
//    func testConvert_snakeCaseToCamelCase() {
//        let converter = StringCaseConverter(factory: factory)
//        let result = try? converter.convert("some_variable_name", to: .camelCase)
//        XCTAssertEqual(result, "someVariableName")
//    }
//    
//    func testConvert_pascalCaseToTrainCase() {
//        let converter = StringCaseConverter(factory: factory)
//        let result = try? converter.convert("SomeVariableName", to: .trainCase)
//        XCTAssertEqual(result, "Some-Variable-Name")
//    }
//    
//    func testConvert_screamingSnakeCaseToDotCase() {
//        let converter = StringCaseConverter(factory: factory)
//        let result = try? converter.convert("SOME_VARIABLE_NAME", to: .dotCase)
//        XCTAssertEqual(result, "some.variable.name")
//    }
//    
//    func testConvert_pathCaseToCamelCase() {
//        let converter = StringCaseConverter(factory: factory)
//        let result = try? converter.convert("folder/subfolder/file", to: .camelCase)
//        XCTAssertEqual(result, "folderSubfolderFile")
//    }
//    
//    func testConvert_dotCaseToPascalCase() {
//        let converter = StringCaseConverter(factory: factory)
//        let result = try? converter.convert("my.object.property", to: .pascalCase)
//        XCTAssertEqual(result, "MyObjectProperty")
//    }
//    
//    func testConvert_kebabCaseToKebabCase_shouldReturnSameString() {
//        let converter = StringCaseConverter(factory: factory)
//        let input = "some-variable-name"
//        let result = try? converter.convert(input, to: .kebabCase)
//        XCTAssertEqual(result, input)
//    }
//    
//    func testConvert_shouldThrowErrorForMixedSeparators() {
//        let converter = StringCaseConverter(factory: factory)
//        XCTAssertThrowsError(try converter.convert("check|this|out.now", to: .camelCase)) { error in
//            XCTAssertEqual(error as? CaserError, CaserError.multipleSeparators(separators: ["|", "|", "."]))
//        }
//    }
//}
