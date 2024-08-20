//
//  ScreamingSnakeCaseDetector.swift
//

/// A detector for identifying strings in `SCREAMING_SNAKE_CASE` format.
///
/// The `ScreamingSnakeCaseDetector` checks whether a given string conforms to the `SCREAMING_SNAKE_CASE` format,
/// where words are separated by underscores (`_`), and all letters are uppercase.
final class ScreamingSnakeCaseDetector: CaseDetector {

    /// Determines whether the given string conforms to the `SCREAMING_SNAKE_CASE` format.
    ///
    /// This method checks if the specified `CaseType` is `.screamingSnakeCase`, verifies that the input string contains underscores,
    /// consists only of uppercase letters, and does not contain any other separators. It also ensures that the string
    /// has at least one non-separator character.
    ///
    /// - Parameters:
    ///   - input: The string to be analyzed.
    ///   - caseType: The `CaseType` that should be checked, which in this case should be `.screamingSnakeCase`.
    /// - Returns: `True` if the string conforms to the `SCREAMING_SNAKE_CASE` format; otherwise, `False`.
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .screamingSnakeCase else { return false }
        guard let separator = CaseType.screamingSnakeCase.separator else { return false }
        
        let containsSeparator = input.contains(separator)
        let isUppercaseOnly = input == input.uppercased()
        let noOtherSeparators = !CaseType.containsOtherSeparators(in: input, excluding: .screamingSnakeCase)
        let hasValidCharacters = input.filter { $0 != separator }.isEmpty == false
        
        return containsSeparator && isUppercaseOnly && noOtherSeparators && hasValidCharacters
    }
}
