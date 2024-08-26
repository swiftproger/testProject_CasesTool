//
//  PascalCaseDetector.swift
//

/// A detector that checks if a string follows the `PascalCase` format.
///
/// This detector checks if the string is in `PascalCase`, where each word starts with an uppercase letter,
/// and there are no separators between the words.
final class PascalCaseDetector: CaseDetector {

    /// The type of case this detector handles.
    ///
    /// Always returns `.pascalCase`.
    var caseType: CaseType { return .pascalCase }

    /// Checks if the given string matches the `PascalCase` format.
    ///
    /// This method verifies that the string has no separators, starts with an uppercase letter,
    /// and contains at least one lowercase letter in the subsequent words.
    ///
    /// - Parameter input: The string to check.
    /// - Returns: `True` if the string is in `PascalCase` format; otherwise, `False`.
    public func detect(_ input: String) -> Bool {
        let hasNoSeparators = !CaseType.containsSeparator(in: input)
        let startsWithUppercase = input.first?.isUppercase == true
        let containsLowercase = input.contains(where: \.isLowercase)

        return hasNoSeparators && startsWithUppercase && containsLowercase
    }
}
