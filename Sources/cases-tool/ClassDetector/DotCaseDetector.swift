//
//  DotCaseDetector.swift
//

/// A detector for identifying strings in `dot.case` format.
///
/// The `DotCaseDetector` checks whether a given string conforms to the `dot.case` format,
/// where words are separated by periods (`.`), and all letters are lowercase.
final class DotCaseDetector: CaseDetector {

    /// Determines whether the given string conforms to the `dot.case` format.
    ///
    /// This method checks if the specified `CaseType` is `.dotCase`, verifies that the input string contains periods,
    /// consists only of lowercase letters, and does not contain any other separators. It also ensures that the string
    /// has at least one non-separator character.
    ///
    /// - Parameters:
    ///   - input: The string to be analyzed.
    ///   - caseType: The `CaseType` that should be checked, which in this case should be `.dotCase`.
    /// - Returns: `True` if the string conforms to the `dot.case` format; otherwise, `False`.
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .dotCase else { return false }
        guard let separator = CaseType.dotCase.separator else { return false }
        
        let containsSeparator = input.contains(separator)
        let isLowercaseOnly = input == input.lowercased()
        let noOtherSeparators = !CaseType.containsOtherSeparators(in: input, excluding: .dotCase)
        let hasValidCharacters = input.filter { $0 != separator }.isEmpty == false
        
        return containsSeparator && isLowercaseOnly && noOtherSeparators && hasValidCharacters
    }
}
