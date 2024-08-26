//
//  CamelCaseDetector.swift
//

/// A detector that checks if a string follows the `camelCase` format.
///
/// This detector checks if the string is in `camelCase`, where the first word starts with a lowercase letter,
/// and each subsequent word starts with an uppercase letter, with no separators between the words.
final class CamelCaseDetector: CaseDetector {
    
    /// The type of case this detector handles.
    ///
    /// Always returns `.camelCase`.
    var caseType: CaseType { return .camelCase }

    /// Checks if the given string matches the `camelCase` format.
    ///
    /// It verifies that the string has no separators, starts with a lowercase letter,
    /// and contains at least one uppercase letter in subsequent words.
    ///
    /// - Parameter input: The string to check.
    /// - Returns: `True` if the string is in `camelCase` format; otherwise, `False`.
    public func detect(_ input: String) -> Bool {
        let hasNoSeparators = !CaseType.containsSeparator(in: input)
        let startsWithLowercase = input.first?.isLowercase == true
        let containsUppercase = input.contains(where: \.isUppercase)
        
        return hasNoSeparators && startsWithLowercase && containsUppercase
    }
}
