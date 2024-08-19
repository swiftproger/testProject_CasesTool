//
//  CaseDetector.swift
//

/// A protocol for detecting if a given string conforms to a specific case type.
///
/// Conforming types must implement the `detect(_:for:)` method, which checks whether
/// a given string matches a specified `CaseType`. This protocol is intended to be used
/// in conjunction with various case types such as `camelCase`, `snake_case`, `PascalCase`, etc.
public protocol CaseDetector {

    /// Determines whether a given string conforms to the specified `CaseType`.
    ///
    /// - Parameters:
    ///   - input: The string to be checked.
    ///   - caseType: The `CaseType` against which the string is to be validated.
    /// - Returns: A Boolean value indicating whether the string matches the specified `CaseType`.
    func detect(_ input: String, for caseType: CaseType) -> Bool
}
