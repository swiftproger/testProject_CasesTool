//
//  PathCaseDetector.swift
//

/// A detector that checks if a string follows the `path/case` format.
///
/// This detector checks if the string is in `path/case`, where words are separated by slashes (`/`),
/// and all letters are lowercase.
final class PathCaseDetector: CaseDetector {

    /// The type of case this detector handles.
    ///
    /// Always returns `.pathCase`.
    var caseType: CaseType { return .pathCase }

    /// Checks if the given string matches the `path/case` format.
    ///
    /// This method verifies that the string uses slashes (`/`) as separators,
    /// and that all letters in the string are lowercase.
    ///
    /// - Parameter input: The string to check.
    /// - Returns: `True` if the string is in `path/case` format; otherwise, `False`.
    public func detect(_ input: String) -> Bool {
        return detectUsingSeparator(input)
    }
}
