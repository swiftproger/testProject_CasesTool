//
//  PascalCaseDetector.swift
//

/// A detector for identifying strings in `PascalCase` format.
///
/// The `PascalCaseDetector` checks whether a given string conforms to the `PascalCase` format,
/// where each word starts with an uppercase letter, and there are no separators between the words.
final class PascalCaseDetector: CaseDetector {

    /// Determines whether the given string conforms to the `PascalCase` format.
    ///
    /// This method first verifies that the specified `CaseType` is `.pascalCase`. It then checks if the input string
    /// does not contain any separators, begins with an uppercase letter, and contains at least one lowercase letter.
    ///
    /// - Parameters:
    ///   - input: The string to be analyzed.
    ///   - caseType: The `CaseType` that should be checked, which in this case should be `.pascalCase`.
    /// - Returns: `True` if the string conforms to the `PascalCase` format; otherwise, `False`.
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .pascalCase else { return false }
        
        let hasNoSeparators = !CaseType.containsSeparator(in: input)
        let startsWithUppercase = input.first?.isUppercase == true
        let containsLowercase = input.contains(where: \.isLowercase)
        
        return hasNoSeparators && startsWithUppercase && containsLowercase
    }
}
