//
//  KebabCaseDetector.swift
//

/// A detector for identifying strings in `kebab-case` format.
///
/// The `KebabCaseDetector` checks whether a given string conforms to the `kebab-case` format,
/// where words are separated by hyphens (`-`), and all letters are lowercase.
final class KebabCaseDetector: CaseDetector {

    /// Determines whether the given string conforms to the `kebab-case` format.
    ///
    /// This method checks if the specified `CaseType` is `.kebabCase`, verifies that the input string contains hyphens,
    /// consists only of lowercase letters, and does not contain any other separators. It also ensures that the string
    /// has at least one non-separator character.
    ///
    /// - Parameters:
    ///   - input: The string to be analyzed.
    ///   - caseType: The `CaseType` that should be checked, which in this case should be `.kebabCase`.
    /// - Returns: `True` if the string conforms to the `kebab-case` format; otherwise, `False`.
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .kebabCase else { return false }
        guard let separator = CaseType.kebabCase.separator else { return false }
        
        let containsSeparator = input.contains(separator)
        let isLowercaseOnly = input == input.lowercased()
        let noOtherSeparators = !CaseType.containsOtherSeparators(in: input, excluding: .kebabCase)
        let hasValidCharacters = input.filter { $0 != separator }.isEmpty == false
        
        return containsSeparator && isLowercaseOnly && noOtherSeparators && hasValidCharacters
    }
}
