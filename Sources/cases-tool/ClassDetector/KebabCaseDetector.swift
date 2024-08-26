//
//  KebabCaseDetector.swift
//

/// A detector that checks if a string follows the `kebab-case` format.
///
/// This detector checks if the string is in `kebab-case`, where words are separated by hyphens (`-`),
/// and all letters are lowercase.
final class KebabCaseDetector: CaseDetector {
    
    /// The type of case this detector handles.
    ///
    /// Always returns `.kebabCase`.
    var caseType: CaseType { return .kebabCase }

    /// Checks if the given string matches the `kebab-case` format.
    ///
    /// This method verifies that the string uses hyphens (`-`) as separators,
    /// and that all letters in the string are lowercase.
    ///
    /// - Parameter input: The string to check.
    /// - Returns: `True` if the string is in `kebab-case` format; otherwise, `False`.
    public func detect(_ input: String) -> Bool {
        return detectUsingSeparator(input)
    }
}
