//
//  CamelCaseDetector.swift
//

/// A detector for identifying strings in `camelCase` format.
///
/// The `CamelCaseDetector` checks whether a given string conforms to the `camelCase` format,
/// where the first word starts with a lowercase letter, and each subsequent word starts with an uppercase letter
/// with no separators between the words.
final class CamelCaseDetector: CaseDetector {

    /// Determines whether the given string conforms to the `camelCase` format.
    ///
    /// This method first verifies that the specified `CaseType` is `.camelCase`. It then checks if the input string
    /// does not contain any separators, begins with a lowercase letter, and contains at least one uppercase letter.
    ///
    /// - Parameters:
    ///   - input: The string to be analyzed.
    ///   - caseType: The `CaseType` that should be checked, which in this case should be `.camelCase`.
    /// - Returns: `True` if the string conforms to the `camelCase` format; otherwise, `False`.
    public func detect(_ input: String, for caseType: CaseType) -> Bool {

        guard caseType == .camelCase else { return false }
        guard !CaseType.containsSeparator(in: input) else { return false }
        guard let firstChar = input.first, firstChar.isLowercase else { return false }
        
        return input.contains(where: \.isUppercase)
    }
}
