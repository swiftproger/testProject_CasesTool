//
//  PathCaseDetector.swift
//

/// A detector for identifying strings in `path/case` format.
///
/// The `PathCaseDetector` checks whether a given string conforms to the `path/case` format,
/// where words are separated by slashes (`/`), and all letters are lowercase.
final class PathCaseDetector: CaseDetector {

    /// Determines whether the given string conforms to the `path/case` format.
    ///
    /// This method checks if the specified `CaseType` is `.pathCase`, verifies that the input string contains slashes,
    /// consists only of lowercase letters, and does not contain any other separators. It also ensures that the string
    /// has at least one non-separator character.
    ///
    /// - Parameters:
    ///   - input: The string to be analyzed.
    ///   - caseType: The `CaseType` that should be checked, which in this case should be `.pathCase`.
    /// - Returns: `True` if the string conforms to the `path/case` format; otherwise, `False`.
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .pathCase else { return false }
        guard let separator = CaseType.pathCase.separator else { return false }
        
        let containsSeparator = input.contains(separator)
        let isLowercaseOnly = input == input.lowercased()
        let noOtherSeparators = !CaseType.containsOtherSeparators(in: input, excluding: .pathCase)
        let hasValidCharacters = input.filter { $0 != separator }.isEmpty == false
        
        return containsSeparator && isLowercaseOnly && noOtherSeparators && hasValidCharacters
    }
}
