//
//  ScreamingSnakeCaseDetector.swift
//

/// A detector that checks if a string follows the `SCREAMING_SNAKE_CASE` format.
///
/// This detector checks if the string is in `SCREAMING_SNAKE_CASE`, where words are separated by underscores (`_`),
/// and all letters are uppercase.
final class ScreamingSnakeCaseDetector: CaseDetector {
    
    /// The type of case this detector handles.
    ///
    /// Always returns `.screamingSnakeCase`.
    var caseType: CaseType { return .screamingSnakeCase }

    /// Checks if the given string matches the `SCREAMING_SNAKE_CASE` format.
    ///
    /// This method verifies that the string uses underscores (`_`) as separators,
    /// and that all letters in the string are uppercase.
    ///
    /// - Parameter input: The string to check.
    /// - Returns: `True` if the string is in `SCREAMING_SNAKE_CASE` format; otherwise, `False`.
    public func detect(_ input: String) -> Bool {
        return detectUsingSeparator(input, isUppercase: true)
    }
}
