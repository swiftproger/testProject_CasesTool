//
// SnakeCaseDetector.swift
//

/// A detector that checks if a string follows the `snake_case` format.
///
/// This detector checks if the string is in `snake_case`, where words are separated by underscores (`_`),
/// and all letters are lowercase.
final class SnakeCaseDetector: CaseDetector {

    /// The type of case this detector handles.
    ///
    /// Always returns `.snakeCase`.
    var caseType: CaseType { return .snakeCase }

    /// Checks if the given string matches the `snake_case` format.
    ///
    /// This method verifies that the string uses underscores (`_`) as separators,
    /// and that all letters in the string are lowercase.
    ///
    /// - Parameter input: The string to check.
    /// - Returns: `True` if the string is in `snake_case` format; otherwise, `False`.
    public func detect(_ input: String) -> Bool {
        return detectUsingSeparator(input)
    }
}
