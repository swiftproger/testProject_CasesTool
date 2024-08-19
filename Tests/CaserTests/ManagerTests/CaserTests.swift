import XCTest
@testable import cases_tool

//final class CaserTests: XCTestCase {
//    
//    func testCorrectCaseRecognition() throws {
//        
//        /// given
//        let testData: [String: CaseType] = [
//            "kebab-case-string-here" : .kebabCase,
//            "snake_case_string_here" : .snakeCase,
//            "Train-Case-String-Here" : .trainCase,
//            "SCREAMING_SNAKE_CASE"   : .screamingSnakeCase,
//            "dot.case.string.here"   : .dotCase,
//            "path/case/string/here"  : .pathCase,
//            "camelCaseStringHere"    : .camelCase,
//            "PascalCaseStringHere"   : .pascalCase
//        ]
//        
//        for data in testData {
//            
//            /// when
//            let caseType = try recognizeCase(from: data.key)
//            
//            /// then
//            XCTAssertEqual(caseType, data.value)
//        }
//    }
//    
//    func testCaseRecognitionErrors() throws {
//        
//        /// given
//        let testData: [String: CaserError] = [
//            
//            /// multipleSeparators
//            "no-separator.in-this.string" : .multipleSeparators(separators: ["-", ".", "-", "."]),
//            "check|this|out.now"          : .multipleSeparators(separators: ["|", "|", "."]),
//            "multi.separators-here_now"   : .multipleSeparators(separators: [".", "-", "_"]),
//            "this,has;many|separators"    : .multipleSeparators(separators: [",", ";", "|"]),
//            
//            /// uselessLeadingSeparator
//            "-start-with-dash"            : .uselessLeadingSeparator(separator: "-"),
//            "_start_with_underscore"      : .uselessLeadingSeparator(separator: "_"),
//            ".start.with.dot"             : .uselessLeadingSeparator(separator: "."),
//            "/start/with/slash"           : .uselessLeadingSeparator(separator: "/"),
//            
//            /// uselessTrailingSeparator
//            "end-with-dash-"              : .uselessTrailingSeparator(separator: "-"),
//            "end_with_underscore_"        : .uselessTrailingSeparator(separator: "_"),
//            "end.with.dot."               : .uselessTrailingSeparator(separator: "."),
//            "end/with/slash/"             : .uselessTrailingSeparator(separator: "/"),
//            
//            /// extraSequencedSeparators
//            "multiple--dashes"            : .extraSequencedSeparators(separators: ["--"]),
//            "underscores__in__sequence"   : .extraSequencedSeparators(separators: ["__", "__"]),
//            "dots...are...here"           : .extraSequencedSeparators(separators: ["...", "..."]),
//            "slashes//are//here"          : .extraSequencedSeparators(separators: ["//", "//"]),
//            "mixed--__separators"         : .extraSequencedSeparators(separators: ["--", "__"]),
//            
//            /// unknownCaseType
//            "incorrect.dot.Case"          : .unknownCaseType,
//            "incorrect/path/Case"         : .unknownCaseType
//        ]
//        
//        for data in testData {
//            /// when
//            XCTAssertThrowsError(try recognizeCase(from: data.key)) { error in
//                /// then
//                if let error = error as? CaserError {
//                    XCTAssertEqual(error.errorDescription, data.value.errorDescription)
//                } else {
//                    XCTFail("Unknown error type")
//                }
//            }
//        }
//    }
//    
//    func testCaseConvertation() throws {
//        
//        /// given
//        
//        let testStrings = [
//            "example_string",
//            "example-string",
//            "exampleString",
//            "ExampleString",
//            "Example-String",
//            "EXAMPLE_STRING",
//            "example.string",
//            "example/string"
//        ]
//        
//        let templateConversions: [CaseType: String] = [
//            .snakeCase: "example_string",
//            .kebabCase: "example-string",
//            .camelCase: "exampleString",
//            .pascalCase: "ExampleString",
//            .trainCase: "Example-String",
//            .screamingSnakeCase: "EXAMPLE_STRING",
//            .dotCase: "example.string",
//            .pathCase: "example/string"
//        ]
//        
//        for testString in testStrings {
//            for caseType in CaseType.allCases {
//                /// when
//                let result = try convertCase(of: testString, to: caseType)
//                let correctCase = templateConversions[caseType]
//                /// then
//                XCTAssertEqual(result, correctCase)
//            }
//        }
//    }
//}
