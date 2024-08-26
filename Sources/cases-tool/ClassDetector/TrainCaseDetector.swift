//
//  TrainCaseDetector.swift
//

/// A simple detector for checking if a string follows the `Train-Case` format.
///
/// This detector checks if the string is in `Train-Case`, where words are separated by hyphens (`-`),
/// and each word starts with an uppercase letter.
final class TrainCaseDetector: CaseDetector {

    /// The type of case this detector handles.
    ///
    /// Always returns `.trainCase`.
    var caseType: CaseType { return .trainCase }

    /// Checks if the given string matches the `Train-Case` format.
    ///
    /// It first ensures the string has valid separators (hyphens) and then verifies that
    /// each word starts with an uppercase letter.
    ///
    /// - Parameter input: The string to check.
    /// - Returns: `True` if the string is in `Train-Case` format; otherwise, `False`.
    public func detect(_ input: String) -> Bool {
        
        guard let separator = caseType.separator else { return false }
        guard hasValidSeparatorStructure(input) else { return false }
        
        return input
            .split(separator: separator)
            .allSatisfy { $0.first?.isUppercase == true }
    }
}
