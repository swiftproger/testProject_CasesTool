//
//  DotCaseDetector.swift
//

/// A detector that checks if a string follows the `dot.case` format.
///
/// This detector checks if the string is in `dot.case`, where words are separated by dots (`.`),
/// and all letters are lowercase.
final class DotCaseDetector: CaseDetector {
    
    /// The type of case this detector handles.
    ///
    /// Always returns `.dotCase`.
    var caseType: CaseType { return .dotCase }

    /// Checks if the given string matches the `dot.case` format.
    ///
    /// This method verifies that the string uses dots (`.`) as separators,
    /// and that all letters in the string are lowercase.
    ///
    /// - Parameter input: The string to check.
    /// - Returns: `True` if the string is in `dot.case` format; otherwise, `False`.
    public func detect(_ input: String) -> Bool {
        return detectUsingSeparator(input)
    }
}
