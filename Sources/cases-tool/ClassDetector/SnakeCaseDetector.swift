//
// SnakeCaseDetector.swift
//

/// A detector for identifying strings in `snake_case` format.
///
/// The `SnakeCaseDetector` checks whether a given string conforms to the `snake_case` format,
/// where words are separated by underscores (`_`), and all letters are lowercase.
final class SnakeCaseDetector: CaseDetector {

    /// Determines whether the given string conforms to the `snake_case` format.
    ///
    /// This method checks if the specified `CaseType` is `.snakeCase`, verifies that the input string contains underscores,
    /// consists only of lowercase letters, and does not contain any other separators. It also ensures that the string
    /// has at least one non-separator character.
    ///
    /// - Parameters:
    ///   - input: The string to be analyzed.
    ///   - caseType: The `CaseType` that should be checked, which in this case should be `.snakeCase`.
    /// - Returns: `True` if the string conforms to the `snake_case` format; otherwise, `False`.
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .snakeCase else { return false }
        guard let separator = CaseType.snakeCase.separator else { return false }
        
        let containsSeparator = input.contains(separator)
        let isLowercaseOnly = input == input.lowercased()
        let noOtherSeparators = !CaseType.containsOtherSeparators(in: input, excluding: .snakeCase)
        let hasValidCharacters = input.filter { $0 != separator }.isEmpty == false

        return containsSeparator && isLowercaseOnly && noOtherSeparators && hasValidCharacters
    }
}
